package onlineapp.service.library.service.impl;

import onlineapp.service.library.Constants;
import onlineapp.service.library.service.EmailService;
import onlineapp.service.library.service.model.EmailModel;
import java.text.MessageFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.activation.DataSource;
import javax.activation.URLDataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

@Service
@PropertySource("classpath:messages.properties")
public class EmailServiceImpl implements EmailService {

  private static final Logger logger = LoggerFactory.getLogger(EmailServiceImpl.class);

  @Autowired private JavaMailSender javaMailSender;

  @Value("${email.common.body}")
  private String emailCommonBody;

  @Value("${email.logo}")
  private String seabLogoImage;

  @Async
  public void sendEmail(EmailModel email) throws MessagingException {
    logger.info("Sending email to : {}", email.getRecipient());
    javaMailSender.send(createMimeMessage(email));
  }

  private MimeMessage createMimeMessage(EmailModel email) throws MessagingException {
    Object[] bodyArgs = {email.getBody()};
    MessageFormat messageFormat = new MessageFormat(emailCommonBody);
    email.setBody(messageFormat.format(bodyArgs));
    MimeMessage mimeMessage = javaMailSender.createMimeMessage();
    MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
    helper.setText(email.getFormattedBody(), true);
    if (email.getAttachments() != null && !email.getAttachments().isEmpty()) {
      email
          .getAttachments()
          .forEach(
              (key, value) -> {
                try {
                  helper.addAttachment(key, value);
                } catch (MessagingException messagingException) {
                  logger.warn(Constants.EMAIL_ATTACHMENT_ERROR, messagingException.getMessage());
                }
              });
    }
    helper.setTo(email.getRecipient());
    helper.setSubject(StringUtils.normalizeSpace(email.getSubject()));
    helper.setFrom(email.getSender());

    DataSource logo = new URLDataSource(getClass().getClassLoader().getResource(seabLogoImage));

    helper.addInline(seabLogoImage, logo);

    if (!CollectionUtils.isEmpty(email.getBccRecipients())) {
      String[] bccRecipients = new String[email.getBccRecipients().size()];
      email.getBccRecipients().toArray(bccRecipients);
      helper.setBcc(bccRecipients);

      String bccRecipientList = Arrays.toString(bccRecipients);
      logger.debug("Sending Bcc email to: {}", bccRecipientList);
    }

    return mimeMessage;
  }

  @Async
  public void sendEmail(EmailModel... emails) throws MessagingException {
    List<MimeMessage> mimeMessages = new ArrayList<>();

    for (EmailModel email : emails) {
      logger.info("Sending email to : {}", email.getRecipient());
      mimeMessages.add(createMimeMessage(email));
    }

    javaMailSender.send(mimeMessages.toArray(new MimeMessage[0]));
  }
}
