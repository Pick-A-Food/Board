package org.zerock.sp1.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.sp1.domain.Board;
import org.zerock.sp1.dto.BoardDTO;
import org.zerock.sp1.dto.ListDTO;
import org.zerock.sp1.dto.ListResponseDTO;
import org.zerock.sp1.dto.PageMaker;
import org.zerock.sp1.service.BoardService;

import java.util.List;

@Log4j2 // System.out.print 사용하지 말자. 이것만 사용안해도 성능이 10퍼는 좋아짐
@Controller         //   뒤에 '/'써도 되고 안써도 됨
@RequestMapping("/board/") //get, post 상관없이 다 처리하기 위해 사용.. , annotation 기본은 value
@RequiredArgsConstructor
public class BoardController {

    private final BoardService service;

    @GetMapping("/") //공백으로 놔도 됨.
    public String basic(){
        return "redirect:/board/list";
                //send Redirect!
    }

    @GetMapping("/list")
    public void list( ListDTO listDTO, Model model){
                    //@ModelAttribute(name = "cri") 을 사용하면 이름 설정 가능
                    // DTO 는 아무것도 안해도 전달된다!

                    //@RequestParam(name="page", defaultValue = "1", required = true) int page
                    //별로 좋지 않은 함수.. -100page 등 잘못된 수를 막지 못한다.. 그래서 dto로 설계하는 게 나음
        log.info("board list.........");
                    // log.info("page : "+page);

        log.info(listDTO);
        ListResponseDTO<BoardDTO> responseDTO = service.getList(listDTO);
        PageMaker pageMaker = new PageMaker(listDTO, responseDTO.getTotal());
        model.addAttribute("listDTO", listDTO);
        model.addAttribute("dtoList", responseDTO.getDtoList());
        model.addAttribute("pageMaker", pageMaker);
    }


    @GetMapping("/register")
    public void registerGET(){

    }


    @PostMapping("/register")
    public String registerPOST(BoardDTO boardDTO, RedirectAttributes rttr){
        log.info("post................");
        log.info(boardDTO);

        /* 중요 !!!! */
        // rttr.addAllAttributes()  -> 계속 똑같이 문자열 만들어냄
        // rttr.addAttribute("num",321);
        rttr.addFlashAttribute("result", 123);
        service.insert(boardDTO);

        return "redirect:/board/list";
    }

    @PostMapping("/delete")
    public String delete(Integer bno){
        service.delete(bno);
        return "redirect:/board/list";
    }

    @PostMapping("/update")
    public String update(Board board){
        service.update(board);
        return "redirect:/board/read?bno=" + board.getBno();
    }

    @GetMapping("/read/{bno}")
    public String read(@PathVariable("bno") int bno, ListDTO listDTO , Model model){

        log.info("bno" , bno);
        log.info("listDTO",listDTO);

        Board boardDetail = service.getRead(bno);
        model.addAttribute("listDTO", listDTO);
        model.addAttribute("boardDetail",boardDetail);


        return "/board/read";
    }
}
