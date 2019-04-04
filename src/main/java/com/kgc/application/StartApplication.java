package com.kgc.application;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Auther: 黄高层
 * @Date: 2019/4/3 09:21
 * @Description:
 */
//@SpringBootApplication配置组件包扫描自动装配
@SpringBootApplication(scanBasePackages = "com.kgc.*")
//配置Mapper关联Mybatis
@MapperScan(basePackages = "com.kgc.mapper")
//配置默认访问首页1
@Controller
public class StartApplication {
    public static void main(String[] args) {
        //启动springboot容器
        SpringApplication.run(StartApplication.class);
    }
    //配置默认访问首页2
    @RequestMapping("/")
    public String defaultPage(){
        return "/pages/admin/index.jsp";
    }


}
