package onlineapp.service.user.service.impl;

import static onlineapp.service.user.Constants.SINGPASS_USER_ACCOUNT_TYPE;

import onlineapp.service.library.enumeration.PortalType;
import onlineapp.service.library.enumeration.UserType;
import onlineapp.service.library.exception.ApplicationErrorCode;
import onlineapp.service.library.exception.ForbiddenException;
import onlineapp.service.library.exception.ResourceNotFoundException;
import onlineapp.service.library.service.LoginUserService;
import onlineapp.service.library.service.model.GenericListItemModel;
import onlineapp.service.library.service.model.SearchModel;
import onlineapp.service.user.Constants;
import onlineapp.service.user.elasticsearch.AccountDetailsIndexRepository;
import onlineapp.service.user.elasticsearch.document.AccountDetails;
import onlineapp.service.user.enumeration.AccountStatus;
import onlineapp.service.user.enumeration.Status;
import onlineapp.service.user.repository.OrganisationRepository;
import onlineapp.service.user.repository.UserRepository;
import onlineapp.service.user.repository.UserRequestRepository;
import onlineapp.service.user.repository.entity.User;
import onlineapp.service.user.repository.entity.UserRequest;
import onlineapp.service.user.service.AccountManagementQueryService;
import onlineapp.service.user.service.model.AccountDetailsSearchModel;
import onlineapp.service.user.service.model.AccountManagementFilterModel;
import onlineapp.service.user.util.TaskStatusUtils;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Optional;
import java.util.stream.Collectors;
import org.elasticsearch.index.query.BoolQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.elasticsearch.core.ElasticsearchOperations;
import org.springframework.data.elasticsearch.core.SearchHit;
import org.springframework.data.elasticsearch.core.SearchHits;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.data.elasticsearch.core.query.Query;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

@Service
public class AccountManagementQueryServiceImpl implements AccountManagementQueryService {

  @Autowired AccountDetailsIndexRepository accountDetailsIndexRepository;
  @Autowired ElasticsearchOperations elasticsearchOperations;
  @Autowired UserRequestRepository requestRepository;
  @Autowired UserRepository userRepository;
  @Autowired LoginUserService loginUserService;
  @Autowired OrganisationRepository organisationRepository;

  private final List<String> regexQueryParams =
      List.of(Constants.LOWERCASE_NAME, Constants.LOWERCASE_CANDIDATEID);
  private final List<String> personnelRegexQueryParams =
      List.of(Constants.LOWERCASE_NAME, Constants.LOWERCASE_CANDIDATEID, Constants.LOWERCASE_EMAIL);

  /** {@inheritDoc} */
  @Override
  public Page<AccountDetails> searchByCandidateIdOrName(AccountDetailsSearchModel searchModel) {
    searchModel.setSearchParam(searchModel.getSearchParam().toLowerCase(Locale.ROOT));
    Sort sort = Sort.by(Direction.ASC, "name");
    PageRequest pageRequest = PageRequest.of(searchModel.getPage(), searchModel.getSize(), sort);
    SearchHits<AccountDetails> searchResults =
        elasticsearchOperations.search(
            queryBuilder(searchModel, pageRequest, UserType.CANDIDATES), AccountDetails.class);
    List<AccountDetails> result;
    List<AccountDetails> content1 =
        searchResults.stream().map(SearchHit::getContent).collect(Collectors.toList());

    switch (searchModel.getActiontype().toUpperCase(Locale.ROOT)) {
      case "BLOCK_UNBLOCK":
        result = getBlockStatus(content1);
        break;
      case "UNLOCK":
        result = getLockedStatus(content1);
        break;
      default:
        result = content1;
        break;
    }

    // Remove field so that it is not shown in the front end. Do not put for @JsonIgnore fields
    result.stream().forEach(item -> item.setAccountStatus(null));

    return new PageImpl<>(result, pageRequest, searchResults.getTotalHits());
  }

  private List<AccountDetails> getLockedStatus(List<AccountDetails> searchHits) {
    for (AccountDetails accountDetails : searchHits) {
      String status = Constants.NOT_LOCKED;
      Optional<User> user = userRepository.findById(accountDetails.getId());
      if (user.isPresent()) {
        status =
            user.get().getUserCredentials().isLocked() ? Constants.LOCKED : Constants.NOT_LOCKED;
      }
      if (accountDetails.getAccountType().equalsIgnoreCase(SINGPASS_USER_ACCOUNT_TYPE)) {
        status = Constants.NOT_APPLICABLE;
      }
      accountDetails.setStatus(status);
    }

    return searchHits;
  }

  private List<AccountDetails> getBlockStatus(List<AccountDetails> searchHits) {

    for (AccountDetails accountDetails : searchHits) {
      Optional<UserRequest> request =
          requestRepository.findTopByTargetIdOrderByUpdatedAtDesc(accountDetails.getId());
      String status = Constants.NOT_BLOCKED;
      if (request.isPresent()) {
        status = TaskStatusUtils.getBlockStatus(request.get());
      }
      accountDetails.setStatus(status);
    }
    return searchHits;
  }

  @Override
  public List<GenericListItemModel<Long, String>> searchByCandidateId(SearchModel searchModel) {

    long u = loginUserService.getOrganisationId();
    searchModel.setQ(searchModel.getQuery().toLowerCase(Locale.ROOT));
    SearchHits<AccountDetails> searchResults =
        elasticsearchOperations.search(nricQueryBuilder(searchModel, u), AccountDetails.class);

    return searchResults.stream()
        .map(SearchHit::getContent)
        .map(data -> setData(data.getId(), data.getName()))
        .collect(Collectors.toList());
  }

  private GenericListItemModel<Long, String> setData(long id, String name) {
    GenericListItemModel<Long, String> object = new GenericListItemModel<>();
    object.setId(id);
    object.setName(name);
    return object;
  }

  private Query nricQueryBuilder(SearchModel searchModel, long id) {
    BoolQueryBuilder boolQueryBuilder = new BoolQueryBuilder().minimumShouldMatch(1);

    boolQueryBuilder.should(
        QueryBuilders.simpleQueryStringQuery(searchModel.getQuery())
            .field(Constants.LOWERCASE_CANDIDATEID)
            .analyzeWildcard(true));

    boolQueryBuilder.filter(QueryBuilders.termQuery("orgranisationId", id));

    return new NativeSearchQueryBuilder().withQuery(boolQueryBuilder).build();
  }

  private Query queryBuilder(
      AccountDetailsSearchModel searchModel, PageRequest pageRequest, UserType userType) {
    BoolQueryBuilder boolQueryBuilder = new BoolQueryBuilder().minimumShouldMatch(1);

    String regexTemplate = ".*%s.*";
    String regex = String.format(regexTemplate, searchModel.getSearchParam());
    regexQueryParams.forEach(
        element -> boolQueryBuilder.should(QueryBuilders.regexpQuery(element, regex)));

    boolQueryBuilder.must(
        QueryBuilders.simpleQueryStringQuery(userType.value()).field(Constants.USER_TYPE));

    String queryStringTemplate = "*\"%s\"*";
    String queryString = String.format(queryStringTemplate, searchModel.getSearchParam());
    boolQueryBuilder.should(
        QueryBuilders.simpleQueryStringQuery(queryString)
            .field(Constants.LOWERCASE_NAME)
            .analyzeWildcard(true));

    return new NativeSearchQueryBuilder()
        .withQuery(boolQueryBuilder)
        .withPageable(pageRequest)
        .build();
  }

  @Override
  public Page<AccountDetails> searchByPersonnelIdOrNameOrEmail(
      AccountManagementFilterModel searchModel, int page, int size, String sort, String order) {
    if (!PortalType.EPP.equals(loginUserService.getPortalInformation())) {
      throw new ForbiddenException(
          Constants.INVALID_ACCESS_MESSAGE, ApplicationErrorCode.PERMISSION_DENIED);
    }
    PageRequest pageRequest =
        PageRequest.of(page, size, Sort.by(Direction.fromString(order), sort));

    SearchHits<AccountDetails> searchResults =
        elasticsearchOperations.search(
            queryBuilder(searchModel, pageRequest, UserType.PERSONNEL), AccountDetails.class);
    List<AccountDetails> result =
        searchResults.stream().map(SearchHit::getContent).collect(Collectors.toList());

    // Remove field so that it is not shown in the front end. Do not put for @JsonIgnore fields
    // Convert the lock status
    result.stream()
        .forEach(
            item -> {
              item.setUsername(null);
              item.setAccountType(null);
              item.setId(0);
              if (Constants.ACTIVE.equals(item.getStatus())) {
                item.setStatus(Constants.NOT_LOCKED);
              }
            });

    return new PageImpl<>(result, pageRequest, searchResults.getTotalHits());
  }

  private Query queryBuilder(
      AccountManagementFilterModel searchModel, PageRequest pageRequest, UserType userType) {
    BoolQueryBuilder boolQueryBuilder = new BoolQueryBuilder();

    boolQueryBuilder.must(
        QueryBuilders.simpleQueryStringQuery(userType.value()).field(Constants.USER_TYPE));

    if (!StringUtils.isEmpty(searchModel.getQ())) {
      boolQueryBuilder.minimumShouldMatch(1);
      String regexTemplate = ".*%s.*";
      String regex = String.format(regexTemplate, searchModel.getQ().toLowerCase(Locale.ROOT));
      personnelRegexQueryParams.forEach(
          element -> boolQueryBuilder.should(QueryBuilders.regexpQuery(element, regex)));

      String queryStringTemplate = "*\"%s\"*";
      String queryString =
          String.format(queryStringTemplate, searchModel.getQ().toLowerCase(Locale.ROOT));
      boolQueryBuilder.should(
          QueryBuilders.simpleQueryStringQuery(queryString)
              .field(Constants.LOWERCASE_NAME)
              .analyzeWildcard(true));
    }

    if (!CollectionUtils.isEmpty(searchModel.getAccountStatus())) {
      BoolQueryBuilder accountStatusQuery = new BoolQueryBuilder();
      for (String accountStatus : searchModel.getAccountStatus()) {
        accountStatusQuery.should(
            QueryBuilders.simpleQueryStringQuery(accountStatus).field(Constants.ACCOUNT_STATUS));
      }
      boolQueryBuilder.must(accountStatusQuery);
    }

    if (!CollectionUtils.isEmpty(searchModel.getLockStatus())) {
      BoolQueryBuilder lockStatusQuery = new BoolQueryBuilder();
      for (String lockStatus : searchModel.getLockStatus()) {
        if (Constants.NOT_LOCKED.equals(lockStatus)) {
          lockStatus = Status.ACTIVE.toString();
        }
        lockStatusQuery.should(
            QueryBuilders.simpleQueryStringQuery(lockStatus).field(Constants.STATUS));
      }
      boolQueryBuilder.must(lockStatusQuery);
    }

    if (!CollectionUtils.isEmpty(searchModel.getSchool())) {
      List<String> idList =
          organisationRepository.findOrganisationIdByDescriptions(searchModel.getSchool());
      if (idList.isEmpty()) {
        throw new ResourceNotFoundException(
            Constants.ORGANISATION_NOT_FOUND, ApplicationErrorCode.ORGANIZATION_NOT_FOUND);
      }

      boolQueryBuilder.must(QueryBuilders.termsQuery(Constants.ORGANISATION_ID, idList));
    }

    return new NativeSearchQueryBuilder()
        .withQuery(boolQueryBuilder)
        .withPageable(pageRequest)
        .build();
  }

  public List<String> getAccountStatus() {
    List<String> accountStatusList = new ArrayList<>();
    accountStatusList.add((AccountStatus.ACTIVE.name()));
    accountStatusList.add((Constants.NOT_ACTIVATED));
    return accountStatusList;
  }

  public List<String> getLockedStatus() {
    List<String> lockStatusList = new ArrayList<>();
    lockStatusList.add((Constants.LOCKED));
    lockStatusList.add((Constants.NOT_LOCKED));
    lockStatusList.add((Constants.NOT_APPLICABLE));
    return lockStatusList;
  }
}
