package onlineapp.service.library.service.impl;

import onlineapp.service.library.Constants;
import onlineapp.service.library.service.EmailService;
import onlineapp.service.library.service.SmsService;
import onlineapp.service.library.service.model.EmailModel;
import onlineapp.service.library.service.model.SmsModel;
import javax.mail.MessagingException;
import org.owasp.encoder.Encode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class SmsServiceImpl implements SmsService {

  private static final Logger logger = LoggerFactory.getLogger(SmsServiceImpl.class);

  @Autowired private RestTemplate restTemplateProxy;
  @Autowired private EmailService emailService;

  @Value("${email.sender}")
  private String senderEmail;

  @Value("${sms.api.smsGateWayUrl}")
  private String smsGateWayUrl;

  @Value("${sms.api.smsId}")
  private String smsId;

  @Value("${sms.api.smsPassword}")
  private String smsPassword;

  @Value("${sms.api.isSmsEnabled}")
  private boolean isSmsEnabled;

  @Async
  public void sendSms(SmsModel sms) throws MessagingException {
    if (!isSmsEnabled) {
      EmailModel emailModel =
          EmailModel.builder()
              .subject(Constants.SMS_DISABLED_EMAIL)
              .body(sms.getMessage())
              .recipient(sms.getMobile() + "@ufinity.com")
              .sender(senderEmail)
              .build();
      emailService.sendEmail(emailModel);
      return;
    }

    updateSmsWithApiSecret(sms);
    ResponseEntity<String> responseEntity =
        restTemplateProxy.postForEntity(smsGateWayUrl, sms, String.class);

    try {
      String results = responseEntity.getBody();
      logger.info(Constants.SMS_RESULT, results);
      if (null != results && results.split(",")[0].equals("01010")) {
        logger.info(Constants.SMS_SENT_SUCCESSFUL);
      } else {
        logger.error(Constants.SMS_UNABLE_TO_SEND);
      }
    } catch (Exception e) {
      logger.error(Constants.SMS_UNABLE_TO_SEND);
    }
  }

  @Async
  public void sendSms(SmsModel... smses) throws MessagingException {
    for (SmsModel sms : smses) {
      sendSms(sms);
    }
  }

  private void updateSmsWithApiSecret(SmsModel sms) {
    sms.setId(smsId);
    sms.setPassword(Encode.forHtml(smsPassword));
    sms.setType("A"); // “A” – ASCII content of less than 160 characters
  }
}
