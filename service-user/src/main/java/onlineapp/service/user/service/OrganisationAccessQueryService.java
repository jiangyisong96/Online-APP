package onlineapp.service.user.service;

import onlineapp.service.library.service.model.ResitAccessResponseModel;
import onlineapp.service.user.service.model.OrganisationAccessResponseModel;

public interface OrganisationAccessQueryService {

  /**
   * Gets all schools, exams types, cp functions and formats them into a Map, then gets all View
   * Access of specified type and formats them into this Map<EXAM_CODE,
   * List<InstitutionAccessModel>>
   *
   * @param type the type of View access to retrieve
   * @return OrganisationAccessResponseModel returns data for front end to display
   */
  OrganisationAccessResponseModel getOrganisationAccess(String type);

  /**
   * Retrieve the organisation access right pertaining to payment
   *
   * @param examCode exam code
   * @return ResitAccessResponseModel access right response
   */
  ResitAccessResponseModel getPaymentOrganisationAccess(String examCode);
}
