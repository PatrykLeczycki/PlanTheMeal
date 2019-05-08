package pl.patlec.model;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Entity
@Data
@RequiredArgsConstructor
public class Recipe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotNull
    private String name;

    @NotNull
    private String ingredients; // TODO: create ingredient entity

    @NotNull
    private String description;

    @NotNull
    private LocalDateTime created;

    private LocalDateTime updated;

    @NotNull
    private Integer preparationTime;

    @NotNull
    private String preparation;

    @ManyToOne
    @NotNull
    private User author;
}
