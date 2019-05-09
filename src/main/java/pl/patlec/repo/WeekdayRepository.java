package pl.patlec.repo;


import org.springframework.data.jpa.repository.JpaRepository;
import pl.patlec.model.Weekday;

public interface WeekdayRepository extends JpaRepository<Weekday, Long> {

}
