package onlineapp.service.library.enumeration;

/**
 * Enum for application type that is used within registration table
 *
 * @author Wen Xiang
 */
public enum ApplicationType {
  RESIT("RESIT", "Resit"),
  EXAM("EXAM_REGISTRATION", "Examination Registration"),
  APPEAL("APPEAL", "Appeal"),
  ACCESS_ARRANGEMENT("ACCESS_ARRANGEMENT", "Access Arrangement");

  String displayName;
  String description;

  ApplicationType(String displayName, String description) {
    this.displayName = displayName;
    this.description = description;
  }

  public String getDisplayName() {
    return this.displayName;
  }

  public String getDescription() {
    return this.description;
  }
}
