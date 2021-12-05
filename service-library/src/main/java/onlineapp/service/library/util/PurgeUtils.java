package onlineapp.service.library.util;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
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
import onlineapp.service.library.serializer.ServletRequestSerializer;
import onlineapp.service.library.serializer.ServletResponseSerializer;
import java.io.FileOutputStream;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.function.Consumer;
import java.util.function.Function;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

/**
 * Common utility class to handle with purge operation.
 *
 * @author Yucheng
 */
@Slf4j
public class PurgeUtils {

  private PurgeUtils() {}

  private static final ObjectMapper objectMapper = new ObjectMapper();

  static {
    SerializerFactory factory = BeanSerializerFactory.instance;
    objectMapper.setSerializerFactory(factory);

    SimpleModule module = new SimpleModule();
    module.addSerializer(ServletRequest.class, new ServletRequestSerializer());
    module.addSerializer(ServletResponse.class, new ServletResponseSerializer());
    objectMapper.registerModule(module);

    // To ignore the lazy-load field for entity class
    Hibernate5Module hibernate5Module = new Hibernate5Module();
    objectMapper.registerModule(hibernate5Module);

    // Convert the local date time to "yyyy-MM-dd HH:mm:ss"
    objectMapper.disable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS);
    JavaTimeModule javaTimeModule = new JavaTimeModule();
    javaTimeModule.addSerializer(
        LocalDateTime.class,
        new LocalDateTimeSerializer(DateTimeFormatter.ofPattern(Constants.DATETIME_FORMAT_YMDHMS)));
    javaTimeModule.addDeserializer(
        LocalDateTime.class,
        new LocalDateTimeDeserializer(
            DateTimeFormatter.ofPattern(Constants.DATETIME_FORMAT_YMDHMS)));

    objectMapper.registerModule(javaTimeModule);

    objectMapper.setSerializationInclusion(Include.NON_NULL);
  }

  public static <T> void deleteInBatch(
      int batchProcessingSize, Function<Pageable, Page<T>> find, Consumer<Page<T>> delete) {

    var pageCount = 0;

    Page<T> page;

    do {
      Pageable pageable = PageRequest.of(pageCount++, batchProcessingSize);

      page = find.apply(pageable);

      if (page.getContent().isEmpty()) {

        return;

      } else {

        delete.accept(page);
      }

    } while (!page.isLast());
  }

  public static void writeObjectToArchive(FileOutputStream fileOutputStream, Object object)
      throws IOException {

    objectMapper.writeValue(fileOutputStream, object);
  }

  public static String writeValueAsString(Object value) throws JsonProcessingException {

    return objectMapper.writeValueAsString(value);
  }
}
