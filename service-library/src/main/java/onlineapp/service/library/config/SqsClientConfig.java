package onlineapp.service.library.config;

import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.InstanceProfileCredentialsProvider;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.sqs.AmazonSQS;
import com.amazonaws.services.sqs.AmazonSQSClientBuilder;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConditionalOnProperty(value = "aws.endpoint")
public class SqsClientConfig {

  private final String accessKey;
  private final String secretKey;
  private final String serviceEndpoint;
  private final String serviceRegion;

  public SqsClientConfig(
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
  public AmazonSQS sqsClient() {
    var credentials = new BasicAWSCredentials(accessKey, secretKey);
    if (serviceEndpoint.isBlank()) {
      return AmazonSQSClientBuilder.standard()
          .withCredentials(new InstanceProfileCredentialsProvider(false))
          .withRegion(serviceRegion)
          .build();
    } else {
      var endpointConfig = new AwsClientBuilder.EndpointConfiguration(serviceEndpoint, serviceRegion);
      return AmazonSQSClientBuilder.standard()
          .withCredentials(new AWSStaticCredentialsProvider(credentials))
          .withEndpointConfiguration(endpointConfig)
          .build();
    }
  }
}
