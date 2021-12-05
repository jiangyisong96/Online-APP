package onlineapp.service.library.service.model;

import java.util.List;
import javax.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UniqueLinkResitSummaryModel {

  @NotBlank private long applicationId;

  private List<SubjectModel> subjectList;
}
