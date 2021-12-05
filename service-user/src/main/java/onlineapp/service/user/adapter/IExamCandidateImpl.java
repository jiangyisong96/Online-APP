package onlineapp.service.user.adapter;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.nimbusds.jose.JOSEException;
import onlineapp.service.library.enumeration.UserIdType;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.InternalServerException;
import onlineapp.service.library.service.IExamsService;
import onlineapp.service.library.service.model.IexamsCandidateProfileModel;
import onlineapp.service.library.service.model.IexamsCandidateProfileUpdateModel;
import onlineapp.service.library.service.model.IexamsRequestDataModel;
import onlineapp.service.library.service.model.IexamsResponseModel;
import onlineapp.service.library.util.JsonUtils;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@Qualifier("IExamCandidateImpl")
public class IExamCandidateImpl implements IExamCandidate {
  @Autowired private IExamsService iExamsService;

  @Value("${iexams.api.candidate-profile.update.path}")
  private String updateCandidateProfilePath;

  @Value("${iexams.api.token.validity-period}")
  private int tokenValidityInMs;

  private static final Logger logger = LoggerFactory.getLogger(IExamCandidateImpl.class);

  private void updateCandidateProfile(String token, IexamsCandidateProfileModel candidateProfile)
      throws IOException, GeneralSecurityException, JOSEException {
    IexamsCandidateProfileUpdateModel updateBody =
        IexamsCandidateProfileUpdateModel.builder()
            .id(
                StringUtils.isNotBlank(candidateProfile.getNric())
                    ? candidateProfile.getNric()
                    : candidateProfile.getForeignDocNo())
            .idType(candidateProfile.getIdType())
            .candidateProfile(candidateProfile)
            .build();
    String maskedData = JsonUtils.convertToJson(updateBody);
    logger.info("Iexams Update candidate Profile request Body ; {}", maskedData);
    ObjectMapper mapper = new ObjectMapper();
    String bodyString = mapper.writeValueAsString(updateBody);

    IexamsRequestDataModel requestDataModel =
        iExamsService.iExamsRequestDataMapper(bodyString, updateCandidateProfilePath, token);

    String decryptedBody = iExamsService.postToIexams(requestDataModel, true);
    logger.error("Iexams Response string : {}", decryptedBody);
    // Even though intellij comment can change to <> but for some reason when take away
    // IexamsResponseModel<String> then will throw exception
    IexamsResponseModel<String> decryptedResponse =
        mapper.readValue(decryptedBody, new TypeReference<IexamsResponseModel<String>>() {});
    logger.error("Iexams Response mapped : {}", decryptedResponse);
    if (!decryptedResponse.isSuccess()) {
      throw new InternalServerException(
          "Update Failed", ApplicationErrorCode.INTERNAL_SERVER_ERROR);
    }
  }

  @Override
  public List<String> updateCandidateProfiles(List<IexamsCandidateProfileModel> candidateProfiles)
      throws GeneralSecurityException, IOException, JOSEException {
    List<String> errorList = new ArrayList<>();
    String token = iExamsService.getClaims(tokenValidityInMs);
    for (IexamsCandidateProfileModel candidateProfileQueryModel : candidateProfiles) {
      try {
        updateCandidateProfile(token, candidateProfileQueryModel);
      } catch (InternalServerException
          | GeneralSecurityException
          | IOException
          | JOSEException ex) {
        logger.error(
            "An error occurred when posting to update to IExams message: {}", ex.getMessage());
        errorList.add(
            candidateProfileQueryModel.getIdType() == UserIdType.NRIC_OR_FIN.getCdCode().charAt(0)
                ? candidateProfileQueryModel.getNric()
                : candidateProfileQueryModel.getForeignDocNo());
      }
    }
    return errorList;
  }
}
