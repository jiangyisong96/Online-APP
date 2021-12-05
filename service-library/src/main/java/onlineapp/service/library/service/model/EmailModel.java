package onlineapp.service.library.service.model;

import java.io.File;
import java.text.MessageFormat;
import java.util.Collection;
import java.util.Map;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * Email Model for sending email
 *
 * @author Dave
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class EmailModel {
  private String recipient;
  private String sender;
  private String subject;
  private String body;
  private Object[] args;
  private Map<String, File> attachments;
  private Collection<String> bccRecipients;

  public String getFormattedBody() {
    MessageFormat messageFormat = new MessageFormat(body);
    return messageFormat.format(args);
  }
}
