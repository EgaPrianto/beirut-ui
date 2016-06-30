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
import com.gdn.x.beirut.dto.request.ListStringRequest;
import com.gdn.x.beirut.dto.request.PositionDTORequest;
import com.gdn.x.beirut.dto.request.StatusDTORequest;
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

  @Autowired
  private BeirutService beirutService;

  @RequestMapping(value = BeirutController.APPLY_NEW_POSITION)
  @ResponseBody
  public GdnBaseRestResponse applyNewPosition(@RequestParam String idCandidate,
      @RequestBody ListStringRequest listPositionIdStrings) throws Exception {
    GdnBaseRestResponse result = this.beirutService.applyNewPosition(generateRequestId(),
        getUsername(), idCandidate, listPositionIdStrings);
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

  @RequestMapping(value = BeirutController.UPDATE_CANDIDATE_STATUS)
  @ResponseBody
  public GdnBaseRestResponse updateCandidatesStatus(@RequestParam StatusDTORequest status,
      @RequestParam String idPosition, @RequestBody ListStringRequest idCandidates)
          throws Exception {
    GdnBaseRestResponse result = this.beirutService.updateCandidatesStatus(generateRequestId(),
        getUsername(), status, idPosition, idCandidates);
    return result;
  }

  @RequestMapping(value = BeirutController.UPDATE_POSITION)
  @ResponseBody
  public GdnBaseRestResponse updatePosition(@RequestParam String id,
      @RequestBody PositionDTORequest positionDTORequest) throws Exception {
    GdnBaseRestResponse result = this.beirutService.updatePosition(generateRequestId(),
        getUsername(), id, positionDTORequest);
    return result;
  }

}
