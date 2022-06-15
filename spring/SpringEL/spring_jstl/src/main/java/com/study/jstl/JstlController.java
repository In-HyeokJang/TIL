package com.study.jstl;

import java.util.HashMap;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JstlController {
  
  @GetMapping
  public String home(Model model) {
    
    return "jstl/useFunctions";
  }
}
