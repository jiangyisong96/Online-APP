package onlineapp.service.library.util;

/**
 * Generate regular expression.
 *
 * @author XingJun
 */
public final class RegexPatternUtils {

  private static final String URI_REGEX_FORMAT = "^(%s)(/.*)*(\\?.*)?$";

  /**
   * Constructs a new instance. With 'private' access modifier for preventing developer from
   * instantiation.
   */
  private RegexPatternUtils() {
    //
  }

  /**
   * Regular expression to match the specified URI. The request parameters will still allow the URI
   * be to matched.
   *
   * @param uri uri
   * @return regular expression
   */
  public static String uriMatcher(String uri) {
    return String.format(URI_REGEX_FORMAT, uri);
  }
}
