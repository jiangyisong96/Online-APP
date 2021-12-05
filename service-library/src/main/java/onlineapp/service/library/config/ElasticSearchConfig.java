package onlineapp.service.library.config;

import org.apache.http.HttpHost;
import org.apache.http.ssl.SSLContexts;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestHighLevelClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.ElasticsearchRestTemplate;

@Configuration
@ConditionalOnProperty(value = "elasticsearch.host")
public class ElasticSearchConfig {
  public static final Logger logger = LoggerFactory.getLogger(ElasticSearchConfig.class);

  private final String elasticSearchHost;
  private final boolean usingSsl;
  private final long elasticSearchSocketTimeout;
  private final long elasticSearchConnectTimeout;
  private final int maxConnections;
  private final int maxConnectionsPerRoute;

  public ElasticSearchConfig(
      @Value("${elasticsearch.host}") String host,
      @Value("${elasticsearch.socket-timeout}") long socketTimeout,
      @Value("${elasticsearch.using-ssl}") boolean usingSsl,
      @Value("${elasticsearch.connect-timeout}") long connectTimeout,
      @Value("${elasticsearch.max-connections}") int maxConnections,
      @Value("${elasticsearch.max-connections-per-route}") int maxConnectionsPerRoute) {
    this.elasticSearchSocketTimeout = connectTimeout;
    this.elasticSearchHost = host;
    this.elasticSearchConnectTimeout = socketTimeout;
    this.usingSsl = usingSsl;
    this.maxConnections = maxConnections;
    this.maxConnectionsPerRoute = maxConnectionsPerRoute;
  }

  @Bean(destroyMethod = "close")
  public RestHighLevelClient client() {
    return new RestHighLevelClient(
        RestClient.builder(HttpHost.create(elasticSearchHost))
            .setHttpClientConfigCallback(
                httpAsyncClientBuilder -> {
                  var b =
                      httpAsyncClientBuilder
                          .setMaxConnTotal(maxConnections)
                          .setMaxConnPerRoute(maxConnectionsPerRoute);
                  if (usingSsl) {
                    logger.info("Turning on ssl on Elastic Search.");
                    b.setSSLContext(SSLContexts.createDefault());
                  }
                  return b;
                })
            .setRequestConfigCallback(
                builder ->
                    builder
                        .setConnectTimeout((int) elasticSearchConnectTimeout)
                        .setSocketTimeout((int) elasticSearchSocketTimeout)));

    // :https://stackoverflow.com/questions/66025610/how-to-close-elasticsearch-resthighlevelclient-in-spring-data-in-order-to-avoid
  }

  @Bean
  public ElasticsearchOperations elasticsearchTemplate() {
    return new ElasticsearchRestTemplate(client());
    // NOSONAR
  }
}
