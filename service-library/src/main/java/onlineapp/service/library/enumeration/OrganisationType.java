package onlineapp.service.library.enumeration;

/**
 * Enum for Organisation Type for Candidate / Coordinator / Administrator
 *
 * @author Wen Xiang
 */
public enum OrganisationType {
  SCHOOL("SCHOOL"),
  PRIVATE("PRIVATE"),
  NOT_APPLICABLE("N/A");

  String value;

  OrganisationType(String value) {
    this.value = value;
  }

  public String getValue() {
    return this.value;
  }
}
