package onlineapp.service.library.service.model.user;

import javax.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

/**
 * Candidate Details Model to update private candidate's profile.
 *
 * @author Wen Xiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@SuperBuilder
public class UpdateCandidateModel extends CandidateBaseModel {

  @Valid private ContactNumberModel mobileNumber;

  @Valid private ContactNumberModel phoneNumber;
}
