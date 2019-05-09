package pl.patlec.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

@Entity
@Data
@RequiredArgsConstructor
public class Meal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @NotNull
    private Recipe recipe;

    @NotNull
    private String name;

    @Min(value=1, message = "Value must be greater than 0")
    private Integer sequence;

    @ManyToOne
    @NotNull
    private Weekday weekday;

    @ManyToOne
    @NotNull
    private Plan plan;
}
