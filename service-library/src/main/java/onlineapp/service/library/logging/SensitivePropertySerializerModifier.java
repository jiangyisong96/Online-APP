package onlineapp.service.library.logging;

import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.fasterxml.jackson.databind.ser.BeanPropertyWriter;
import com.fasterxml.jackson.databind.ser.BeanSerializerModifier;
import java.util.List;

/**
 * To register SensitivePropertyWriter to field/property with SensitiveProperty annotation.
 *
 * @author XingJun
 */
public class SensitivePropertySerializerModifier extends BeanSerializerModifier {

  /** {@inheritDoc} */
  @Override
  public List<BeanPropertyWriter> changeProperties(
      SerializationConfig config,
      BeanDescription beanDesc,
      List<BeanPropertyWriter> beanProperties) {
    for (int i = 0; i < beanProperties.size(); i++) {
      BeanPropertyWriter writer = beanProperties.get(i);
      Sensitive sensitive = writer.getAnnotation(Sensitive.class);

      if (sensitive != null) {
        beanProperties.set(i, new SensitivePropertyWriter(writer, sensitive.mask()));
      }
    }

    return beanProperties;
  }
}
