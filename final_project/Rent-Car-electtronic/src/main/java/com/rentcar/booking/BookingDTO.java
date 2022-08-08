package com.rentcar.booking;

import lombok.Data;

@Data
public class BookingDTO {
    private int booking_no;
    private String rent_day;
    private String rent_time;
    private String return_day;
    private String return_time;
    private String user_id;
    private String reserved_car;
    private String insurance;
}