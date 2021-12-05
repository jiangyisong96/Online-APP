package onlineapp.service.user.util;

import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.service.model.IExamMasterCodeTypeAndDescModel;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class IexamsMasterCodeUtils {
  private static final Logger logger = LoggerFactory.getLogger(IexamsMasterCodeUtils.class);

  private IexamsMasterCodeUtils() {}

  public static String findMatchingMasterCode(
      String id, String cdType, List<IExamMasterCodeTypeAndDescModel> iexamsCodeList) {
    for (IExamMasterCodeTypeAndDescModel iexamsCodeModel : iexamsCodeList) {
      if (iexamsCodeModel.getCdCodeDescr().trim().equalsIgnoreCase(id)
          && iexamsCodeModel.getCdType().equals(cdType)) {
        return iexamsCodeModel.getCdCode();
      }
    }
    logger.warn("Invalid iexams code cdType: {}, code descr : {}", cdType, id);
    throw new ResourceNotFoundException("INVALID IEXAMS CODE!", ApplicationErrorCode.NOT_FOUND);
  }
}
