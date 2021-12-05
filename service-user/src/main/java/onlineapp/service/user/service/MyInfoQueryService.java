package onlineapp.service.user.service;

import onlineapp.service.user.service.model.CandidateFormInputResponseModel;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MyInfoQueryService {

  String getMyInfoAuthorizationUrl(
      HttpServletRequest request, HttpServletResponse response, String uinfin);

  List<CandidateFormInputResponseModel> getMyInfo(
      String code, String state, HttpServletRequest request, HttpServletResponse response)
      throws IOException, GeneralSecurityException;
}
