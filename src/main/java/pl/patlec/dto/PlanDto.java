package pl.patlec.dto;

import lombok.Data;
import lombok.RequiredArgsConstructor;
import javax.validation.constraints.NotEmpty;

@Data
@RequiredArgsConstructor
public class PlanDto {

    @NotEmpty
    private String name;

    @NotEmpty
    private String description;
}
