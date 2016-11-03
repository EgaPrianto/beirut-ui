package com.gdn.x.ui.beirut.controller;

import com.gdn.common.util.GdnUUIDHelper;
import com.gdn.common.web.wrapper.response.GdnBaseRestResponse;
import com.gdn.common.web.wrapper.response.GdnRestListResponse;
import com.gdn.common.web.wrapper.response.GdnRestSingleResponse;
import com.gdn.x.beirut.dto.request.ApplyNewPositionModelDTORequest;
import com.gdn.x.beirut.dto.request.ListStringRequest;
import com.gdn.x.beirut.dto.request.PositionDTORequest;
import com.gdn.x.beirut.dto.request.UpdateCandidateStatusModelDTORequest;
import com.gdn.x.beirut.dto.response.CandidatePositionDTOResponse;
import com.gdn.x.beirut.dto.response.CandidatePositionSolrDTOResponse;
import com.gdn.x.beirut.dto.response.PositionDTOResponse;
import com.gdn.x.beirut.dto.response.PositionDetailDTOResponse;
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
  public static final String GET_POSITION_DETAIL = "/get-position-detail";

  public static final String APPLY_NEW_POSITION = "/apply-new-position";
  public static final String GET_ALL_CANDIDATE_POSITION = "/get-all-candidate-position";
  public static final String GET_CANDIDATE_POSITION_DETAIL = "/get-candidate-position-detail";
  public static final String UPDATE_CANDIDATE_STATUS = "/update-candidate-status";

  public static final String INSERT_NEW_POSITION = "/insert-new-position";
  public static final String INSERT_NEW_CANDIDATE = "/insert-new-candidate";
  public static final String DELETE_CANDIDATE = "/delete-candidate";
  public static final String DELETE_POSITION = "/delete-position";

  @Autowired
  private BeirutService beirutService;

  @RequestMapping(value = BeirutController.APPLY_NEW_POSITION,
    method = RequestMethod.POST)
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
  public GdnBaseRestResponse deleteCandidate(@RequestBody ListStringRequest listStringRequest)
    throws Exception {
    GdnBaseRestResponse result =
      this.beirutService.deleteCandidate(generateRequestId(), getUsername(), listStringRequest);
    return result;
  }

  @RequestMapping(value = BeirutController.DELETE_POSITION,
    method = RequestMethod.POST)
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

  @RequestMapping(value = BeirutController.GET_ALL_POSITION,
    method = RequestMethod.GET)
  @ResponseBody
  public GdnRestListResponse<PositionDTOResponse> getAllPositionWithPageable(
    @RequestParam Integer page, @RequestParam Integer size) throws Exception {
    GdnRestListResponse<PositionDTOResponse> result = this.beirutService
      .getAllPositionWithPageable(this.generateRequestId(), this.getUsername(), page, size);
    return result;
  }

  @RequestMapping(value = BeirutController.GET_ALL_CANDIDATE_POSITION,
    method = RequestMethod.GET)
  @ResponseBody
  public GdnRestListResponse<CandidatePositionSolrDTOResponse> getCandidatePositionBySolrQuery(
    @RequestParam String query, @RequestParam Integer page, @RequestParam Integer size)
    throws Exception {
    GdnRestListResponse<CandidatePositionSolrDTOResponse> result = this.beirutService
      .getCandidatePositionBySolrQuery(generateRequestId(), getUsername(), query, page, size);
    return result;
  }

  @RequestMapping(value = BeirutController.GET_CANDIDATE_POSITION_DETAIL,
    method = RequestMethod.GET)
  @ResponseBody
  public GdnRestSingleResponse<CandidatePositionDTOResponse> getCandidatePositionDetail(
    @RequestParam String idCandidate, @RequestParam String idPosition) throws Exception {
    return this.beirutService
      .getCandidatePositionDetailByStoreIdWithLogs(generateRequestId(), getUsername(), idCandidate,
        idPosition);
  }

  @RequestMapping(value = BeirutController.GET_POSITION_DETAIL,
    method = RequestMethod.GET)
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
    LOG.trace("\n\n MASUK \n\n");
    System.out.println("\n\nMASUK nih\n\n");
    System.out.println("filename: "+positionNew.getFilename());
    System.out.println("positionDTORequestString: "+positionNew.getPositionDTORequestString());
    System.out.println("base64File: "+positionNew.getBase64File());
    byte[] file = javax.xml.bind.DatatypeConverter.parseBase64Binary(positionNew.getBase64File().split(",")[1]);
    String checker = new String(file);
    System.out.println("\n\nChecker: "+checker);
    System.out.println("Print File Byte: "+file);
     GdnBaseRestResponse result = this.beirutService
      .insertNewPosition(generateRequestId(), getUsername(),
        positionNew.getPositionDTORequestString(), file,
        positionNew.getFilename());
    return result;
  }

  @RequestMapping(value = BeirutController.UPDATE_CANDIDATE_STATUS,
    method = RequestMethod.POST)
  @ResponseBody
  public GdnBaseRestResponse updateCandidatesStatus(
    @RequestBody UpdateCandidateStatusModelDTORequest updateCandidateStatusModelDTORequest)
    throws Exception {
    GdnBaseRestResponse result = this.beirutService
      .updateCandidatesStatus(generateRequestId(), getUsername(),
        updateCandidateStatusModelDTORequest);
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

}
