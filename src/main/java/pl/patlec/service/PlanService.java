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
import java.util.Objects;

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

        Plan lastPlan = planRepository.findTopByAuthorOrderByCreatedDesc(userService.findUserByEmail(principal.getName()));

        if(!Objects.isNull(lastPlan))
            return lastPlan.getId();
        return null;
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

    public boolean edit(Plan plan, String name, String description, Principal principal){


        User loggedUser = userService.findUserByEmail(principal.getName());

        if((!loggedUser.equals(plan.getAuthor()) && !userService.isAdmin(loggedUser))){
            prompt.getNames().add("accessdenied");
        } else if(name.length() < 1 || description.length() < 1 || (!loggedUser.equals(plan.getAuthor()) && !userService.isAdmin(loggedUser))){
            if(name.length() < 1)
                prompt.getNames().add("emptyname");
            if(description.length() < 1)
                prompt.getNames().add("emptydesc");

            return false;
        }

        plan.setName(name);
        plan.setDescription(description);

        planRepository.save(plan);

        return true;
    }

    public void delete(Plan plan, Principal principal){

        User loggedUser = userService.findUserByEmail(principal.getName());

        if(!loggedUser.equals(plan.getAuthor()) && !userService.isAdmin(loggedUser)){
            prompt.add("accessdenied");
        }
        else if(mealService.countAllByPlan(plan) > 0){
            prompt.add("mealinplan");
            prompt.getAdditionalInfo().put("mealinplanwithid", "" + plan.getId());
        }
        else planRepository.delete(plan);
    }
}
