package com.gdn.x.ui.beirut.service;

import org.springframework.web.multipart.MultipartFile;

import com.gdn.common.web.wrapper.response.GdnBaseRestResponse;
import com.gdn.common.web.wrapper.response.GdnRestListResponse;
import com.gdn.common.web.wrapper.response.GdnRestSingleResponse;
import com.gdn.x.beirut.dto.request.ListStringRequest;
import com.gdn.x.beirut.dto.request.PositionDTORequest;
import com.gdn.x.beirut.dto.response.CandidateDTOResponse;
import com.gdn.x.beirut.dto.response.PositionDTOResponse;

public interface BeirutService {

  public GdnBaseRestResponse deleteCandidate(String requestId, String username,
      ListStringRequest idsRequest) throws Exception;

  public GdnBaseRestResponse deletePosition(String requestId, String username,
      ListStringRequest idsToDelete) throws Exception;

  public GdnRestListResponse<CandidateDTOResponse> findCandidateByCreatedDateBetweenAndStoreId(
      String requestId, String username, Long start, Long end, int page, int size) throws Exception;

  public GdnRestSingleResponse<CandidateDTOResponse> findCandidateByEmailAddressAndStoreId(
      String requestId, String username, int page, int size) throws Exception;

  public GdnRestSingleResponse<CandidateDTOResponse> findCandidateByEmailAddressAndStoreId(
      String requestId, String username, String emailAddress) throws Exception;

  public GdnRestListResponse<PositionDTOResponse> getAllPositionWithPageable(String requestId,
      String username, int page, int size) throws Exception;

  public GdnBaseRestResponse insertNewCandidate(String requestId, String username,
      String candidateDTORequestString, MultipartFile file) throws Exception;

  public GdnRestSingleResponse<PositionDTOResponse> insertNewPosition(String requestId,
      String username, PositionDTORequest positionDTORequest) throws Exception;
}
