package onlineapp.service.library.util;

import onlineapp.service.library.Constants;
import org.apache.commons.lang.StringUtils;

/**
 * Utils to convert string into title case.
 *
 * @author Wen Xiang
 */
public class TitleCaseUtils {

  /** This class is not meant to be instantiated. */
  private TitleCaseUtils() {}

  /**
   * Convert the string into title case
   *
   * @param inputString string to be converted into title case
   * @return title case string
   */
  public static String convertToTitleCase(String inputString) {
    if (StringUtils.isBlank(inputString)) {
      return "";
    }
    final String ACTIONABLE_DELIMITERS = " '-/";

    StringBuilder sb = new StringBuilder();
    boolean capNext = true;

    for (char c : inputString.toCharArray()) {
      c = (capNext) ? Character.toUpperCase(c) : Character.toLowerCase(c);
      sb.append(c);
      capNext = (ACTIONABLE_DELIMITERS.indexOf(c) >= 0);
    }
    return sb.toString();
  }

  /**
   * Convert the exam level into title case
   *
   * @param examLevel exam level
   * @return exam level in title case
   */
  public static String convertExamLevelToTileCaseFormat(String examLevel) {
    if (Constants.GCE_NA_NT_LEVEL.contains(examLevel)) {
      examLevel = Constants.GCE_NA_LEVEL;
    }
    String[] examLevelObject = examLevel.split(" ");
    examLevel = TitleCaseUtils.convertToTitleCase(examLevelObject[1]);

    StringBuilder examLevelBuilder = new StringBuilder();
    examLevelBuilder.append("GCE ");
    examLevelBuilder.append(examLevel);

    return examLevelBuilder.toString();
  }
}
