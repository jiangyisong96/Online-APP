package onlineapp.service.user.service;

public interface MutableProfileAclService {
  /**
   * Method updated the SID for a user
   *
   * @param newUsername The new username of the SID
   * @param oldUsername The old username of the SID
   */
  void updateSid(String newUsername, String oldUsername);
}
