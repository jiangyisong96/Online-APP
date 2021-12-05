package onlineapp.service.library.service;

import onlineapp.service.library.service.model.EmailModel;
import javax.mail.MessagingException;

public interface EmailService {
  void sendEmail(EmailModel email) throws MessagingException;

  void sendEmail(EmailModel... email) throws MessagingException;
}
