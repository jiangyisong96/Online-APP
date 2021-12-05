package onlineapp.service.library.enumeration;

public enum RequestType {
  AA("ACCESS_ARRANGEMENT"),
  SC("SPECIAL_CONSIDERATION");

  String displayName;

  RequestType(String displayName) {
    this.displayName = displayName;
  }

  public String value() {
    return this.displayName;
  }
}
