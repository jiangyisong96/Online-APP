package onlineapp.service.user.service.impl;

import onlineapp.service.library.Constants;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.BadRequestException;
import onlineapp.service.library.service.model.FileModel;
import onlineapp.service.library.service.model.UploadModel;
import onlineapp.service.user.service.DocumentFeignClient;
import onlineapp.service.user.service.FileService;
import java.io.IOException;
import java.util.Objects;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileServiceImpl implements FileService {

  final Logger logger = LoggerFactory.getLogger(getClass());

  @Autowired
  DocumentFeignClient documentFeignClient;

  public FileModel getFileFromS3Service(String key) {
    return documentFeignClient.findFileInfo(key);
  }

  public UploadModel generateFileUploadModel(String type) throws IOException {
    logger.info("Generating Presigned URL for uploading profile photo");
    try {
      UploadModel result = documentFeignClient.uploadFilePresignedUrl(type);
      if (!Objects.isNull(result)) {
        return result;
      }
      throw new BadRequestException(Constants.BAD_REQUEST, ApplicationErrorCode.BAD_REQUEST);
    } catch (Exception e) {
      throw new BadRequestException(Constants.BAD_REQUEST, ApplicationErrorCode.BAD_REQUEST);
    }
  }

  public String checkUploadFileStatus(String key) {
    return documentFeignClient.getFileStatus(key);
  }
}
