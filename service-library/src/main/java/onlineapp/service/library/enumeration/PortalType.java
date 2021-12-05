package onlineapp.service.library.enumeration;

public enum PortalType {
  CP(UserRole.ROLE_CP_USER),
  EPP(UserRole.ROLE_EPP_USER);

  private final UserRole userRole;

  PortalType(UserRole userRole) {
    this.userRole = userRole;
  }

  public UserRole getUserRole() {
    return this.userRole;
  }
}
