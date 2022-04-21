package org.zerock.sp1.service;

import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.zerock.sp1.domain.Board;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations="file:src/main/webapp/WEB-INF/root-context.xml")
@Log4j2
public class BoardServiceTests {

    @Autowired(required = false)
    private BoardService boardservice;

    @Test
    public void testDelete(){
        boardservice.delete(3);
    }

    @Test
    public void testUpdate(){
        Board board = Board.builder()
                .title("수정된 제목")
                .content("수정된 내용")
                .bno(7)
                .build();
        boardservice.update(board);


    }


}
