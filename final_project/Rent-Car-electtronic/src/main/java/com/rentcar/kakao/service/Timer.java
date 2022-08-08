package com.rentcar.kakao.service;

public class Timer {

    public Long start() {
        // 소스 실행전 시간 취득
        return System.currentTimeMillis();

    }

    public long end() {
        return System.currentTimeMillis();

    }

    public void showtime(long start, long end){
        System.out.println("실행 시간 : " + (end - start) / 1000.0 +"초");
    }
}
