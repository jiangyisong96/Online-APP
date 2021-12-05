package onlineapp.service.library.service.model;

import java.util.List;
import javax.validation.constraints.NotEmpty;
import lombok.Data;

@Data
public class SubjectListModel {

  @NotEmpty List<SubjectModel> subjectModelList;
}
