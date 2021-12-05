package onlineapp.service.library.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ApplicationUtils {
  private ApplicationUtils() {}

  public static String generateApplicationId() {
    var sdfDate = new SimpleDateFormat("yyyyMMddHHmmssSSS");
    var now = new Date();
    return sdfDate.format(now);
  }
}
