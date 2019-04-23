package pl.patlec.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Entity
@Data
@RequiredArgsConstructor
public class RecipePlan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
    private List<Recipe> recipes;

    private String mealName;

    private int sequence;

    @ManyToOne
    private Weekday weekday;

    @ManyToOne
    private Plan plan;
}
