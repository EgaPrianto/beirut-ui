package com.gdn.x.ui.beirut.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdn.common.util.GdnUUIDHelper;
import com.gdn.common.web.wrapper.response.GdnBaseRestResponse;
import com.gdn.common.web.wrapper.response.GdnRestListResponse;
import com.gdn.x.beirut.dto.request.ApplyNewPositionModelDTORequest;
import com.gdn.x.beirut.dto.request.ListStringRequest;
import com.gdn.x.beirut.dto.request.PositionDTORequest;
import com.gdn.x.beirut.dto.request.UpdateCandidateStatusModelDTORequest;
import com.gdn.x.beirut.dto.response.CandidatePositionSolrDTOResponse;
import com.gdn.x.beirut.dto.response.PositionDTOResponse;
import com.gdn.x.ui.beirut.service.BeirutService;

@Controller
@RequestMapping(value = BeirutController.BASE_PATH)
public class BeirutController {
  @SuppressWarnings("unused")
  private static final Logger LOG = LoggerFactory.getLogger(BeirutController.class);

  public static final String BASE_PATH = "/api";
  public static final String UPDATE_POSITION = "/update-position";
  public static final String GET_ALL_POSITION = "/get-all-position";
  public static final String APPLY_NEW_POSITION = "/apply-new-position";
  public static final String GET_ALL_CANDIDATE_POSITION = "/get-all-candidate-position";
  public static final String UPDATE_CANDIDATE_STATUS = "/update-candidate-status";
  public static final String INSERT_NEW_POSITION = "/insert-new-position";
  public static final String INSERT_NEW_CANDIDATE = "/insert-new-candidate";
  public static final String DELETE_CANDIDATE = "/delete-candidate";
  public static final String DELETE_POSITION = "/delete-position";

  @Autowired
  private BeirutService beirutService;

  @RequestMapping(value = BeirutController.APPLY_NEW_POSITION)
  @ResponseBody
  public GdnBaseRestResponse applyNewPosition(
      @RequestBody ApplyNewPositionModelDTORequest applyNewPositionModelDTORequest)
          throws Exception {
    GdnBaseRestResponse result = this.beirutService.applyNewPosition(generateRequestId(),
        getUsername(), applyNewPositionModelDTORequest);
    return result;
  }

  @RequestMapping(value = BeirutController.DELETE_CANDIDATE)
  @ResponseBody
  public GdnBaseRestResponse deleteCandidate(@RequestBody ListStringRequest listStringRequest)
      throws Exception {
    GdnBaseRestResponse result =
        this.beirutService.deleteCandidate(generateRequestId(), getUsername(), listStringRequest);
    return result;
  }

  @RequestMapping(value = BeirutController.DELETE_POSITION)
  @ResponseBody
  public GdnBaseRestResponse deletePosition(@RequestBody ListStringRequest listStringRequest)
      throws Exception {
    GdnBaseRestResponse result =
        this.beirutService.deletePosition(generateRequestId(), getUsername(), listStringRequest);
    return result;
  }

  private String generateRequestId() {
    return GdnUUIDHelper.generateUUID();
  }

  @RequestMapping(value = BeirutController.GET_ALL_POSITION)
  @ResponseBody
  public GdnRestListResponse<PositionDTOResponse> getAllPositionWithPageable(
      @RequestParam Integer page, @RequestParam Integer size) throws Exception {
    GdnRestListResponse<PositionDTOResponse> result = this.beirutService
        .getAllPositionWithPageable(this.generateRequestId(), this.getUsername(), page, size);
    return result;
  }

  @RequestMapping(value = BeirutController.GET_ALL_CANDIDATE_POSITION)
  @ResponseBody
  public GdnRestListResponse<CandidatePositionSolrDTOResponse> getCandidatePositionBySolrQuery(
      @RequestParam String query, @RequestParam Integer page, @RequestParam Integer size)
          throws Exception {
    GdnRestListResponse<CandidatePositionSolrDTOResponse> result = this.beirutService
        .getCandidatePositionBySolrQuery(generateRequestId(), getUsername(), query, page, size);
    return result;
  }

  private String getUsername() {
    final org.springframework.security.core.Authentication auth =
        SecurityContextHolder.getContext().getAuthentication();
    return auth.getName();
  }

  @RequestMapping(value = BeirutController.INSERT_NEW_CANDIDATE)
  @ResponseBody
  public GdnBaseRestResponse insertNewCandidate(@RequestBody String candidateDTORequestString,
      @RequestParam byte[] data, @RequestParam String filename) throws Exception {
    GdnBaseRestResponse result = this.beirutService.insertNewCandidate(generateRequestId(),
        getUsername(), candidateDTORequestString, data, filename);
    return result;
  }

  @RequestMapping(value = BeirutController.INSERT_NEW_POSITION)
  @ResponseBody
  public GdnBaseRestResponse insertNewPosition(@RequestBody String positionDTORequestString,
      @RequestParam byte[] data, @RequestParam String filename) throws Exception {
    GdnBaseRestResponse result = this.beirutService.insertNewPosition(generateRequestId(),
        getUsername(), positionDTORequestString, data, filename);
    return result;
  }

  @RequestMapping(value = BeirutController.UPDATE_CANDIDATE_STATUS)
  @ResponseBody
  public GdnBaseRestResponse updateCandidatesStatus(
      @RequestBody UpdateCandidateStatusModelDTORequest updateCandidateStatusModelDTORequest)
          throws Exception {
    GdnBaseRestResponse result = this.beirutService.updateCandidatesStatus(generateRequestId(),
        getUsername(), updateCandidateStatusModelDTORequest);
    return result;
  }

  @RequestMapping(value = BeirutController.UPDATE_POSITION)
  @ResponseBody
  public GdnBaseRestResponse updatePosition(@RequestBody PositionDTORequest positionDTORequest)
      throws Exception {
    GdnBaseRestResponse result =
        this.beirutService.updatePosition(generateRequestId(), getUsername(), positionDTORequest);
    return result;
  }

}
