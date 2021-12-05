package onlineapp.service.library.enumeration;

public enum AuthenticationType {
  CP_ID("CP Account"),
  SINGPASS("Singpass");

  private final String name;

  AuthenticationType(String name) {
    this.name = name;
  }

  public String getName() {
    return name;
  }
}
