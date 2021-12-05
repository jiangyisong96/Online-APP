package onlineapp.service.library.enumeration;

import com.fasterxml.jackson.annotation.JsonValue;

/** @author Yucheng */
public enum ExamSeries {
  MY("Mid-Year"),
  YE("Year-End");

  private final String displayName;

  ExamSeries(String displayName) {
    this.displayName = displayName;
  }

  @JsonValue
  public String getDisplayName() {
    return displayName;
  }
}
