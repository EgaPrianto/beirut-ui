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
import com.gdn.x.beirut.dto.request.CandidateDTORequest;
import com.gdn.x.beirut.dto.request.ListStringRequest;
import com.gdn.x.beirut.dto.request.PositionDTORequest;
import com.gdn.x.beirut.dto.request.UpdateCandidateStatusModelDTORequest;
import com.gdn.x.beirut.dto.request.UpdatePositionStatusModelDTORequest;
import com.gdn.x.beirut.dto.response.CandidateDTOResponse;
import com.gdn.x.beirut.dto.response.CandidatePositionDTOResponse;
import com.gdn.x.beirut.dto.response.CandidatePositionSolrDTOResponse;
import com.gdn.x.beirut.dto.response.PositionDTOResponse;
import com.gdn.x.beirut.dto.response.PositionDetailDTOResponse;
import com.gdn.x.ui.beirut.model.PositionDetail;
import com.gdn.x.ui.beirut.service.BeirutService;

@Service
public class BeirutServiceImpl implements BeirutService {

  private static final Logger LOG = LoggerFactory.getLogger(BeirutServiceImpl.class);

  @Autowired
  private BeirutApiClient beirutApiClient;

  @Override
  public GdnBaseRestResponse applyNewPosition(String requestId, String username,
      ApplyNewPositionModelDTORequest applyNewPositionModelDTORequest) throws Exception {
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
  public GdnBaseRestResponse deleteCandidate(String requestId, String username,
      ListStringRequest idsRequest) throws Exception {
    GdnBaseRestResponse gdnResponse =
        this.beirutApiClient.deleteCandidate(requestId, username, idsRequest);
    if (!gdnResponse.isSuccess()) {
      LOG.warn(
          "failed to findCandidateByCreatedDateBetweenAndStoreId with requestId:{} errorCode:{} errorMessage:{}",
          requestId, gdnResponse.getErrorCode(), gdnResponse.getErrorMessage());
    }
    return gdnResponse;
  }

  @Override
  public GdnBaseRestResponse deletePosition(String requestId, String username,
      ListStringRequest idsToDelete) throws Exception {
    GdnBaseRestResponse gdnResponse =
        this.beirutApiClient.deletePosition(requestId, username, idsToDelete);
    if (!gdnResponse.isSuccess()) {
      LOG.warn(
          "failed to findCandidateByCreatedDateBetweenAndStoreId with requestId:{} errorCode:{} errorMessage:{}",
          requestId, gdnResponse.getErrorCode(), gdnResponse.getErrorMessage());
    }
    return gdnResponse;
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
  public GdnRestListResponse<PositionDTOResponse> getAllPositionWithPageableNotDeleted(
      String requestId, String username, Integer page, Integer size) throws Exception {
    GdnRestListResponse<PositionDTOResponse> gdnPositionDTOResponses = this.beirutApiClient
        .getAllPositionWithPageableAndMarkForDelete(requestId, username, page, size, false);
    if (!gdnPositionDTOResponses.isSuccess()) {
      LOG.warn(
          "failed to getAllPositionWithPageable with requestId:{} errorCode:{} errorMessage:{}",
          requestId, gdnPositionDTOResponses.getErrorCode(),
          gdnPositionDTOResponses.getErrorMessage());
    }
    return gdnPositionDTOResponses;
  }

  @Override
  public byte[] getCandidateDetail(String requestId, String username, String id) throws Exception {
    return this.beirutApiClient.getCandidateDetail(requestId, username, id);
  }

  @Override
  public GdnRestListResponse<CandidatePositionSolrDTOResponse> getCandidatePositionBySolrQuery(
      String requestId, String username, String query, int page, int size) throws Exception {
    LOG.info("Beirut ServiceImpl QUERY DEBUG = " + query);
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

  @Override
  public GdnRestSingleResponse<CandidatePositionDTOResponse> getCandidatePositionDetailByStoreIdWithLogs(
      String requestId, String username, String idCandidate, String idPosition) throws Exception {
    GdnRestSingleResponse result = this.beirutApiClient.getCandidatePositionDetailByStoreIdWithLogs(
        requestId, "notused", username, idCandidate, idPosition);
    if (!result.isSuccess()) {
      LOG.warn("failed to updatePosition with requestId:{} errorCode:{} errorMessage:{}", requestId,
          result.getErrorCode(), result.getErrorMessage());
    }
    return result;
  }

  // @Override
  // public String getPositionDescription(String requestId, String username, String id)
  // throws Exception {
  // byte[] result = this.beirutApiClient.getPositionDescription(requestId, username, id);
  // return new String(result);
  // }

  @Override
  public GdnRestSingleResponse<PositionDTOResponse> getPositionById(String requestId,
      String username, String id) throws Exception {
    return this.beirutApiClient.getPositionId(requestId, username, id);
  }

  @Override
  public GdnRestListResponse<PositionDTOResponse> getPositionByTitle(String requestId,
      String username, String title) throws Exception {
    // TODO Auto-generated method stub
    return this.beirutApiClient.getPositionByTitle(requestId, username, title);
  }

  @Override
  public GdnRestSingleResponse<PositionDetail> getPositionDescription(String requestId,
      String username, String id) throws Exception {
    byte[] result = this.beirutApiClient.getPositionDescription(requestId, username, id);
    PositionDetail content = new PositionDetail();
    content.setPositionDetail(new String(result));
    return new GdnRestSingleResponse<PositionDetail>(content, requestId);
  }

  @Override
  public GdnRestListResponse<PositionDetailDTOResponse> getPositionDetailById(String requestId,
      String username, String id) throws Exception {
    GdnRestListResponse<PositionDetailDTOResponse> result =
        this.beirutApiClient.getPositionDetailById(requestId, username, id);
    if (!result.isSuccess()) {
      LOG.warn("failed to updatePosition with requestId:{} errorCode:{} errorMessage:{}", requestId,
          result.getErrorCode(), result.getErrorMessage());
    }
    return result;
  }

  @Override
  public GdnBaseRestResponse insertNewCandidate(String requestId, String username,
      String candidateDTORequestString, byte[] data, String filename) throws Exception {
    GdnBaseRestResponse gdnResponse = this.beirutApiClient.insertNewCandidate(requestId, username,
        candidateDTORequestString, filename, data);
    if (!gdnResponse.isSuccess()) {
      LOG.warn(
          "failed to findCandidateByCreatedDateBetweenAndStoreId with requestId:{} errorCode:{} errorMessage:{}",
          requestId, gdnResponse.getErrorCode(), gdnResponse.getErrorMessage());
    }
    return gdnResponse;
  }

  @Override
  public GdnBaseRestResponse insertNewPosition(String requestId, String username,
      String positionDTORequestString, byte[] data, String filename) throws Exception {
    GdnBaseRestResponse gdnPositionDTOResponse = this.beirutApiClient.insertNewPosition(requestId,
        username, positionDTORequestString, filename, data);
    if (!gdnPositionDTOResponse.isSuccess()) {
      LOG.warn(
          "failed to findCandidateByCreatedDateBetweenAndStoreId with requestId:{} errorCode:{} errorMessage:{}",
          requestId, gdnPositionDTOResponse.getErrorCode(),
          gdnPositionDTOResponse.getErrorMessage());
    }
    return gdnPositionDTOResponse;
  }

  @Override
  public GdnBaseRestResponse updateCandidateDetail(String requestId, String username, String id,
      byte[] data, String filename) throws Exception {
    GdnBaseRestResponse gdnResponse =
        this.beirutApiClient.updateCandidateDetail(requestId, username, id, filename, data);
    if (!gdnResponse.isSuccess()) {
      LOG.warn("failed to updateCandidateDetail with requestId:{} errorCode:{} errorMessage:{}",
          requestId, gdnResponse.getErrorCode(), gdnResponse.getErrorMessage());
    }
    return gdnResponse;
  }

  @Override
  public GdnBaseRestResponse updateCandidateInformation(String requestId, String username,
      CandidateDTORequest candidateDTORequest) throws Exception {
    GdnBaseRestResponse gdnResponse =
        this.beirutApiClient.updateCandidateInformation(requestId, username, candidateDTORequest);
    if (!gdnResponse.isSuccess()) {
      LOG.warn(
          "failed to updateCandidateInformation with requestId:{} errorCode:{} errorMessage:{}",
          requestId, gdnResponse.getErrorCode(), gdnResponse.getErrorMessage());
    }
    return gdnResponse;
  }

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
  public GdnBaseRestResponse updatePositionDescription(String requestId, String username, String id,
      byte[] data, String filename) throws Exception {
    GdnBaseRestResponse gdnBaseRestResponseUpdatePositionInformation =
        this.beirutApiClient.updatePositionDescription(requestId, username, id, filename, data);
    if (!gdnBaseRestResponseUpdatePositionInformation.isSuccess()) {
      LOG.warn(
          "failed to updateCandidateInformation with requestId:{} errorCode:{} errorMessage:{}",
          requestId, gdnBaseRestResponseUpdatePositionInformation.getErrorCode(),
          gdnBaseRestResponseUpdatePositionInformation.getErrorMessage());
    }
    return gdnBaseRestResponseUpdatePositionInformation;
  }

  @Override
  public GdnBaseRestResponse updatePositionInformation(String requestId, String username,
      PositionDTORequest positionDTORequest) throws Exception {
    GdnBaseRestResponse gdnBaseRestResponseUpdatePosition =
        this.beirutApiClient.updatePositionInformation(requestId, username, positionDTORequest);
    if (!gdnBaseRestResponseUpdatePosition.isSuccess()) {
      LOG.warn("failed to updatePosition with requestId:{} errorCode:{} errorMessage:{}", requestId,
          gdnBaseRestResponseUpdatePosition.getErrorCode(),
          gdnBaseRestResponseUpdatePosition.getErrorMessage());
    }
    return gdnBaseRestResponseUpdatePosition;
  }

  @Override
  public GdnBaseRestResponse updatePositionStatus(String requestId, String username,
      UpdatePositionStatusModelDTORequest updatePositionStatusModelDTORequest) throws Exception {
    GdnBaseRestResponse gdnBaseRestResponseUpdatePositionStatus = this.beirutApiClient
        .updatePositionStatus(requestId, username, updatePositionStatusModelDTORequest);
    if (!gdnBaseRestResponseUpdatePositionStatus.isSuccess()) {
      LOG.warn("failed to updatePosition with requestId:{} errorCode:{} errorMessage:{}", requestId,
          gdnBaseRestResponseUpdatePositionStatus.getErrorCode(),
          gdnBaseRestResponseUpdatePositionStatus.getErrorMessage());
    }
    return gdnBaseRestResponseUpdatePositionStatus;
  }


}
