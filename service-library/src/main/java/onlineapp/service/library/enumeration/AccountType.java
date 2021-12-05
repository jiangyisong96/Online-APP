package onlineapp.service.library.enumeration;

import java.util.ArrayList;
import java.util.List;

public enum AccountType {
  CP_ID("CP ID"),
  SINGPASS("SingPass");

  String displayName;

  AccountType(String displayName) {
    this.displayName = displayName;
  }

  public String value() {
    return this.displayName;
  }

  public static List<String> getTypes() {
    List<String> accountTypes = new ArrayList<>();

    for (AccountType accountType : AccountType.values()) {
      accountTypes.add(accountType.displayName);
    }
    return accountTypes;
  }
}
