package com.rentcar.support.service;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.HashMap;
import java.util.Map;

class HaversineDistanceTest {

    final int R = 6371; // Radious of the earth


    @Test
    public void test() {
        Map<String, String> cen = new HashMap<>();
        Map<String, String> target = new HashMap<>();

        cen.put("lat", "36.618637474678");
        cen.put("lng","127.46825133157");
        target.put("lat", "36.610986729739");
        target.put("lng","127.4685373854");

        Double lat1 = Double.parseDouble(cen.get("lat"));
        Double lon1 = Double.parseDouble(cen.get("lng"));
        Double lat2 = Double.parseDouble(target.get("lat"));
        Double lon2 = Double.parseDouble(target.get("lng"));

        Double latDistance = toRad(lat2-lat1);
        Double lonDistance = toRad(lon2-lon1);

        Double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2) +
                Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) *
                        Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
        Double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));

        Double distance = R * c;
        System.out.println("The distance between two lat and long is::" + distance + "km");

    }

    private Double toRad(Double value) {
        return value * Math.PI / 180;
    }


}