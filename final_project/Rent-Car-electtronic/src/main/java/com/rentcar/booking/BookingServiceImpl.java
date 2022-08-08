package com.rentcar.booking;


import com.rentcar.carinfo.model.CarinfoDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service("com.rentcar.booking.BookingServiceImpl")
public class BookingServiceImpl implements BookingService{

    @Autowired
    private BookingMapper mapper;

    @Override
    public int create(BookingDTO dto) {
        return mapper.create(dto);
    }

    @Override
    public BookingDTO read(int booking_no) {
        return mapper.read(booking_no);
    }

    @Override
    public int update(BookingDTO dto) {
        return mapper.update(dto);
    }

    @Override
    public int delete(int booking_no) {
        return mapper.delete(booking_no);
    }

    @Override
    public List<BookingDTO> list(Map map) {
        return mapper.list(map);
    }

    @Override
    public int total(Map map) {
        return mapper.total(map);
    }

    @Override
    public List<CarinfoDTO> searchList(Map map) {
        return mapper.searchList(map);
    }

    @Override
    public List<CarinfoDTO> search(Map map) {
        return mapper.search(map);
    }
}