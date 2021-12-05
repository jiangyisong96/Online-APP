package onlineapp.service.user.service;

public interface SystemActionService {
  /** Function to index user-service elastic search data */
  void indexUserData();
  /** Function to create user-service elastic search index */
  void createUserIndex();
}
