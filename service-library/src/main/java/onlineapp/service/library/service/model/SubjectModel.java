package onlineapp.service.library.service.model;

import java.io.Serializable;
import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

@Data
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class SubjectModel implements Serializable {

  @NotBlank private String subject;

  @NotBlank private String subjectGroup;

  @NotBlank private String subjectCode;

  @NotBlank private String examSeries;

  @NotBlank private String examLevel;
}
