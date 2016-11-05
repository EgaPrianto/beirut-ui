package com.gdn.x.ui.beirut.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.gdn.common.util.GdnUUIDHelper;
import com.gdn.common.web.wrapper.response.GdnBaseRestResponse;
import com.gdn.common.web.wrapper.response.GdnRestListResponse;
import com.gdn.common.web.wrapper.response.GdnRestSingleResponse;
import com.gdn.x.beirut.dto.request.ApplyNewPositionModelDTORequest;
import com.gdn.x.beirut.dto.request.CandidatePositionBindRequest;
import com.gdn.x.beirut.dto.request.ListStringRequest;
import com.gdn.x.beirut.dto.request.PositionDTORequest;
import com.gdn.x.beirut.dto.request.UpdateCandidateStatusModelDTORequest;
import com.gdn.x.beirut.dto.request.UpdatePositionStatusModelDTORequest;
import com.gdn.x.beirut.dto.response.CandidatePositionDTOResponse;
import com.gdn.x.beirut.dto.response.CandidatePositionSolrDTOResponse;
import com.gdn.x.beirut.dto.response.PositionDTOResponse;
import com.gdn.x.beirut.dto.response.PositionDetailDTOResponse;
import com.gdn.x.ui.beirut.model.PositionDetail;
import com.gdn.x.ui.beirut.model.PositionNew;
import com.gdn.x.ui.beirut.service.BeirutService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping(value = BeirutController.BASE_PATH)
public class BeirutController {
  @SuppressWarnings("unused")
  private static final Logger LOG = LoggerFactory.getLogger(BeirutController.class);

  public static final String BASE_PATH = "/api";
  public static final String UPDATE_POSITION = "/update-position";
  public static final String GET_ALL_POSITION = "/get-all-position";
  public static final String GET_ALL_POSITION_NOT_DELETED = "/get-all-position-not-deleted";
  public static final String GET_POSITION = "/get-position";
  public static final String GET_POSITION_BY_TITLE = "/get-position-by-title";
  public static final String GET_POSITION_DETAIL = "/get-position-detail";
  public static final String GET_POSITION_DESCRIPTION = "/get-position-description";
  public static final String APPLY_NEW_POSITION = "/apply-new-position";
  public static final String UPDATE_POSITIONS_STATUS = "/update-positions-status";
  public static final String INSERT_NEW_POSITION = "/insert-new-position";
  public static final String DELETE_POSITION = "/delete-position";

  public static final String GET_ALL_CANDIDATE_POSITION = "/get-all-candidate-position";
  public static final String GET_CANDIDATE_POSITION_DETAIL = "/get-candidate-position-detail";
  public static final String UPDATE_CANDIDATES_STATUS = "/update-candidates-status";
  public static final String INSERT_NEW_CANDIDATE = "/insert-new-candidate";
  public static final String DELETE_CANDIDATE = "/delete-candidate";

  @Autowired
  private BeirutService beirutService;

  @RequestMapping(value = BeirutController.APPLY_NEW_POSITION, method = RequestMethod.POST)
  @ResponseBody
  public GdnBaseRestResponse applyNewPosition(
    @RequestBody ApplyNewPositionModelDTORequest applyNewPositionModelDTORequest) throws Exception {
    GdnBaseRestResponse result = this.beirutService
      .applyNewPosition(generateRequestId(), getUsername(), applyNewPositionModelDTORequest);
    return result;
  }

  @RequestMapping(value = BeirutController.DELETE_CANDIDATE,
    method = RequestMethod.POST)
  @ResponseBody
  public GdnBaseRestResponse deleteCandidate(@RequestBody Map requestBodyMapping) throws Exception {
    List<String> listId = (List<String>) requestBodyMapping.get("listId");
    ListStringRequest listStringRequest = new ListStringRequest();
    listStringRequest.setValues(listId);
    GdnBaseRestResponse result =
      this.beirutService.deleteCandidate(generateRequestId(), getUsername(), listStringRequest);
    return result;
  }

  @RequestMapping(value = BeirutController.DELETE_POSITION,
    method = RequestMethod.POST)
  @ResponseBody
  public GdnBaseRestResponse deletePosition(@RequestBody Map requestBodyMapping) throws Exception {
    LOG.info("Enter deletePosition() = >>>" + requestBodyMapping.toString() + "<<<");
    List<String> listId = (List<String>) requestBodyMapping.get("listId");
    ListStringRequest listStringRequest = new ListStringRequest();
    listStringRequest.setValues(listId);
    GdnBaseRestResponse result =
      this.beirutService.deletePosition(generateRequestId(), getUsername(), listStringRequest);
    return result;
  }

  private String generateRequestId() {
    return GdnUUIDHelper.generateUUID();
  }

  @RequestMapping(value = BeirutController.GET_ALL_POSITION, method = RequestMethod.GET)
  @ResponseBody
  public GdnRestListResponse<PositionDTOResponse> getAllPositionWithPageable(
    @RequestParam Integer page, @RequestParam Integer size) throws Exception {
    GdnRestListResponse<PositionDTOResponse> result = this.beirutService
      .getAllPositionWithPageable(this.generateRequestId(), this.getUsername(), page, size);
    return result;
  }

  @RequestMapping(value = BeirutController.GET_ALL_POSITION_NOT_DELETED, method = RequestMethod.GET)
  @ResponseBody
  public GdnRestListResponse<PositionDTOResponse> getAllPositionWithPageableNotDeleted(
      @RequestParam Integer page, @RequestParam Integer size) throws Exception {
    GdnRestListResponse<PositionDTOResponse> result =
        this.beirutService.getAllPositionWithPageableNotDeleted(this.generateRequestId(),
            this.getUsername(), page, size);
    return result;
  }


  @RequestMapping(value = BeirutController.GET_ALL_CANDIDATE_POSITION, method = RequestMethod.GET)
  @ResponseBody
  public GdnRestListResponse<CandidatePositionSolrDTOResponse> getCandidatePositionBySolrQuery(
      @RequestParam String query, @RequestParam Integer page, @RequestParam Integer size)
          throws Exception {

    LOG.info("BeirutController QUERY DEBUG = " + query);
    GdnRestListResponse<CandidatePositionSolrDTOResponse> result = this.beirutService
      .getCandidatePositionBySolrQuery(generateRequestId(), getUsername(), query, page, size);
    return result;
  }

  @RequestMapping(value = BeirutController.GET_CANDIDATE_POSITION_DETAIL,
      method = RequestMethod.GET)
  @ResponseBody
  public GdnRestSingleResponse<CandidatePositionDTOResponse> getCandidatePositionDetail(
      @RequestParam String idCandidate, @RequestParam String idPosition) throws Exception {
    return this.beirutService.getCandidatePositionDetailByStoreIdWithLogs(generateRequestId(),
        getUsername(), idCandidate, idPosition);
  }

  @RequestMapping(value = BeirutController.GET_POSITION, method = RequestMethod.GET)
  @ResponseBody
  public GdnRestSingleResponse<PositionDTOResponse> getPosition(@RequestParam String id)
      throws Exception {
    GdnRestSingleResponse<PositionDTOResponse> result =
        this.beirutService.getPositionById(this.generateRequestId(), this.getUsername(), id);
    return result;
  }

  @RequestMapping(value = BeirutController.GET_POSITION_BY_TITLE, method = RequestMethod.GET)
  @ResponseBody
  public GdnRestListResponse<PositionDTOResponse> getPositionByTitle(@RequestParam String title)
      throws Exception {
    GdnRestListResponse<PositionDTOResponse> result =
        this.beirutService.getPositionByTitle(this.generateRequestId(), this.getUsername(), title);
    return result;
  }


  @RequestMapping(value = BeirutController.GET_POSITION_DESCRIPTION, method = RequestMethod.GET)
  @ResponseBody
  public GdnRestSingleResponse<PositionDetail> getPositionDescription(@RequestParam String id)
      throws Exception {
    return this.beirutService.getPositionDescription(generateRequestId(), getUsername(), id);

  }
  // @RequestMapping(value = BeirutController.GET_POSITION_DESCRIPTION, method = RequestMethod.GET)
  // @ResponseBody
  // public String getPositionDescription(@RequestParam String id) throws Exception {
  // return "{\"description\":\""
  // + this.beirutService.getPositionDescription(generateRequestId(), getUsername(), id) + "\"}";
  //
  // }

  @RequestMapping(value = BeirutController.GET_POSITION_DETAIL, method = RequestMethod.GET)
  @ResponseBody
  public GdnRestListResponse<PositionDetailDTOResponse> getPositionDetailById(
      @RequestParam String id) throws Exception {
    return this.beirutService.getPositionDetailById(generateRequestId(), getUsername(), id);
  }

  private String getUsername() {
    final org.springframework.security.core.Authentication auth =
      SecurityContextHolder.getContext().getAuthentication();
    return "TempUsername";
  }

  @RequestMapping(value = BeirutController.INSERT_NEW_CANDIDATE,
    method = RequestMethod.POST)
  @ResponseBody
  public GdnBaseRestResponse insertNewCandidate(@RequestBody String candidateDTORequestString,
    @RequestParam byte[] data, @RequestParam String filename) throws Exception {
    GdnBaseRestResponse result = this.beirutService
      .insertNewCandidate(generateRequestId(), getUsername(), candidateDTORequestString, data,
        filename);
    return result;
  }

  @RequestMapping(value = BeirutController.INSERT_NEW_POSITION,
    method = RequestMethod.POST)
  @ResponseBody
  public GdnBaseRestResponse insertNewPosition(@RequestBody PositionNew positionNew) throws Exception {
    byte[] file = javax.xml.bind.DatatypeConverter.parseBase64Binary(positionNew.getBase64File().split(",")[1]);
    String checker = new String(file);
     GdnBaseRestResponse result = this.beirutService
      .insertNewPosition(generateRequestId(), getUsername(),
        positionNew.getPositionDTORequestString(), file,
        positionNew.getFilename());
    return result;
  }

  @RequestMapping(value = BeirutController.UPDATE_CANDIDATES_STATUS, method = RequestMethod.POST)
  @ResponseBody
  public GdnBaseRestResponse updateCandidatesStatus(@RequestBody Map requestBodyMapping)
      throws Exception {
    LOG.info("Enter updateCandidatesStatus() = >>>" + requestBodyMapping.toString() + "<<<");
    List<LinkedHashMap> linkedHashMaps = (List<LinkedHashMap>) requestBodyMapping.get("arrayBind");
    List<CandidatePositionBindRequest> candidatePositionBindRequests = new ArrayList<>();
    for (LinkedHashMap linkedHashMap : linkedHashMaps) {
      LOG.info("Loop = >>>" + linkedHashMap.toString() + "<<<");
      CandidatePositionBindRequest candidatePositionBindRequest =
          new CandidatePositionBindRequest();
      candidatePositionBindRequest.setIdCandidate((String) linkedHashMap.get("idCandidate"));
      candidatePositionBindRequest.setIdPosition((String) linkedHashMap.get("idPosition"));
      candidatePositionBindRequests.add(candidatePositionBindRequest);

      LOG.info("Loop candidatePositionBindRequest = >>>" + candidatePositionBindRequest.toString()
          + "<<<");
    }

    UpdateCandidateStatusModelDTORequest updateCandidateStatusModelDTORequest =
        new UpdateCandidateStatusModelDTORequest();
    updateCandidateStatusModelDTORequest
        .setStatusDTORequest((String) requestBodyMapping.get("status"));
    updateCandidateStatusModelDTORequest.setListBind(candidatePositionBindRequests);
    GdnBaseRestResponse result = this.beirutService.updateCandidatesStatus(generateRequestId(),
        getUsername(), updateCandidateStatusModelDTORequest);
    return result;
  }

  @RequestMapping(value = BeirutController.UPDATE_POSITION,
    method = RequestMethod.POST)
  @ResponseBody
  public GdnBaseRestResponse updatePositionInformation(
    @RequestBody PositionDTORequest positionDTORequest) throws Exception {
    GdnBaseRestResponse result = this.beirutService
      .updatePositionInformation(generateRequestId(), getUsername(), positionDTORequest);
    return result;
  }

  @RequestMapping(value = BeirutController.UPDATE_POSITIONS_STATUS, method = RequestMethod.POST)
  @ResponseBody
  public GdnBaseRestResponse updatePositionStatus(@RequestBody Map requestBodyMapping)
      throws Exception {
    LOG.info("Enter updatePositionStatus() = >>>" + requestBodyMapping.toString() + "<<<");
    List<String> listId = (List<String>) requestBodyMapping.get("listId");
    UpdatePositionStatusModelDTORequest updatePositionStatusModelDTORequest =
        new UpdatePositionStatusModelDTORequest();
    updatePositionStatusModelDTORequest.setIdPositions(listId);
    updatePositionStatusModelDTORequest
        .setStatusDTORequest((String) requestBodyMapping.get("status"));
    GdnBaseRestResponse result = this.beirutService.updatePositionStatus(generateRequestId(),
        getUsername(), updatePositionStatusModelDTORequest);
    return result;
  }

}
