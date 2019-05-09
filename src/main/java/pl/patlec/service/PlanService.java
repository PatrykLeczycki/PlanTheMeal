package pl.patlec.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import pl.patlec.dto.PlanDto;
import pl.patlec.model.Plan;
import pl.patlec.model.Prompt;
import pl.patlec.model.User;
import pl.patlec.repo.PlanRepository;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class PlanService {

    private final PlanRepository planRepository;
    private final UserService userService;
    private final MealService mealService;
    private final Prompt prompt;

    public List<Plan> all(){
        return planRepository.findAll();
    }

    public Plan getById(Long id){
        return planRepository.getOne(id);
    }

    public Long getUserLastPlanId(Principal principal){
        return planRepository.findTopByAuthorOrderByCreatedDesc(userService.findUserByEmail(principal.getName())).getId();
    }

    public Long countByUser(User user){
        return planRepository.countAllByAuthor(user);
    }

    public void add(PlanDto planDto, Principal principal){

        Plan plan = new Plan();

        plan.setName(planDto.getName());
        plan.setDescription(planDto.getDescription());
        plan.setCreated(LocalDateTime.now());
        plan.setAuthor(userService.findUserByEmail(principal.getName()));

        planRepository.save(plan);
    }

    public void delete(Plan plan){
        if(mealService.countAllByPlan(plan) > 0)
            prompt.add("mealinplan");
        else planRepository.delete(plan);
    }
}
