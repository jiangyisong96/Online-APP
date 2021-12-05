package onlineapp.service.library.enumeration;

import com.fasterxml.jackson.annotation.JsonValue;

/** @author Yucheng */
public enum ExamLevel {
  PSLE("P", "PSLE"),
  GCEN("N", "GCE N-Level"),
  GCEO("O", "GCE O-Level"),
  GCEA("A", "GCE A-Level");

  private final String code;
  private final String fullName;

  ExamLevel(String code, String fullName) {
    this.code = code;
    this.fullName = fullName;
  }

  public String getCode() {
    return code;
  }

  @JsonValue
  public String getFullName() {
    return fullName;
  }

  public static boolean isNotHighestExamLevel(String examLevel) {

    return ExamLevel.GCEA == ExamLevel.valueOf(examLevel);
  }

  public static String getHigherExamLevel(String examLevel1, String examLevel2) {

    if (ExamLevel.valueOf(examLevel1).compareTo(ExamLevel.valueOf(examLevel2)) >= 0) {

      return examLevel1;
    }

    return examLevel2;
  }
}
