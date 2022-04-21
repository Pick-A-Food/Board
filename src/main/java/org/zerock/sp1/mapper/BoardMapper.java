package org.zerock.sp1.mapper;

import org.zerock.sp1.domain.Board;
import org.zerock.sp1.dto.BoardDTO;
import org.zerock.sp1.dto.ListDTO;

import java.util.List;

public interface BoardMapper {

    void insert(Board board); //보드 인서트
    Board selectOne(Integer bno); //하나의 게시물
    void update(Board board); //보드 하나의 게시물 수정
    List<Board> selectList(ListDTO listDTO);
    int getTotal(ListDTO listDTO);

    void delete(Integer bno);
    }

    //@Param(("skip")) int skip, @Param("size")int size); //보드 리스트

