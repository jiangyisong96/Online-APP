package onlineapp.service.user.service.converter;

import onlineapp.service.library.enumeration.UserIdType;
import onlineapp.service.library.service.model.IExamMasterCodeTypeAndDescModel;
import onlineapp.service.library.service.model.IexamsCandidateProfileModel;
import onlineapp.service.library.util.DateTimeUtils;
import onlineapp.service.user.Constants;
import onlineapp.service.user.repository.entity.Candidate;
import onlineapp.service.user.util.IexamsMasterCodeUtils;
import java.util.List;
import org.apache.commons.lang.StringUtils;

public class IexamsCandidateProfileModelConverter {
  // To prevent the dev from initializing
  private IexamsCandidateProfileModelConverter() {}

  public static IexamsCandidateProfileModel convertFrom(
      Candidate candidate, List<IExamMasterCodeTypeAndDescModel> iexamsCodeList) {

    IexamsCandidateProfileModel profile =
        IexamsCandidateProfileModel.builder()
            .birthDt(DateTimeUtils.formatForIexams(candidate.getDateOfBirth()))
            .statutoryNm(candidate.getName())
            // Not setting the chinese name because dont need to update iexams
            .genderTypeCd(
                IexamsMasterCodeUtils.findMatchingMasterCode(
                    candidate.getGender(),
                    Constants.GENDER_TYPE_CD,
                    iexamsCodeList)) // Need to map to CD
            .raceCd(
                IexamsMasterCodeUtils.findMatchingMasterCode(
                    candidate.getRace(), Constants.RACE_CD, iexamsCodeList)) // Need to map to CD
            .cddtTypeCd(candidate.getCandidateType().getCdCode())
            .foreignAddr1(candidate.getForeignAddress1())
            .foreignAddr2(candidate.getForeignAddress2())
            .foreignAddr3(candidate.getForeignAddress3())
            .cccInd('N')
            .hypyNm(candidate.getHanyuPinyinName())
            .citizTypeCd(
                IexamsMasterCodeUtils.findMatchingMasterCode(
                    candidate.getCitizenship(),
                    Constants.CITIZENSHIP_TYPE_CD,
                    iexamsCodeList)) // Need to map to CD
            .prStatusCd(
                IexamsMasterCodeUtils.findMatchingMasterCode(
                    candidate.getPrStatus(),
                    Constants.PR_STATUS_CD,
                    iexamsCodeList)) // Need to map to CD
            .nationalityCd(
                IexamsMasterCodeUtils.findMatchingMasterCode(
                    candidate.getNationality(),
                    Constants.NATIONALITY_CD,
                    iexamsCodeList)) // Need to map to CD
            .idType(candidate.getUserIdType().getCdCode().charAt(0))
            .build();

    Character prefContact = null;
    if (candidate.getMobileNumber() != null) {
      prefContact = 'M';
    } else if (candidate.getTelephoneNumber() == null) {
      prefContact = 'T';
    }

    Character prefAddr = null;
    if (candidate.getLocalAddress() != null) {
      prefAddr = 'L';
    } else if (StringUtils.isNotBlank(candidate.getForeignAddress1())) {
      prefAddr = 'F';
    }

    profile.setPrefContact(prefContact);
    profile.setPrefAddr(prefAddr);

    if (StringUtils.isNotBlank(candidate.getEmail())) {
      String[] emailParts = candidate.getEmail().split("@");
      profile.setEmailAtSign('@');
      profile.setEmailDomain(emailParts[1]);
      profile.setEmailLocalPart(emailParts[0]);
    }

    if (candidate.getMobileNumber() != null) {
      profile.setMobileNo(candidate.getMobileNumber().getNumber());
      profile.setMobileCountryCode(candidate.getMobileNumber().getCountryCode());
      profile.setMobilePrefix("+");
    }

    if (candidate.getLocalAddress() != null) {
      profile.setBldgNm(candidate.getLocalAddress().getBuildingName());
      profile.setBlkHseNo(candidate.getLocalAddress().getBlockNumber());
      profile.setFlrNo(candidate.getLocalAddress().getFloorNumber());
      profile.setUnitNo(candidate.getLocalAddress().getUnitNumber());
      profile.setStreetNm(candidate.getLocalAddress().getStreetName());
      profile.setPostalCd(candidate.getLocalAddress().getPostalCode());
    }

    if (StringUtils.isNotBlank(candidate.getNextOfKinRelationship())) {
      profile.setEmargRelCd(
          IexamsMasterCodeUtils.findMatchingMasterCode(
              candidate.getNextOfKinRelationship(), Constants.RELATIONSHIP_CD, iexamsCodeList));
      profile.setEmargeName(candidate.getNextOfKinName());
      profile.setEmergContactCountryCd(candidate.getNextOfKinContactNumber().getCountryCode());
      profile.setEmergContactNo(candidate.getNextOfKinContactNumber().getNumber());
      profile.setEmergContactPrefix("+");
    }

    if (StringUtils.isNotBlank(candidate.getSecondRace())) {
      profile.setRace2Cd(
          IexamsMasterCodeUtils.findMatchingMasterCode(
              candidate.getSecondRace(), Constants.RACE_CD, iexamsCodeList));
    }

    if (candidate.getUserIdType().equals(UserIdType.NRIC_OR_FIN)) {
      profile.setNric(candidate.getCandidateId());
    } else {
      profile.setForeignDocNo(candidate.getCandidateId());
    }
    if (candidate.getTelephoneNumber() != null) {
      profile.setTelephoneNo(candidate.getTelephoneNumber().getNumber());
      profile.setTelephoneCountryCode(candidate.getTelephoneNumber().getCountryCode());
      profile.setTelephonePrefix("+");
    }
    if (candidate.getNationalityIssueDate() != null) {
      profile.setNationalityIssueDt(
          DateTimeUtils.formatForIexams(candidate.getNationalityIssueDate()));
    }

    return profile;
  }
}
