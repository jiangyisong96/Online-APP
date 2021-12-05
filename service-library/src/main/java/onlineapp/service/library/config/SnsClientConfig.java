package onlineapp.service.library.config;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.InstanceProfileCredentialsProvider;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.sns.AmazonSNS;
import com.amazonaws.services.sns.AmazonSNSClientBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Sns client config.
 *
 * @author XingJun
 */
@Configuration
@ConditionalOnProperty(value = "aws.endpoint")
public class SnsClientConfig {

  private final String accessKey;
  private final String secretKey;
  private final String serviceEndpoint;
  private final String serviceRegion;

  public SnsClientConfig(
      @Value("${aws.access-key}") String accessKey,
      @Value("${aws.secret-key}") String secretKey,
      @Value("${aws.endpoint}") String serviceEndpoint,
      @Value("${aws.region}") String serviceRegion) {
    this.accessKey = accessKey;
    this.secretKey = secretKey;
    this.serviceEndpoint = serviceEndpoint;
    this.serviceRegion = serviceRegion;
  }

  @Bean
  public AmazonSNS snsClient() {
    var credentials = new BasicAWSCredentials(accessKey, secretKey);
    if (serviceEndpoint.isBlank()) {
      return AmazonSNSClientBuilder.standard()
          .withCredentials(new InstanceProfileCredentialsProvider(false))
          .withRegion(serviceRegion)
          .build();
    } else {
      var endpointConfig =
          new AwsClientBuilder.EndpointConfiguration(serviceEndpoint, serviceRegion);
      return AmazonSNSClientBuilder.standard()
          .withCredentials(new AWSStaticCredentialsProvider(credentials))
          .withEndpointConfiguration(endpointConfig)
          .build();
    }
  }
}
