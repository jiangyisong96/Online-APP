package onlineapp.service.user.service;

import onlineapp.service.library.service.model.GenericListItemModel;
import onlineapp.service.library.service.model.SearchModel;
import onlineapp.service.user.elasticsearch.document.AccountDetails;
import onlineapp.service.user.service.model.AccountDetailsSearchModel;
import onlineapp.service.user.service.model.AccountManagementFilterModel;
import java.util.List;
import org.springframework.data.domain.Page;

public interface AccountManagementQueryService {

  /**
   * Function that queries and search elastic search given a model that contains a partial/full
   * candidateId and page and page size
   *
   * @param searchModel model containing the the relavant details of the search
   * @return Page containing relevant candidates
   */
  Page<AccountDetails> searchByCandidateIdOrName(AccountDetailsSearchModel searchModel);

  List<GenericListItemModel<Long, String>> searchByCandidateId(SearchModel searchModel);

  Page<AccountDetails> searchByPersonnelIdOrNameOrEmail(AccountManagementFilterModel searchModel,
      int page, int size, String sort, String order);

  List<String> getAccountStatus();

  List<String> getLockedStatus();
}
