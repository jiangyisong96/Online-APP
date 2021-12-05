package onlineapp.service.library.config.logback;

import ch.qos.logback.access.AccessConstants;
import ch.qos.logback.access.spi.AccessEvent;
import ch.qos.logback.access.spi.IAccessEvent;
import ch.qos.logback.access.tomcat.LogbackValve;
import ch.qos.logback.access.tomcat.TomcatServerAdapter;
import ch.qos.logback.core.Appender;
import ch.qos.logback.core.spi.AppenderAttachableImpl;
import ch.qos.logback.core.spi.FilterReply;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import org.apache.catalina.Globals;
import org.apache.catalina.connector.Request;
import org.apache.catalina.connector.Response;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Custom logback valve to resolve the incorrect byteSent value (byteSent value always shows '-')in
 * access log. (To be remove once the logback-access library fix the issue)(Used back original
 * LogbackValve.java which config in LogbackAccessConfig.java)
 *
 * @author XingJun
 */
public class CustomLogbackValve extends LogbackValve {
  private static final Logger logger = LoggerFactory.getLogger(CustomLogbackValve.class);

  private boolean alreadySetStatusManager = false;
  private final AppenderAttachableImpl<IAccessEvent> appenderAttachable = new AppenderAttachableImpl<>();

  public CustomLogbackValve() {
    super();
  }

  @Override
  public void addAppender(Appender<IAccessEvent> newAppender) {
    appenderAttachable.addAppender(newAppender);
  }

  @Override
  public void invoke(Request request, Response response) throws IOException, ServletException {
    try {
      if (!alreadySetStatusManager) {
        alreadySetStatusManager = true;
        org.apache.catalina.Context tomcatContext = request.getContext();
        if (tomcatContext != null) {
          ServletContext sc = tomcatContext.getServletContext();
          if (sc != null) {
            sc.setAttribute(AccessConstants.LOGBACK_STATUS_MANAGER_KEY, getStatusManager());
          }
        }
      }

      getNext().invoke(request, response);

      TomcatServerAdapter adapter = new CustomTomcatServerAdapter(request, response);
      IAccessEvent accessEvent = new AccessEvent(request, response, adapter);

      addCurrentThreadName(accessEvent);

      if (getFilterChainDecision(accessEvent) == FilterReply.DENY) {
        return;
      }

      appenderAttachable.appendLoopOnAppenders(accessEvent);
    } finally {
      request.removeAttribute(AccessConstants.LOGBACK_STATUS_MANAGER_KEY);
    }
  }

  private void addCurrentThreadName(IAccessEvent accessEvent) {
    try {
      final String threadName = Thread.currentThread().getName();
      if (threadName != null) {
        accessEvent.setThreadName(threadName);
      }
    } catch (Exception e) {
      logger.warn("Failed to add current thread name to access log.", e);
    }
  }

  private static class CustomTomcatServerAdapter extends TomcatServerAdapter {

    private final Request customRequest;

    private final Response customResponse;

    private CustomTomcatServerAdapter(Request request, Response response) {
      super(request, response);
      this.customRequest = request;
      this.customResponse = response;
    }

    /** {@inheritDoc} */
    @Override
    public long getContentLength() {
      // Don't need to flush since trigger for log message is after the
      // response has been committed
      long length = customResponse.getBytesWritten(false);
      if (length <= 0) {
        // Protect against nulls and unexpected types as these values
        // may be set by untrusted applications
        Object start = customRequest.getAttribute(Globals.SENDFILE_FILE_START_ATTR);
        if (start instanceof Long) {
          Object end = customRequest.getAttribute(Globals.SENDFILE_FILE_END_ATTR);
          if (end instanceof Long) {
            length = ((Long) end).longValue() - ((Long) start).longValue();
          }
        }
      }
      if (length <= 0) {
        return super.getContentLength();
      } else {
        return length;
      }
    }
  }
}
