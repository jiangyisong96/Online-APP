package onlineapp.service.library.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.module.SimpleModule;
import com.fasterxml.jackson.databind.ser.BeanSerializerFactory;
import com.fasterxml.jackson.databind.ser.SerializerFactory;
import com.fasterxml.jackson.datatype.hibernate5.Hibernate5Module;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;
import onlineapp.service.library.Constants;
import onlineapp.service.library.logging.SensitivePropertySerializerModifier;
import onlineapp.service.library.serializer.ServletRequestSerializer;
import onlineapp.service.library.serializer.ServletResponseSerializer;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class JsonUtils {

  private static final ObjectMapper objectMapper = new ObjectMapper();

  static {
    SensitivePropertySerializerModifier modifier = new SensitivePropertySerializerModifier();
    SerializerFactory factory = BeanSerializerFactory.instance.withSerializerModifier(modifier);
    objectMapper.setSerializerFactory(factory);

    SimpleModule module = new SimpleModule();
    module.addSerializer(ServletRequest.class, new ServletRequestSerializer());
    module.addSerializer(ServletResponse.class, new ServletResponseSerializer());
    objectMapper.registerModule(module);

    // To ignore the lazy-load field for entity class
    Hibernate5Module hibernate5Module = new Hibernate5Module();
    objectMapper.registerModule(hibernate5Module);

    // Convert the local date time to human readable format
    objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
    JavaTimeModule javaTimeModule = new JavaTimeModule();
    javaTimeModule.addSerializer(
        LocalDateTime.class,
        new LocalDateTimeSerializer(
            DateTimeFormatter.ofPattern(Constants.DATETIME_FORMAT_WITHOUT_MSEC)));
    javaTimeModule.addDeserializer(
        LocalDateTime.class,
        new LocalDateTimeDeserializer(
            DateTimeFormatter.ofPattern(Constants.DATETIME_FORMAT_WITHOUT_MSEC)));

    objectMapper.registerModule(new JavaTimeModule());
  }

  private JsonUtils() {
    throw new IllegalStateException("Json utility class");
  }

  public static String convertToJson(Object value) throws JsonProcessingException {
    return objectMapper.writeValueAsString(value);
  }

  public static <T> T convertToObject(String json, Class<T> classType)
      throws JsonProcessingException {
    return objectMapper.readValue(json, classType);
  }

  public static <T> T convertToObject(Map<String, String> map, Class<T> classType) {
    return objectMapper.convertValue(map, classType);
  }
}
