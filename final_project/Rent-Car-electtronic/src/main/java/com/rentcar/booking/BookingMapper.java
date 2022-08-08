package com.rentcar.booking;



import com.rentcar.carinfo.model.CarinfoDTO;

import java.util.List;
import java.util.Map;

public interface BookingMapper {
    int create(BookingDTO dto);
    BookingDTO read(int booking_no);
    int update(BookingDTO dto);
    int delete(int booking_no);
    List<BookingDTO> list(Map map);
    int total(Map map);
    List<CarinfoDTO> searchList(Map map);
    List<CarinfoDTO> search(Map map);
}