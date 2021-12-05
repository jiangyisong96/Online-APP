package onlineapp.service.library.enumeration;

/**
 * Enum for exam registration type that is used within exam registration table
 *
 * @author Wen Xiang
 */
public enum ExamRegistrationType {
  EXAM("EXAM_REGISTRATION", "Examination Registration"),
  AMENDMENT("SUBJECT_AMENDMENT", "Subject Amendment"),
  WITHDRAWAL("EXAM_WITHDRAWAL", "Examination Withdrawal"),
  SUPPLEMENTARY("SUPPLEMENTARY_REGISTRATION", "Supplementary Registration");

  String value;
  String description;

  ExamRegistrationType(String value, String description) {
    this.value = value;
    this.description = description;
  }

  public String getValue() {
    return this.value;
  }

  public String getDescription() {
    return this.description;
  }
}
