package onlineapp.service.library.enumeration;

import java.util.ArrayList;
import java.util.List;

/*
  In iexam_master_code, refer to "cd_code" value,
  where P will be displayed as "PRIVATE" and S is "School".
*/
public enum CandidateType {
  PRIVATE("P"),
  SCHOOL("S");

  private final String cdCode;

  CandidateType(String cdCode) {
    this.cdCode = cdCode;
  }

  public String getCdCode() {
    return this.cdCode;
  }

  public static List<String> getTypes() {
    List<String> candidateTypes = new ArrayList<>();

    for (CandidateType candidateType : CandidateType.values()) {
      candidateTypes.add(candidateType.cdCode);
    }
    return candidateTypes;
  }
}
