package com.kh.spring.dm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
  @RequestMapping("homeView")
  public String viewHome() {
    return "mainView";
  }
}
