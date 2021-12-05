package onlineapp.service.library.config;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.InstanceProfileCredentialsProvider;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.secretsmanager.AWSSecretsManager;
import com.amazonaws.services.secretsmanager.AWSSecretsManagerClientBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Config file for secret manager.
 *
 * @author Dave, XingJun
 */
@Configuration
@ConditionalOnProperty(value = "aws.endpoint")
public class SecretManagerClientConfig {
  private final String accessKey;
  private final String secretKey;
  private final String serviceEndpoint;
  private final String serviceRegion;
  private BasicAWSCredentials credentials;
  private AwsClientBuilder.EndpointConfiguration endpointConfig;

  public SecretManagerClientConfig(
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
  public AWSSecretsManager secretsManagerClient() {
    credentials = new BasicAWSCredentials(accessKey, secretKey);
    if (serviceEndpoint.isBlank()) {
      return AWSSecretsManagerClientBuilder.standard()
          .withCredentials(new InstanceProfileCredentialsProvider(false))
          .withRegion(serviceRegion)
          .build();

    } else {
      endpointConfig = new AwsClientBuilder.EndpointConfiguration(serviceEndpoint, serviceRegion);
      return AWSSecretsManagerClientBuilder.standard()
          .withCredentials(new AWSStaticCredentialsProvider(credentials))
          .withEndpointConfiguration(endpointConfig)
          .build();
    }
  }
}
