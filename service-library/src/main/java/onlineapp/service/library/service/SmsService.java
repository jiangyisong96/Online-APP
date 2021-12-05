package onlineapp.service.library.service;

import onlineapp.service.library.service.model.SmsModel;
import javax.mail.MessagingException;

public interface SmsService {
  void sendSms(SmsModel sms) throws MessagingException;

  void sendSms(SmsModel... sms) throws MessagingException;
}
