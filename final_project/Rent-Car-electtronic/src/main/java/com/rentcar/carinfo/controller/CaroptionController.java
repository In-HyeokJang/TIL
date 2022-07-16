package com.rentcar.carinfo.controller;

import com.rentcar.carinfo.service.CaroptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class CaroptionController {

    @Autowired
    @Qualifier(("com.rentcar.carinfo.service.CaroptionServiceImpl"))
    private CaroptionService service;

}
