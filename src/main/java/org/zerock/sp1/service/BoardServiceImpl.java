package org.zerock.sp1.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.zerock.sp1.domain.Board;
import org.zerock.sp1.dto.BoardDTO;
import org.zerock.sp1.dto.ListDTO;
import org.zerock.sp1.dto.ListResponseDTO;
import org.zerock.sp1.mapper.BoardMapper;

import java.util.List;
import java.util.stream.Collectors;
//controller, repository, service 3가지 기억하기

@Service
@RequiredArgsConstructor
@Log4j2
public class BoardServiceImpl implements BoardService{

    private final BoardMapper boardMapper;
    private final ModelMapper modelMapper;

    //글쓰기 등록
    @Override
    public void insert(BoardDTO boardDTO) {

        Board board = Board.builder().title(boardDTO.getTitle())
                                    .content(boardDTO.getContent())
                                    .writer(boardDTO.getWriter()).build();

        boardMapper.insert(board);
        
    }

    @Override
    public ListResponseDTO<BoardDTO> getList(ListDTO listDTO) {
        List<Board> boardList = boardMapper.selectList(listDTO);

        List<BoardDTO> dtoList =
                boardList.stream()
                        .map(board -> modelMapper.map(board, BoardDTO.class))
                        .collect(Collectors.toList());

        return ListResponseDTO.<BoardDTO>builder()
                .dtoList(dtoList)
                .total(boardMapper.getTotal(listDTO))
                .build();
    }

    @Override
    public void delete(Integer bno){
        boardMapper.delete(bno);
    }

    @Override
    public void update(Board board) {
        boardMapper.update(board);
    }
}
