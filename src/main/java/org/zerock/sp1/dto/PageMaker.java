package org.zerock.sp1.dto;

import lombok.Data;

@Data
public class PageMaker {

    private int page; //현재 페이지번호
    private int size; // 한번에 보여줄 게시물 수
    private int start,end;

    private boolean prev,next;

    private int total; //전체 데이터의 수

    public PageMaker(ListDTO listDTO, int total) {
        int page = listDTO.getPage();
        int size = listDTO.getSize();
        this.page = Math.max(1, page);
        this.size = Math.max(10, size);
        this.total = total;
        //listDTO가 파라미터로 들어가도 괜찬하ㅏㅏㅏ..?

        //가짜 end
        int tempEnd = (int)(Math.ceil(this.page/10.0) * 10);

        this.start = tempEnd - 9;

        this.prev = this.start != 1;

        //진짜 end
        if(tempEnd * this.size >= total) {
            this.end = (int)(Math.ceil(total/(double)this.size));
            this.next = false;
        }else {
            this.end = tempEnd;
            this.next = true;
        }

    }

}