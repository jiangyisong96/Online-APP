package onlineapp.service.user.service;

import onlineapp.service.library.exception.ApplicationException;
import onlineapp.service.library.service.model.AccountCreationDetailsModel;
import onlineapp.service.library.service.model.CandidateInfoUpdateModel;
import onlineapp.service.library.service.model.user.CreateCandidateModel;
import java.util.List;

public interface OpsAdminCommandService {

  /**
   * Create candidate profile in bulks. (won't create the account if the account is existed)
   *
   * @param createCandidateModelList create candidate model.
   * @return list of account created info
   */
  List<AccountCreationDetailsModel> bulkCreateCandidate(
      List<CreateCandidateModel> createCandidateModelList) throws ApplicationException;

  void bulkSendCandidateEmail(List<String> candidateIdList);

  void bulkSendSingPassEmail(List<String> singPassIdList);

  /**
   * Update authentication type or email address of candidate.
   *
   * @param model
   */
  void updateCandidateInfo(CandidateInfoUpdateModel model);
}
