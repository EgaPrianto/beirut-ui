package com.gdn.x.ui.beirut.service;

import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoMoreInteractions;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.mockito.InjectMocks;
import org.mockito.Mock;

import com.gdn.common.web.wrapper.response.GdnRestListResponse;
import com.gdn.common.web.wrapper.response.PageMetaData;
import com.gdn.x.beirut.clientsdk.BeirutApiClient;
import com.gdn.x.beirut.dto.response.CandidatePositionSolrDTOResponse;
import com.gdn.x.ui.beirut.service.impl.BeirutServiceImpl;

public class BeirutServiceTest {

  public static final String ID = "myId";

  public static final String EMAIL_ADDRESS = "my@email.address";

  public static final String FIRST_NAME = "myFirstName";

  public static final String LAST_NAME = "myLastName";

  public static final String REQUEST_ID = "myRequestId";

  public static final String USERNAME = "myUsername";

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



}
