package com.gdn.x.ui.beirut.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdn.common.web.wrapper.response.GdnRestListResponse;
import com.gdn.common.web.wrapper.response.GdnRestSingleResponse;
import com.gdn.x.beirut.clientsdk.BeirutApiClient;
import com.gdn.x.beirut.dto.response.CandidateDTOResponse;
import com.gdn.x.beirut.dto.response.PositionDTOResponse;
import com.gdn.x.ui.beirut.service.BeirutService;

@Service
public class BeirutServiceImpl implements BeirutService {
  private static final Logger LOG = LoggerFactory.getLogger(BeirutServiceImpl.class);

  @Autowired
  private BeirutApiClient beirutApiClient;

  @Override
  public GdnRestListResponse<CandidateDTOResponse> findCandidateByCreatedDateBetweenAndStoreId(
      String requestId, String username, Long start, Long end, int page, int size)
          throws Exception {
    GdnRestListResponse<CandidateDTOResponse> gdnCandidateDTOResponses = this.beirutApiClient
        .findCandidateByCreatedDateBetweenAndStoreId(requestId, username, start, end, page, size);
    if (!gdnCandidateDTOResponses.isSuccess()) {
      LOG.warn(
          "failed to findCandidateByCreatedDateBetweenAndStoreId with requestId:{} errorCode:{} errorMessage:{}",
          requestId, gdnCandidateDTOResponses.getErrorCode(),
          gdnCandidateDTOResponses.getErrorMessage());
    }
    return gdnCandidateDTOResponses;
  }

  @Override
  public GdnRestSingleResponse<CandidateDTOResponse> findCandidateByEmailAddressAndStoreId(
      String requestId, String username, int page, int size) throws Exception {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public GdnRestSingleResponse<CandidateDTOResponse> findCandidateByEmailAddressAndStoreId(
      String requestId, String username, String emailAddress) throws Exception {
    GdnRestSingleResponse<CandidateDTOResponse> gdnCandidateDTOResponse = this.beirutApiClient
        .findCandidateByEmailAddressAndStoreId(requestId, username, emailAddress);
    if (!gdnCandidateDTOResponse.isSuccess()) {
      LOG.warn(
          "failed to findCandidateByEmailAddressAndStoreId with requestId:{} errorCode:{} errorMessage:{}",
          requestId, gdnCandidateDTOResponse.getErrorCode(),
          gdnCandidateDTOResponse.getErrorMessage());
    }
    return gdnCandidateDTOResponse;
  }

  @Override
  public GdnRestListResponse<PositionDTOResponse> getAllPositionWithPageable(String requestId,
      String username, int page, int size) throws Exception {
    GdnRestListResponse<PositionDTOResponse> gdnPositionDTOResponses =
        this.beirutApiClient.getAllPositionWithPageable(requestId, username, page, size);
    if (!gdnPositionDTOResponses.isSuccess()) {
      LOG.warn(
          "failed to findCandidateByCreatedDateBetweenAndStoreId with requestId:{} errorCode:{} errorMessage:{}",
          requestId, gdnPositionDTOResponses.getErrorCode(),
          gdnPositionDTOResponses.getErrorMessage());
    }
    return gdnPositionDTOResponses;
  }

}
