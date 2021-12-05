package onlineapp.service.user.controller;

import onlineapp.service.library.service.model.FileModel;
import onlineapp.service.library.service.model.UploadModel;
import onlineapp.service.library.service.model.UploadStatusModel;
import onlineapp.service.user.service.FileService;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FileQueryController {

  @Autowired FileService fileService;

  /**
   * API to provide presigned URL to upload file.
   *
   * @param type file type
   * @return the url for uploading file
   * @throws IOException
   */
  @PreAuthorize("isAuthenticated()")
  @GetMapping("/file/upload/get-url/{type}")
  public ResponseEntity<UploadModel> getUploadResitCSVFileUrl(@PathVariable String type)
      throws IOException {
    var response = fileService.generateFileUploadModel(type);
    return ResponseEntity.ok(response);
  }

  /**
   * API to check the current file upload status
   *
   * @param key of the file
   * @return file upload status
   */
  @PreAuthorize("isAuthenticated()")
  @GetMapping("/file/upload/check-status/{key}")
  public ResponseEntity<UploadStatusModel> checkFileUploadStatus(@PathVariable String key) {
    return ResponseEntity.ok(new UploadStatusModel(fileService.checkUploadFileStatus(key)));
  }

  /**
   * API for retrieving the file by the key (UUID).
   *
   * @param key of the file
   * @return fileModel contains the url and status of the file.
   */
  @PreAuthorize("isAuthenticated()")
  @GetMapping("/file/download/with-key/{key}")
  public ResponseEntity<FileModel> getFileFromS3Service(String key) {
    return ResponseEntity.ok(fileService.getFileFromS3Service(key));
  }
}
