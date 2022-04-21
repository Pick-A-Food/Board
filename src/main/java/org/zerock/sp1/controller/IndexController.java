package org.zerock.sp1.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log4j2
@Controller
@RequiredArgsConstructor
public class IndexController {

    @GetMapping("/") //공백으로 놔도 됨.
    public String index(){
        return "redirect:/index";
        //send Redirect!
    }


}
