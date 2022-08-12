package com.rentcar.support.controller;

import com.google.gson.Gson;
import com.rentcar.support.model.Request;
import com.rentcar.support.service.RequestServiceImpl;
import com.rentcar.support.service.SupportServiceImpl;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.util.HashMap;
import java.util.Map;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

@WebMvcTest(RequestRestController.class)
class RequestRestControllerTest {

    @Autowired
    MockMvc mvc;

    @MockBean
    RequestServiceImpl requestService;

    @MockBean
    SupportServiceImpl supportService;

    @Test
    @DisplayName("차량 상태 변경 테스트")
    void update() throws Exception {
        Map<String, String> map = new HashMap<>();
        map.put("carnum","1234");
        map.put("state","going");

        Gson gson = new Gson();
        String content = gson.toJson(map);


        mvc.perform(post("/request/help/update")
                .contentType(MediaType.APPLICATION_JSON)
                .content(content))
                .andExpect(status().isOk());
    }

    @Test
    @DisplayName("요청 입력 테스트")
    void request() throws Exception {
        Request request = new Request();

        request.setCarnum("12가1234");
        request.setReason("방전");
        request.setRx("12");
        request.setRy("14");

        Gson gson = new Gson();
        String content = gson.toJson(request);


        mvc.perform(post("/request/help")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(content))
                .andExpect(status().isOk());
    }

    @Test
    @DisplayName("log 입력 테스트")
    void log() throws Exception {

        mvc.perform(get("/request/help/complete/12가1235"))
                .andExpect(status().isOk());
    }
}