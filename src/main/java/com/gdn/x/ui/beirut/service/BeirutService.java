package com.gdn.x.ui.beirut.service;


import com.gdn.common.web.wrapper.response.GdnBaseRestResponse;
import com.gdn.common.web.wrapper.response.GdnRestListResponse;
import com.gdn.common.web.wrapper.response.GdnRestSingleResponse;
import com.gdn.x.beirut.dto.request.ApplyNewPositionModelDTORequest;
import com.gdn.x.beirut.dto.request.ListStringRequest;
import com.gdn.x.beirut.dto.request.PositionDTORequest;
import com.gdn.x.beirut.dto.request.UpdateCandidateStatusModelDTORequest;
import com.gdn.x.beirut.dto.response.CandidateDTOResponse;
import com.gdn.x.beirut.dto.response.CandidatePositionSolrDTOResponse;
import com.gdn.x.beirut.dto.response.PositionDTOResponse;

public interface BeirutService {

  public GdnBaseRestResponse applyNewPosition(String requestId, String username,
      ApplyNewPositionModelDTORequest positionDTORequest) throws Exception;

  public GdnBaseRestResponse deleteCandidate(String requestId, String username,
      ListStringRequest idsRequest) throws Exception;

  public GdnBaseRestResponse deletePosition(String requestId, String username,
      ListStringRequest idsToDelete) throws Exception;

  public GdnRestListResponse<CandidateDTOResponse> findCandidateByCreatedDateBetweenAndStoreId(
      String requestId, String username, Long start, Long end, int page, int size) throws Exception;


  public GdnRestSingleResponse<CandidateDTOResponse> findCandidateByEmailAddressAndStoreId(
      String requestId, String username, String emailAddress) throws Exception;

  public GdnRestListResponse<PositionDTOResponse> getAllPositionWithPageable(String requestId,
      String username, int page, int size) throws Exception;

  public GdnRestListResponse<CandidatePositionSolrDTOResponse> getCandidatePositionBySolrQuery(
      String requestId, String username, String query, int page, int size) throws Exception;

  public GdnBaseRestResponse insertNewCandidate(String requestId, String username,
      String candidateDTORequestString, byte[] data, String filename) throws Exception;

  public GdnBaseRestResponse insertNewPosition(String requestId, String username,
      PositionDTORequest positionDTORequest) throws Exception;

  public GdnBaseRestResponse updateCandidatesStatus(String requestId, String username,
      UpdateCandidateStatusModelDTORequest updateCandidateStatusModelDTORequest) throws Exception;

  public GdnBaseRestResponse updatePosition(String requestId, String username,
      PositionDTORequest updatePositionDTORequest) throws Exception;

}
