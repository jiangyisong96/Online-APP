package onlineapp.service.library.serializer;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;
import java.io.IOException;
import javax.servlet.ServletResponse;

public class ServletResponseSerializer extends StdSerializer<ServletResponse> {

  public ServletResponseSerializer() {
    this(null);
  }

  public ServletResponseSerializer(Class<ServletResponse> clazz) {
    super(clazz);
  }

  @Override
  public void serialize(
      ServletResponse response, JsonGenerator generator, SerializerProvider provider)
      throws IOException {

    generator.writeRaw(ServletResponse.class.getName());
  }
}
