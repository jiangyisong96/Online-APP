package onlineapp.service.library.logging;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.BeanPropertyWriter;

/**
 * PropertyWriter to mask the sensitive value.
 *
 * @author XingJun
 */
public class SensitivePropertyWriter extends BeanPropertyWriter {
  private static final long serialVersionUID = 1L;

  private final BeanPropertyWriter writer;
  private final String maskedValue;

  /**
   * Constructs a new instance.
   *
   * @param writer BeanPropertyWriter
   * @param maskedValue value used to mask the sensitive data
   */
  public SensitivePropertyWriter(BeanPropertyWriter writer, String maskedValue) {
    super(writer);

    this.writer = writer;
    this.maskedValue = maskedValue;
  }

  /** {@inheritDoc} */
  @Override
  public void serializeAsField(Object bean, JsonGenerator gen, SerializerProvider prov)
      throws Exception {
    Object value = writer.get(bean);
    if (value != null) {
      gen.writeStringField(writer.getName(), maskedValue);
    }
  }
}
