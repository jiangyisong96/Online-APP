package onlineapp.service.library.enumeration;

/**
 * Used to mapping key name in database and in service.
 *
 * @author Kuilin
 */
public enum ConfigNames {
  DAYS_TO_EXPIRE_PASSWORD("days-to-expire-password-if-new-account-no-login"),
  DAYS_TO_DISABLE_ACCOUNT("days-to-disable-account-after-result-release"),
  DAYS_TO_EMAIL_ADMIN("days-to-email-admin-to-view-after-account-disabled"),
  DAYS_TO_INVALIDATE_LINK("days-to-invalidate-result-release-link-after-generating"),
  DAYS_TO_EXPIRE_PAYMENT_LINK("days-before-payment-unique-link-expire"),
  DAYS_TO_EXPIRE_ACCESS_LINK("days-before-access-link-expire"),
  TIMES_OF_MAX_LOGIN_TRY("times-of-max-login-try"),
  MINUTES_OF_INACTIVITY("minutes-of-inactivity-before-session-timeout"),

  // captcha use
  TIMES_OF_MAX_FAILED_ATTEMPT("times-of-max-failed-attempt"),
  MAX_SECONDS_TO_WAIT_RETRY_LOGIN("max-seconds-to-wait-to-retry-login");

  private final String name;

  ConfigNames(String name) {
    this.name = name;
  }

  public String getName() {
    return name;
  }
}
