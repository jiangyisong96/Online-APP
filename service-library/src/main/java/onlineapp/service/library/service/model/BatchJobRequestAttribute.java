package onlineapp.service.library.service.model;

import java.util.HashMap;
import java.util.Map;
import org.springframework.lang.Nullable;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.AbstractRequestAttributes;

/**
 * Request attribute instance for batch job to save the token and id.
 *
 * @author XingJun
 */
public class BatchJobRequestAttribute extends AbstractRequestAttributes {

  private final Map<String, Object> attributes = new HashMap<>();

  @Override
  public Object getAttribute(String name, int scope) {
    return this.attributes.get(name);
  }

  @Override
  public void setAttribute(String name, @Nullable Object value, int scope) {
    if (value != null) {
      this.attributes.put(name, value);
    } else {
      this.attributes.remove(name);
    }
  }

  @Override
  public void removeAttribute(String name, int scope) {
    this.attributes.remove(name);
  }

  @Override
  public String[] getAttributeNames(int scope) {
    return StringUtils.toStringArray(this.attributes.keySet());
  }

  @Override
  protected void updateAccessedSessionAttributes() {
    // Custom request attribute for batch job. Don't support session.
  }

  @Override
  public void registerDestructionCallback(String name, Runnable callback, int scope) {
    registerRequestDestructionCallback(name, callback);
  }

  @Override
  public Object resolveReference(String key) {
    return null;
  }

  @Override
  public String getSessionId() {
    return null;
  }

  @Override
  public Object getSessionMutex() {
    return null;
  }
}
