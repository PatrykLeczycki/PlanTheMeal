package pl.patlec.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.patlec.model.Meal;
import pl.patlec.model.Plan;

import java.util.List;

public interface MealRepository extends JpaRepository<Meal, Long> {

    List<Meal> findAllByPlanOrderByWeekdayIdAscSequenceAsc(Plan plan);


}
