package onlineapp.service.library.util;

import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.BadRequestException;
import java.io.BufferedReader;
import java.io.IOException;

public class FileUtils {
  private static final String EXCEEDS_MAX_LEN = "Exceeds maximum line length of ";

  /** The class is not meant to be instantiated * */
  private FileUtils() {}

  public static String getLine(BufferedReader reader, int lenLimit) throws IOException {
    var sb = new StringBuilder();
    int intC;
    while ((intC = reader.read()) != -1) {
      char c = (char) intC;
      if (c == '\n') {
        break;
      }
      if (sb.length() >= lenLimit) {
        throw new BadRequestException(EXCEEDS_MAX_LEN + lenLimit, ApplicationErrorCode.BAD_REQUEST);
      }
      sb.append(c);
    }

    return sb.length() > 0 ? sb.toString() : null;
  }

  /**
   * return file extension name given filename
   *
   * @param filename filename, e.g. - test.pdf
   * @return extension name, e.g. - .pdf
   */
  public static String getFileExtensionName(String filename) {

    return filename.substring(filename.lastIndexOf("."));
  }
}
