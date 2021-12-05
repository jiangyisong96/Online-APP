package onlineapp.service.library.enumeration;

import java.util.Arrays;
import java.util.List;

public enum FileStatus {
  UPLOADING,
  SCANNING,
  GENERATING, // IS FOR WHEN YOU GENERATING THE REPORT ONLY
  SUCCESS,
  FAILED,
  TIMEOUT;

  public static List<FileStatus> getProcessedState() {
    return Arrays.asList(
        FileStatus.FAILED, FileStatus.SUCCESS, FileStatus.TIMEOUT, FileStatus.GENERATING);
  }
}
