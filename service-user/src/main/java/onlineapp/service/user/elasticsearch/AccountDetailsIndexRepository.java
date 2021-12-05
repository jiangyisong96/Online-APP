package onlineapp.service.user.elasticsearch;

import onlineapp.service.user.elasticsearch.document.AccountDetails;
import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.elasticsearch.annotations.Query;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

public interface AccountDetailsIndexRepository
    extends ElasticsearchRepository<AccountDetails, Long> {

  @Query(
      "{\"bool\":{\"should\":[{\"regexp\":{\"candidateId.lowercase\":{\"value\":\".*?0.*\"}}},"
          + "{\"regexp\":{\"name.lowercase\":{\"value\":\".*?0.*\"}}},"
          + "{\"simple_query_string\":{\"query\":\"*\\\"?0\\\"*\",\"fields\":[\"name.lowercase\"],\"analyze_wildcard\":true}}],"
          + "\"minimum_should_match\":1}}")
  Page<AccountDetails> findAllByNameOrCandidateIdContaining(
      String searchParam, PageRequest pageable);

  List<AccountDetails> findAllByCandidateId(String candidateId);
}
