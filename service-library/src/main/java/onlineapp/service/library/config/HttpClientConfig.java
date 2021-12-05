package onlineapp.service.library.config;

import java.security.KeyManagementException;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.util.concurrent.TimeUnit;
import org.apache.http.HeaderElement;
import org.apache.http.HeaderElementIterator;
import org.apache.http.HttpHost;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.conn.ssl.TrustSelfSignedStrategy;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicHeaderElementIterator;
import org.apache.http.protocol.HTTP;
import org.apache.http.ssl.SSLContextBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.TaskScheduler;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

/**
 * Supports both HTTP and HTTPS Uses a connection pool to re-use connections and save overhead of
 * creating connections. Has a custom connection keep-alive strategy (to apply a default keep-alive
 * if one isn't specified) Starts an idle connection monitor to continuously clean up stale
 * connections.
 *
 * @author XingJun
 */
@Configuration
@EnableScheduling
public class HttpClientConfig {

  private static final Logger logger = LoggerFactory.getLogger(HttpClientConfig.class);

  @Value("${http.client.max-total-connections}")
  private int maxTotalConnections;

  @Value("${http.client.max-connections-per-route}")
  private int maxConnectionsPerRoute;

  @Value("${http.client.connect-timeout}")
  private int connectTimeout;

  @Value("${http.client.request-timeout}")
  private int requestTimeout;

  @Value("${http.client.socket-timeout}")
  private int socketTimeout;

  @Value("${http.client.default.keep-alive-time}")
  private int defaultKeepAliveTime;

  @Value("${http.client.close-idle-connection.wait-time}")
  private int closeIdleConnectionWaitTime;

  @Value("${task.scheduling.pool.size}")
  private int schedulingPoolSize;

  @Value("${aws.backend-proxy.url}")
  private String backendProxyUrl;

  @Value("${aws.backend-proxy.port}")
  private int backendProxyPort;

  /**
   * A connection pool manager. Connections are pooled on a per route basis. A request for a route
   * which already the manager has persistent connections for available in the pool will be services
   * by leasing a connection from the pool rather than creating a brand new connection.
   *
   * @return PoolingHttpClientConnectionManager
   */
  @Bean
  public PoolingHttpClientConnectionManager poolingConnectionManager() {
    SSLContextBuilder builder = new SSLContextBuilder();
    try {
      builder.loadTrustMaterial(null, new TrustSelfSignedStrategy());
    } catch (NoSuchAlgorithmException | KeyStoreException e) {
      logger.error(
          "Pooling Connection Manager Initialisation failure because of {}", e.getMessage(), e);
    }

    SSLConnectionSocketFactory sslsf = null;
    try {
      sslsf = new SSLConnectionSocketFactory(builder.build());
    } catch (KeyManagementException | NoSuchAlgorithmException e) {
      logger.error(
          "Pooling Connection Manager Initialisation failure because of {}", e.getMessage(), e);
    }

    Registry<ConnectionSocketFactory> socketFactoryRegistry =
        RegistryBuilder.<ConnectionSocketFactory>create()
            .register("https", sslsf)
            .register("http", new PlainConnectionSocketFactory())
            .build();

    PoolingHttpClientConnectionManager poolingConnectionManager =
        new PoolingHttpClientConnectionManager(socketFactoryRegistry);
    poolingConnectionManager.setMaxTotal(maxTotalConnections);
    poolingConnectionManager.setDefaultMaxPerRoute(maxConnectionsPerRoute);
    return poolingConnectionManager;
  }

  /**
   * Strategy helps in setting time which decide how long a connection can remain idle before being
   * reused.
   *
   * @return ConnectionKeepAliveStrategy
   */
  @Bean
  public ConnectionKeepAliveStrategy connectionKeepAliveStrategy() {
    return (response, context) -> {
      HeaderElementIterator it =
          new BasicHeaderElementIterator(response.headerIterator(HTTP.CONN_KEEP_ALIVE));
      while (it.hasNext()) {
        HeaderElement he = it.nextElement();
        String param = he.getName();
        String value = he.getValue();

        if (value != null && param.equalsIgnoreCase("timeout")) {
          return Long.parseLong(value) * 1000;
        }
      }
      return defaultKeepAliveTime;
    };
  }

  /**
   * HttpClient to be used to get the connection to API endpoints.
   *
   * @return CloseableHttpClient
   */
  @Bean
  public CloseableHttpClient httpClient(
      PoolingHttpClientConnectionManager poolingHttpClientConnectionManager) {
    RequestConfig requestConfig =
        RequestConfig.custom()
            .setConnectionRequestTimeout(requestTimeout)
            .setConnectTimeout(connectTimeout)
            .setSocketTimeout(socketTimeout)
            .build();

    return HttpClients.custom()
        .setDefaultRequestConfig(requestConfig)
        .setConnectionManager(poolingHttpClientConnectionManager)
        .setKeepAliveStrategy(connectionKeepAliveStrategy())
        .disableCookieManagement()
        .build();
  }

  /**
   * HttpClient with proxy to be used to get the connection to API endpoints.
   *
   * @return CloseableHttpClient
   */
  @Bean
  public CloseableHttpClient httpClientProxy(
      CloseableHttpClient httpClient,
      PoolingHttpClientConnectionManager poolingHttpClientConnectionManager) {
    if (!backendProxyUrl.contains(".")) {
      return httpClient;
    }
    HttpHost proxy = new HttpHost(backendProxyUrl, backendProxyPort);
    RequestConfig requestConfig =
        RequestConfig.custom()
            .setConnectionRequestTimeout(requestTimeout)
            .setConnectTimeout(connectTimeout)
            .setSocketTimeout(socketTimeout)
            .setProxy(proxy)
            .build();

    return HttpClients.custom()
        .setDefaultRequestConfig(requestConfig)
        .setConnectionManager(poolingHttpClientConnectionManager)
        .setKeepAliveStrategy(connectionKeepAliveStrategy())
        .build();
  }

  /**
   * ThreadPoolTaskScheduler which internally utilizes ScheduledThreadPoolExecutor to schedule
   * commands to run after a given delay, or to execute periodically.
   *
   * @return TaskScheduler
   */
  @Bean
  public TaskScheduler taskScheduler() {
    ThreadPoolTaskScheduler scheduler = new ThreadPoolTaskScheduler();
    scheduler.setThreadNamePrefix("poolScheduler");
    scheduler.setPoolSize(schedulingPoolSize);
    return scheduler;
  }

  /**
   * Periodically check all connections and free up which have not been used and idle time has
   * elapsed.
   *
   * @param connectionManager PoolingHttpClientConnectionManager
   * @return Runnable
   */
  @Bean
  public Runnable idleConnectionMonitor(
      final PoolingHttpClientConnectionManager connectionManager) {
    class SimpleRunnable implements Runnable {
      @Override
      @Scheduled(fixedDelay = 10000)
      public void run() {
        try {
          if (connectionManager != null) {
            logger.trace("run IdleConnectionMonitor - Closing expired and idle connections...");
            connectionManager.closeExpiredConnections();
            connectionManager.closeIdleConnections(
                closeIdleConnectionWaitTime, TimeUnit.MILLISECONDS);
          } else {
            logger.trace(
                "run IdleConnectionMonitor - Http Client Connection manager is not initialised");
          }
        } catch (Exception e) {
          logger.error("run IdleConnectionMonitor - Exception occurred. msg={}", e.getMessage(), e);
        }
      }
    }
    return new SimpleRunnable();
  }
}
