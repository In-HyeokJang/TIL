package com.rentcar.support.service;

import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class HaversineDistance {

    final int R = 6371; // Radious of the earth
    public void haversine(Map<String, String> center, Map<String, String> target){

        Double lat1 = Double.parseDouble(center.get("lat"));
        Double lon1 = Double.parseDouble(center.get("lng"));
        Double lat2 = Double.parseDouble(target.get("lat"));
        Double lon2 = Double.parseDouble(target.get("lng"));

        Double latDistance = toRad(lat2-lat1);
        Double lonDistance = toRad(lon2-lon1);

        Double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2) +
                Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) *
                        Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
        Double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));

        Double distance = R * c;

        System.out.println("The distance between two lat and long is!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!::" + distance);
    }

    private Double toRad(Double value) {
        return value * Math.PI / 180;
    }
}
