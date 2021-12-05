package onlineapp.service.user.service;

import onlineapp.service.library.service.model.FileModel;
import onlineapp.service.library.service.model.UploadModel;
import java.io.IOException;

/**
 * Interface for file executing service. It processes file upload and download via bucket to s3
 * service. @Author Yisong
 */
public interface FileService {
  /**
   * Retrieve File from S3 Clean Bucket
   *
   * @param key To identify file
   * @return The file
   */
  FileModel getFileFromS3Service(String key);

  /**
   * Generate the presigned url for uploading files
   *
   * @param type file type (.csv, .doc, etc, .jpg)
   * @return url and key for uploading
   * @throws IOException Processing File Error
   */
  UploadModel generateFileUploadModel(String type) throws IOException;

  /**
   * Check the current file upload status
   *
   * @param key to identify file
   * @return The file status
   */
  String checkUploadFileStatus(String key);
}
