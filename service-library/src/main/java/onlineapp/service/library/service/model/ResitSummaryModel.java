package onlineapp.service.library.service.model;

import onlineapp.service.library.enumeration.ApplicationType;
import onlineapp.service.library.service.model.user.CandidateModel;
import javax.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Resit Summary Model to retrieve resit registration details.
 *
 * @author WenXiang
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ResitSummaryModel {

  @Valid SubjectSummaryModel subjectSummary;

  @Valid CandidateModel candidateDetails;

  String internalTransactionRef;

  ApplicationType applicationType;

  long applicationId;
}
