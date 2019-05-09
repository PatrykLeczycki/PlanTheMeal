package pl.patlec.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pl.patlec.model.Weekday;
import pl.patlec.repo.WeekdayRepository;

import java.util.List;

@RequiredArgsConstructor
@Service
public class WeekdayService {

    private final WeekdayRepository weekdayRepository;

    public List<Weekday> all(){
        return weekdayRepository.findAll();
    }

}
