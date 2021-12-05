package onlineapp.service.library.service;

import com.nimbusds.jose.JOSEException;
import onlineapp.service.library.service.model.IexamsRegistrationPaymentModel;
import onlineapp.service.library.service.model.IexamsRequestDataModel;
import java.io.IOException;
import java.security.GeneralSecurityException;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;

@ConditionalOnProperty(name = "iexams.api.iexams-public-key-name")
public interface IExamsService {
  /**
   * To send a request to get claims from Iexams2
   *
   * @param tokenValidityInMs the validity period for the token generated from the claims in Ms
   * @return returns the token generated from the claims gotten from iexams
   */
  String getClaims(int tokenValidityInMs)
      throws IOException, GeneralSecurityException, JOSEException;

  /**
   * Get Exam Registration Basic Fee from Iexams2
   *
   * @return
   */
  IexamsRegistrationPaymentModel getRegistrationBasicFee();

  /**
   * Get Exam Registration Basic Fee from Iexams2
   *
   * @return
   */
  IexamsRegistrationPaymentModel getRegistrationSubjectFee(int noOfSubject);

  /**
   * Get Exam Registration Basic Fee from Iexams2
   *
   * @return
   */
  IexamsRegistrationPaymentModel getRegistrationSubtotal(int noOfSubject);

  /**
   * Get Exam Registration Exam Fee from Iexams2
   *
   * @return
   */
  IexamsRegistrationPaymentModel getRegistrationExamFee();

  IexamsRegistrationPaymentModel getRegistrationLateEntryFee();

  /**
   * To form an iexams request with body
   *
   * @param body the body of the request
   * @param apiPath api path for the request
   * @param token the token used for the request
   * @return returns the response of the Iexams get claims API formatted into a model
   */
  IexamsRequestDataModel iExamsRequestDataMapper(String body, String apiPath, String token)
      throws GeneralSecurityException;

  /**
   * To form an iexams request without body
   *
   * @param apiPath api path for the request
   * @param token the token used for the request
   * @return returns the response of the Iexams get claims API formatted into a model
   */
  IexamsRequestDataModel iExamsRequestDataMapper(String apiPath, String token)
      throws GeneralSecurityException;

  /**
   * To send a post request Iexams2
   *
   * @param data the data required for the post request
   * @param requireClaims boolean value to indicate if header required a JWT token generated from
   *     the get claims
   * @return returns the response of the Iexams get claims API formatted into a model
   */
  String postToIexams(IexamsRequestDataModel data, boolean requireClaims)
      throws GeneralSecurityException, IOException, JOSEException;

  /**
   * To send a get request Iexams2
   *
   * @param data the data required for the post request
   * @param requireClaims boolean value to indicate if header required a JWT token generated from
   *     the get claims
   * @return returns the response of the Iexams get claims API formatted into a model
   */
  String getFromIexams(IexamsRequestDataModel data, boolean requireClaims)
      throws GeneralSecurityException, IOException, JOSEException;

  /**
   * To send a post request to Iexams2 and decrypt the response
   *
   * @param requestBody Iexams request body object
   * @param iExamsApiUrl Iexams api url
   * @param requireClaims boolean value to indicate if header required a JWT token generated from
   *     the get claims
   * @param apiName Iexams api name
   * @param <T> Generic object model class of Iexams2 response
   * @return
   * @throws GeneralSecurityException
   * @throws IOException
   * @throws JOSEException
   */
  <T> T postToIexamsAndDecrypt(
      Object requestBody, String iExamsApiUrl, boolean requireClaims, String apiName)
      throws GeneralSecurityException, IOException, JOSEException;
}
