package com.kgc.contrlloer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Auther: 黄高层
 * @Date: 2019/4/3 09:27
 * @Description:
 */
@Controller
public class TestContrlloer {
    @RequestMapping("/test1")
    public @ResponseBody String test1(){
        return "nihao!";
    }
}
