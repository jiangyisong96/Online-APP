package onlineapp.service.library.util;

import java.net.InetSocketAddress;
import java.net.Proxy;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;

/**
 * Utils to proxyUtils
 *
 * @author Tony
 */
public class ProxyUtil {
  /** This class is not meant to be instantiated. */
  private ProxyUtil() {}

  /**
   * To help create proxy factory
   *
   * @param proxyServerHost
   * @param proxyServerPort
   * @param restTemplate
   * @return proxied RestTemplate
   */
  public static RestTemplate setProxyForRestTemplate(
      String proxyServerHost, String proxyServerPort, RestTemplate restTemplate) {
    var proxy =
        new Proxy(
            Proxy.Type.HTTP,
            new InetSocketAddress(proxyServerHost, Integer.parseInt(proxyServerPort)));
    var requestFactory = new SimpleClientHttpRequestFactory();
    requestFactory.setProxy(proxy);
    restTemplate.setRequestFactory(requestFactory);
    return restTemplate;
  }
}
