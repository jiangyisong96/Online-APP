package onlineapp.service.user.service;

import onlineapp.service.user.elasticsearch.document.AccountDetails;
import onlineapp.service.user.repository.entity.Candidate;
import onlineapp.service.user.repository.entity.Personnel;

public interface AccountManagementCommandService {

  /**
   * Function to index a given candidate
   *
   * @param candidate The credentialId for the candidate to index
   * @param newUser boolean to indicate if is new user
   */
  void updateAccountManagement(Candidate candidate, boolean newUser);

  /**
   * Function to index a given personnel
   *
   * @param personnel The credentialId for the personnel to index
   * @param newUser boolean to indicate if is new user
   */
  void updateAccountManagement(Personnel personnel, boolean newUser);

  /**
   * Function to index a given candidate given their credentialId
   *
   * @param credentialId The credentialId for the candidate to index
   */
  void updateAccountManagement(long credentialId);

  /**
   * Function to format and transform the candidate into the required format to be indexed into
   * elastic search
   *
   * @param user The candidate you want to transform
   * @param newUser boolean to indicate if is new user
   * @return ElasticSearchAccountManagement Entity that is to be indexed into elastic search
   */
  AccountDetails accountCandidateManagementMapper(Candidate user, boolean newUser);

  /**
   * Function to format and transform the candidate into the required format to be indexed into
   * elastic search
   *
   * @param user The personnel you want to transform
   * @param newUser boolean to indicate if is new user
   * @return ElasticSearchAccountManagement Entity that is to be indexed into elastic search
   */
  AccountDetails accountPersonnelManagementMapper(Personnel user, boolean newUser);
}
