package onlineapp.service.user.service;

import onlineapp.service.library.config.FeignConfig;
import onlineapp.service.library.service.model.CreateFileModel;
import onlineapp.service.library.service.model.CreateFileResponseModel;
import onlineapp.service.library.service.model.FileModel;
import onlineapp.service.library.service.model.UpdateFileModel;
import onlineapp.service.library.service.model.UploadModel;
import javax.validation.constraints.NotBlank;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

@Component
@FeignClient(name = "DOCUMENT-SERVICE", configuration = FeignConfig.class)
public interface DocumentFeignClient {

  @GetMapping("/s3/template/download/{bucketName}/{objKey}")
  String downloadFilePresignedUrl(
      @NotBlank @PathVariable String bucketName, @NotBlank @PathVariable String objKey);

  @GetMapping("/s3/files/{key}")
  FileModel findFileInfo(@NotBlank @PathVariable String key);

  @GetMapping("/s3/upload/generate-url/{type}")
  UploadModel uploadFilePresignedUrl(@NotBlank @PathVariable String type);

  @GetMapping("/s3/check-status/{key}")
  String getFileStatus(@NotBlank @PathVariable String key);

  @PostMapping("/s3/files")
  CreateFileResponseModel generateAndDownload(@RequestBody CreateFileModel file);

  @PutMapping("/interior/s3/files")
  void updateFileStatus(@RequestBody UpdateFileModel updateFileModel);
}
