package com.gdn.x.ui.beirut.service;

import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoMoreInteractions;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.mock.web.MockMultipartFile;

import com.gdn.common.web.wrapper.response.GdnBaseRestResponse;
import com.gdn.common.web.wrapper.response.GdnRestListResponse;
import com.gdn.common.web.wrapper.response.PageMetaData;
import com.gdn.x.beirut.clientsdk.BeirutApiClient;
import com.gdn.x.beirut.dto.request.ListStringRequest;
import com.gdn.x.beirut.dto.request.PositionDTORequest;
import com.gdn.x.beirut.dto.request.StatusDTORequest;
import com.gdn.x.beirut.dto.response.CandidatePositionSolrDTOResponse;
import com.gdn.x.ui.beirut.service.impl.BeirutServiceImpl;

public class BeirutServiceTest {

  public static final String ID = "myId";

  public static final String EMAIL_ADDRESS = "my@email.address";

  public static final String FIRST_NAME = "myFirstName";

  public static final String LAST_NAME = "myLastName";

  public static final String REQUEST_ID = "myRequestId";

  public static final String USERNAME = "myUsername";

  public static final String TITLE = "myTitle";

  public static final StatusDTORequest STATUS_DTO_REQUEST = StatusDTORequest.APPLY;

  public static final String QUERY = "id:1234567 AND idCandidate:7654321";

  public static final int PAGE = 0;

  public static final int SIZE = 10;

  @Mock
  private BeirutApiClient beirutApiClient;

  @InjectMocks
  private BeirutServiceImpl beirutService;

  @Before
  public void intialize() {
    initMocks(this);
  }

  @After
  public void noMoreTransaction() {
    verifyNoMoreInteractions(beirutApiClient);
  }

  @Test
  public void testGetCandidatePositionBySolrQuery() throws Exception {
    // GdnRestListResponse<CandidatePositionSolrDTOResponse> gdnCandidatePositionSolrDTOResponses =
    // this.beirutApiClient.getCandidatePositionBySolrQuery(requestId, username, query, page,
    // size); private final Page<Candidate> pageCandidate = new PageImpl<Candidate>(candidates,
    // pageable, 10);
    CandidatePositionSolrDTOResponse candidatePositionSolrDTOResponse =
        new CandidatePositionSolrDTOResponse();
    candidatePositionSolrDTOResponse.setId(ID);
    candidatePositionSolrDTOResponse.setEmailAddress(EMAIL_ADDRESS);
    candidatePositionSolrDTOResponse.setFirstName(FIRST_NAME);
    candidatePositionSolrDTOResponse.setLastName(LAST_NAME);
    List<CandidatePositionSolrDTOResponse> candidatePositionSolrDTOResponses =
        new ArrayList<CandidatePositionSolrDTOResponse>();
    candidatePositionSolrDTOResponses.add(candidatePositionSolrDTOResponse);

    GdnRestListResponse<CandidatePositionSolrDTOResponse> gdnRestListCandidatePositionSolrDTOResponse =
        new GdnRestListResponse<CandidatePositionSolrDTOResponse>(candidatePositionSolrDTOResponses,
            new PageMetaData(50, 0, 1), REQUEST_ID);
    when(this.beirutApiClient.getCandidatePositionBySolrQuery(REQUEST_ID, USERNAME, QUERY, PAGE,
        SIZE)).thenReturn(gdnRestListCandidatePositionSolrDTOResponse);
    assertTrue(this.beirutService.getCandidatePositionBySolrQuery(REQUEST_ID, USERNAME, QUERY, PAGE,
        SIZE) == gdnRestListCandidatePositionSolrDTOResponse);
    this.beirutService.getCandidatePositionBySolrQuery(REQUEST_ID, USERNAME, QUERY, PAGE, SIZE);
    verify(this.beirutApiClient, times(2)).getCandidatePositionBySolrQuery(REQUEST_ID, USERNAME,
        QUERY, PAGE, SIZE);
  }

  @Test
  public void testUpdateCandidateDetail() throws Exception {
    FileInputStream inputFile =
        new FileInputStream(new File("src/test/resources/JSON/updatedFile.txt"));
    MockMultipartFile file =
        new MockMultipartFile("file", "file.txt", "multipart/form-data", inputFile);
    GdnBaseRestResponse gdnBaseRestResponseTestUpdateCandidateDetail =
        new GdnBaseRestResponse(REQUEST_ID);
    when(this.beirutApiClient.updateCandidateDetail(REQUEST_ID, USERNAME, ID, file))
        .thenReturn(gdnBaseRestResponseTestUpdateCandidateDetail);
    assertTrue(this.beirutService.updateCandidateDetail(REQUEST_ID, USERNAME, ID,
        file) == gdnBaseRestResponseTestUpdateCandidateDetail);
    this.beirutService.updateCandidateDetail(REQUEST_ID, USERNAME, ID, file);
    verify(this.beirutApiClient, times(2)).updateCandidateDetail(REQUEST_ID, USERNAME, ID, file);
  }

  @Test
  public void testUpdateCandidatesStatus() throws Exception {
    GdnBaseRestResponse gdnBaseRestResponseTestUpdateCandidateStatus =
        new GdnBaseRestResponse(REQUEST_ID);
    List<String> idCandidates = new ArrayList<String>();
    idCandidates.add(ID);
    idCandidates.add(ID + "1");
    ListStringRequest listStringRequest = new ListStringRequest();
    listStringRequest.setValues(idCandidates);
    when(this.beirutApiClient.updateCandidatesStatus(REQUEST_ID, USERNAME, STATUS_DTO_REQUEST, ID,
        listStringRequest)).thenReturn(gdnBaseRestResponseTestUpdateCandidateStatus);
    assertTrue(this.beirutService.updateCandidatesStatus(REQUEST_ID, USERNAME, STATUS_DTO_REQUEST,
        ID, listStringRequest) == gdnBaseRestResponseTestUpdateCandidateStatus);
    this.beirutService.updateCandidatesStatus(REQUEST_ID, USERNAME, STATUS_DTO_REQUEST, ID,
        listStringRequest);
    verify(this.beirutApiClient, times(2)).updateCandidatesStatus(REQUEST_ID, USERNAME,
        STATUS_DTO_REQUEST, ID, listStringRequest);
  }

  @Test
  public void testUpdatePosition() throws Exception {
    GdnBaseRestResponse gdnBaseRestResponseTestUpdatePosition = new GdnBaseRestResponse(REQUEST_ID);
    PositionDTORequest positionDTORequest = new PositionDTORequest();
    positionDTORequest.setTitle(TITLE);
    when(this.beirutApiClient.updatePosition(REQUEST_ID, USERNAME, ID, positionDTORequest))
        .thenReturn(gdnBaseRestResponseTestUpdatePosition);
    assertTrue(this.beirutService.updatePosition(REQUEST_ID, USERNAME, ID,
        positionDTORequest) == gdnBaseRestResponseTestUpdatePosition);
    this.beirutService.updatePosition(REQUEST_ID, USERNAME, ID, positionDTORequest);
    verify(this.beirutApiClient, times(2)).updatePosition(REQUEST_ID, USERNAME, ID,
        positionDTORequest);
  }



}
