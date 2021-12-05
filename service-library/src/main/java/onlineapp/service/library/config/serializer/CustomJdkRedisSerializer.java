package onlineapp.service.library.config.serializer;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import org.apache.commons.io.serialization.ValidatingObjectInputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.SerializationException;
import org.springframework.lang.Nullable;
import org.springframework.security.core.context.SecurityContextImpl;
import org.xerial.snappy.Snappy;

public class CustomJdkRedisSerializer extends JdkSerializationRedisSerializer {

  private static final Logger logger = LoggerFactory.getLogger(CustomJdkRedisSerializer.class);

  @Override
  public byte[] serialize(@Nullable Object object) {
    byte[] data;
    char type;

    if (object instanceof SecurityContextImpl) {
      data = compress(super.serialize(object));
      type = 'c';
    } else {
      data = super.serialize(object);
      type = 'n';
    }

    byte[] modified = new byte[data.length + 1];
    modified[0] = ((byte) type);
    System.arraycopy(data, 0, modified, 1, data.length);
    return modified;
  }

  @Override
  public Object deserialize(byte[] bytes) {
    byte[] data = new byte[bytes.length - 1];
    System.arraycopy(bytes, 1, data, 0, bytes.length - 1);

    byte[] decompressedData;
    if (bytes[0] == 'c') {
      decompressedData = decompress(data);
    } else {
      decompressedData = data;
    }

    try (final ByteArrayInputStream stream = new ByteArrayInputStream(decompressedData);
        ValidatingObjectInputStream vois =
            new ValidatingObjectInputStream(stream) {
              @Override
              protected void invalidClassNameFound(String className)
                  throws java.io.InvalidClassException {
                logger.error("vois.accept: {}", className);
              }
            }) {

      // These classes are allowed to be deserialized. Others throw InvalidClassException.
      vois.accept(
          Long.class,
          Number.class,
          java.math.BigDecimal.class,
          java.math.BigInteger.class,
          java.util.HashMap.class,
          java.util.LinkedHashMap.class,
          java.util.Collections.class,
          Integer.class,
          java.util.ArrayList.class,
          Enum.class,
          org.springframework.security.core.authority.SimpleGrantedAuthority.class,
          onlineapp.service.library.config.auth.SpecialAccessUserPrincipal.class,
          org.springframework.security.core.authority.SimpleGrantedAuthority.class,
          onlineapp.service.library.config.auth.FormBasedUserPrincipal.class,
          onlineapp.service.library.service.model.UserAuthenticationModel.class,
          onlineapp.service.library.service.model.OrganisationAccessModel.class,
          org.springframework.security.web.csrf.DefaultCsrfToken.class,
          SecurityContextImpl.class,
          org.springframework.security.authentication.UsernamePasswordAuthenticationToken.class,
          org.springframework.security.authentication.AbstractAuthenticationToken.class,
          onlineapp.service.library.service.model.UserRoleModel.class,
          onlineapp.service.library.enumeration.OtpType.class,
          onlineapp.service.library.service.model.OtpModel.class);

      vois.accept(
          "java.util.Collections$UnmodifiableList",
          "java.util.Collections$UnmodifiableCollection",
          "onlineapp.service.library.service.model.UserRoleModel$Authority",
          "java.util.Collections$SingletonList",
          "java.time.Ser");

      return vois.readObject();
    } catch (IOException | ClassNotFoundException e) {
      logger.error("Unable to read data from redis, {}", e.getMessage());
    }
    return super.deserialize(decompressedData);
  }

  private byte[] compress(byte[] data) {
    try {
      return Snappy.compress(data);
    } catch (IOException e) {
      throw new SerializationException(e.getMessage());
    }
  }

  private byte[] decompress(byte[] data) {
    try {
      return Snappy.uncompress(data);
    } catch (IOException e) {
      throw new SerializationException(e.getMessage());
    }
  }
}
