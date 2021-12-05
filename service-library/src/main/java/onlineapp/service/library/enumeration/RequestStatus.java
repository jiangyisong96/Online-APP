package onlineapp.service.library.enumeration;

import com.fasterxml.jackson.annotation.JsonValue;

public enum RequestStatus {
  DRAFT("Draft"),
  COMPLETED("Completed"),
  SUBMITTED("Submitted"),
  PROCESSING("Processing"),
  WITHDRAWN("Withdrawn");

  private final String displayName;

  RequestStatus(String displayName) {
    this.displayName = displayName;
  }

  @JsonValue
  public String getDisplayName() {
    return displayName;
  }
}
