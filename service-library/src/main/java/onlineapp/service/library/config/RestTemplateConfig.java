package onlineapp.service.library.config;

import org.apache.http.impl.client.CloseableHttpClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.HttpComponentsClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

/**
 * Rest template config.
 *
 * @author XingJun
 */
@Configuration
public class RestTemplateConfig {

  /**
   * ClientHttpRequestFactory implementation that use Apache HttpClient to create requests. To be
   * used to create RestTemplate
   *
   * @param httpClient CloseableHttpClient
   * @return HttpComponentsClientHttpRequestFactory
   */
  @Bean
  public HttpComponentsClientHttpRequestFactory clientHttpRequestFactory(
      CloseableHttpClient httpClient) {
    HttpComponentsClientHttpRequestFactory clientHttpRequestFactory =
        new HttpComponentsClientHttpRequestFactory();
    clientHttpRequestFactory.setHttpClient(httpClient);
    return clientHttpRequestFactory;
  }

  /**
   * ClientHttpRequestFactory implementation that use Apache HttpClient to create requests. To be
   * used to create RestTemplate with proxy
   *
   * @param httpClientProxy CloseableHttpClient
   * @return HttpComponentsClientHttpRequestFactory
   */
  @Bean
  public HttpComponentsClientHttpRequestFactory clientHttpRequestProxyFactory(
      CloseableHttpClient httpClientProxy) {
    HttpComponentsClientHttpRequestFactory clientHttpRequestFactory =
        new HttpComponentsClientHttpRequestFactory();
    clientHttpRequestFactory.setHttpClient(httpClientProxy);
    return clientHttpRequestFactory;
  }

  /**
   * Rest template configuration
   *
   * @param clientHttpRequestFactory HttpComponentsClientHttpRequestFactory
   * @return RestTemplate
   */
  @Bean
  public RestTemplate restTemplate(
      HttpComponentsClientHttpRequestFactory clientHttpRequestFactory) {
    return new RestTemplate(clientHttpRequestFactory);
  }

  /**
   * Rest template configuration for call between micro-services.
   *
   * @param clientHttpRequestFactory HttpComponentsClientHttpRequestFactory
   * @return RestTemplate
   */
  @Bean
  @LoadBalanced
  public RestTemplate serviceRestTemplate(
      HttpComponentsClientHttpRequestFactory clientHttpRequestFactory) {
    return new RestTemplate(clientHttpRequestFactory);
  }

  /**
   * Rest template configuration with proxy
   *
   * @return RestTemplate
   */
  @Bean
  public RestTemplate restTemplateProxy(
      HttpComponentsClientHttpRequestFactory clientHttpRequestProxyFactory) {
    return new RestTemplate(clientHttpRequestProxyFactory);
  }
}
