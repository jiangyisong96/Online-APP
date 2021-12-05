package onlineapp.service.library.serializer;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;
import java.io.IOException;
import javax.servlet.ServletRequest;

public class ServletRequestSerializer extends StdSerializer<ServletRequest> {

  public ServletRequestSerializer() {
    this(null);
  }

  public ServletRequestSerializer(Class<ServletRequest> clazz) {
    super(clazz);
  }

  @Override
  public void serialize(
      ServletRequest request, JsonGenerator generator, SerializerProvider provider)
      throws IOException {

    generator.writeRaw(ServletRequest.class.getName());
  }
}
