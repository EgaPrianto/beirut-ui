package com.gdn.x.ui.beirut.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdn.common.web.wrapper.response.GdnBaseRestResponse;
import com.gdn.common.web.wrapper.response.GdnRestListResponse;
import com.gdn.common.web.wrapper.response.GdnRestSingleResponse;
import com.gdn.x.beirut.clientsdk.BeirutApiClient;
import com.gdn.x.beirut.dto.request.ApplyNewPositionModelDTORequest;
import com.gdn.x.beirut.dto.request.UpdateCandidateStatusModelDTORequest;
import com.gdn.x.beirut.dto.request.UpdatePositionModelDTORequest;
import com.gdn.x.beirut.dto.response.CandidateDTOResponse;
import com.gdn.x.beirut.dto.response.CandidatePositionSolrDTOResponse;
import com.gdn.x.beirut.dto.response.PositionDTOResponse;
import com.gdn.x.ui.beirut.service.BeirutService;

@Service
public class BeirutServiceImpl implements BeirutService {
  private static final Logger LOG = LoggerFactory.getLogger(BeirutServiceImpl.class);

  @Autowired
  private BeirutApiClient beirutApiClient;

  @Override
  public GdnBaseRestResponse applyNewPosition(String requestId, String username,
      ApplyNewPositionModelDTORequest applyNewPositionModelDTORequest) throws Exception {
    // TODO Auto-generated method stub
    GdnBaseRestResponse gdnBaseRestResponseApplyNewPosition =
        this.beirutApiClient.applyNewPosition(requestId, username, applyNewPositionModelDTORequest);
    if (!gdnBaseRestResponseApplyNewPosition.isSuccess()) {
      LOG.warn("failed to applyNewPosition with requestId:{} errorCode:{} errorMessage:{}",
          requestId, gdnBaseRestResponseApplyNewPosition.getErrorCode(),
          gdnBaseRestResponseApplyNewPosition.getErrorMessage());
    }
    return gdnBaseRestResponseApplyNewPosition;
  }

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
          "failed to getAllPositionWithPageable with requestId:{} errorCode:{} errorMessage:{}",
          requestId, gdnPositionDTOResponses.getErrorCode(),
          gdnPositionDTOResponses.getErrorMessage());
    }
    return gdnPositionDTOResponses;
  }

  @Override
  public GdnRestListResponse<CandidatePositionSolrDTOResponse> getCandidatePositionBySolrQuery(
      String requestId, String username, String query, int page, int size) throws Exception {
    GdnRestListResponse<CandidatePositionSolrDTOResponse> gdnCandidatePositionSolrDTOResponses =
        this.beirutApiClient.getCandidatePositionBySolrQuery(requestId, username, query, page,
            size);
    if (!gdnCandidatePositionSolrDTOResponses.isSuccess()) {
      LOG.warn(
          "failed to getCandidatePositionBySolrQuery with requestId:{} errorCode:{} errorMessage:{}",
          requestId, gdnCandidatePositionSolrDTOResponses.getErrorCode(),
          gdnCandidatePositionSolrDTOResponses.getErrorMessage());
    }
    return gdnCandidatePositionSolrDTOResponses;
  }

  // @Override
  // public GdnBaseRestResponse updateCandidateDetail(String requestId, String username,
  // String idCandidate, MultipartFile file) throws Exception {
  // GdnBaseRestResponse gdnBaseRestResponseUpdateCandidateDetail =
  // this.beirutApiClient.updateCandidateDetail(requestId, username, idCandidate, file);
  // if (!gdnBaseRestResponseUpdateCandidateDetail.isSuccess()) {
  // LOG.warn("failed to updateCandidateDetail with requestId:{} errorCode:{} errorMessage:{}",
  // requestId, gdnBaseRestResponseUpdateCandidateDetail.getErrorCode(),
  // gdnBaseRestResponseUpdateCandidateDetail.getErrorMessage());
  // }
  // return gdnBaseRestResponseUpdateCandidateDetail;
  // }

  @Override
  public GdnBaseRestResponse updateCandidatesStatus(String requestId, String username,
      UpdateCandidateStatusModelDTORequest updateCandidateStatusModelDTORequest) throws Exception {
    GdnBaseRestResponse gdnBaseRestResponseUpdateCandidateStatus = this.beirutApiClient
        .updateCandidatesStatus(requestId, username, updateCandidateStatusModelDTORequest);
    if (!gdnBaseRestResponseUpdateCandidateStatus.isSuccess()) {
      LOG.warn("failed to updateCandidateDetail with requestId:{} errorCode:{} errorMessage:{}",
          requestId, gdnBaseRestResponseUpdateCandidateStatus.getErrorCode(),
          gdnBaseRestResponseUpdateCandidateStatus.getErrorMessage());
    }
    return gdnBaseRestResponseUpdateCandidateStatus;
  }

  @Override
  public GdnBaseRestResponse updatePosition(String requestId, String username,
      UpdatePositionModelDTORequest updatePositionModelDTORequest) throws Exception {
    GdnBaseRestResponse gdnBaseRestResponseUpdatePosition =
        this.beirutApiClient.updatePosition(requestId, username, updatePositionModelDTORequest);
    if (!gdnBaseRestResponseUpdatePosition.isSuccess()) {
      LOG.warn("failed to updatePosition with requestId:{} errorCode:{} errorMessage:{}", requestId,
          gdnBaseRestResponseUpdatePosition.getErrorCode(),
          gdnBaseRestResponseUpdatePosition.getErrorMessage());
    }
    return gdnBaseRestResponseUpdatePosition;
  }

}
