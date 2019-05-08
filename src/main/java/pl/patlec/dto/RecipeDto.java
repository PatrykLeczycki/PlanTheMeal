package pl.patlec.dto;

import lombok.Data;
import lombok.RequiredArgsConstructor;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

@Data
@RequiredArgsConstructor
public class RecipeDto {

    @NotEmpty
    private String name;
    
    private String ingredients; // TODO: create ingredient entity

    @NotEmpty
    private String description;

    @NotNull
    @Min(value=1, message = "preparation time must be greater than 0")
    private Integer preparationTime;

    private String preparation;
}
