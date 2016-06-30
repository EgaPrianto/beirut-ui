package com.gdn.x.ui.beirut.controller;


import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.verifyNoMoreInteractions;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.test.web.servlet.MockMvc;

import com.gdn.common.util.GdnUUIDHelper;
import com.gdn.common.web.wrapper.response.GdnBaseRestResponse;
import com.gdn.common.web.wrapper.response.GdnRestListResponse;
import com.gdn.common.web.wrapper.response.PageMetaData;
import com.gdn.x.beirut.dto.request.ApplyNewPositionModelDTORequest;
import com.gdn.x.beirut.dto.request.ListStringRequest;
import com.gdn.x.beirut.dto.request.PositionDTORequest;
import com.gdn.x.beirut.dto.request.StatusDTORequest;
import com.gdn.x.beirut.dto.request.UpdateCandidateStatusModelDTORequest;
import com.gdn.x.beirut.dto.request.UpdatePositionModelDTORequest;
import com.gdn.x.beirut.dto.response.CandidatePositionSolrDTOResponse;
import com.gdn.x.beirut.dto.response.PositionDTOResponse;
import com.gdn.x.ui.beirut.service.BeirutService;

@RunWith(PowerMockRunner.class)
public class BeirutControllerTest {

  public static final String REQUEST_ID = "myRequestId";

  public static final String USERNAME = "myUsername";

  public static final Integer PAGE = 0;

  public static final Integer SIZE = 10;

  public static final String QUERY = "id:* AND MARK_FOR_DELETE:false";

  public static final String TITLE_1 = "myTitle1";

  public static final String ID_1 = "myId1";

  public static final String TITLE_2 = "myTitle2";

  public static final String ID_2 = "myId2";

  public static final PageMetaData PAGE_META_DATA = new PageMetaData(5, 5, 10);

  private PositionDTOResponse positionDTOResponse1;

  private PositionDTOResponse positionDTOResponse2;

  private CandidatePositionSolrDTOResponse candidatePositionSolrDTOResponse1;

  private CandidatePositionSolrDTOResponse candidatePositionSolrDTOResponse2;

  private List<CandidatePositionSolrDTOResponse> candidatePositionSolrDTOResponses;

  private List<PositionDTOResponse> positionDTOResponses;

  private PositionDTORequest positionDTORequest;

  private StatusDTORequest statusDTORequest;

  private ListStringRequest listStringRequest;

  private List<String> ids;

  private MockMvc mockMVC;

  @Mock
  private BeirutService beirutService;

  @InjectMocks
  private BeirutController beirutController;

  @Before
  public void intialize() {
    initMocks(this);
    // TANYA MOCKMVC GAGAL
    // this.mockMVC = standaloneSetup(this.beirutController).build();
    PowerMockito.mockStatic(GdnUUIDHelper.class);
    PowerMockito.mockStatic(SecurityContextHolder.class);
    PowerMockito.when(GdnUUIDHelper.generateUUID()).thenReturn(REQUEST_ID);
    SecurityContext sch = new SecurityContextImpl();
    Authentication auth = new Authentication() {
      /**
       *
       */
      private static final long serialVersionUID = 7357477794873674066L;

      @Override
      public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
      }

      @Override
      public Object getCredentials() {
        return null;
      }

      @Override
      public Object getDetails() {
        return null;
      }

      @Override
      public String getName() {
        return USERNAME;
      }

      @Override
      public Object getPrincipal() {
        return null;
      }

      @Override
      public boolean isAuthenticated() {
        return true;
      }

      @Override
      public void setAuthenticated(boolean isAuthenticated) throws IllegalArgumentException {}
    };
    sch.setAuthentication(auth);
    PowerMockito.when(SecurityContextHolder.getContext()).thenReturn(sch);
    this.positionDTOResponse1 = new PositionDTOResponse();
    this.positionDTOResponse1.setTitle(TITLE_1);
    this.positionDTOResponse2 = new PositionDTOResponse();
    this.positionDTOResponse2.setTitle(TITLE_2);
    this.positionDTOResponses = new ArrayList<PositionDTOResponse>();
    this.candidatePositionSolrDTOResponse1 = new CandidatePositionSolrDTOResponse();
    this.candidatePositionSolrDTOResponse2 = new CandidatePositionSolrDTOResponse();
    this.candidatePositionSolrDTOResponses = new ArrayList<CandidatePositionSolrDTOResponse>();
    this.positionDTORequest = new PositionDTORequest();
    this.positionDTORequest.setTitle(TITLE_1);
    this.listStringRequest = new ListStringRequest();
    ids = new ArrayList<>();
    this.statusDTORequest = StatusDTORequest.HEAD;
  }

  @After
  public void noMoreTransaction() {
    verifyNoMoreInteractions(this.beirutService);
  }

  @PrepareForTest({SecurityContextHolder.class, GdnUUIDHelper.class})
  @Test
  public void testApplyNewPosition() throws Exception {
    GdnBaseRestResponse expectedResult = new GdnBaseRestResponse(REQUEST_ID);
    List<String> idPositions = new ArrayList<>();
    idPositions.add(ID_1);
    idPositions.add(ID_2);

    ApplyNewPositionModelDTORequest applyNewPositionModelDTORequest =
        new ApplyNewPositionModelDTORequest();
    applyNewPositionModelDTORequest.setIdCandidate(ID_1);
    applyNewPositionModelDTORequest.setListPositionIds(idPositions);

    when(this.beirutService.applyNewPosition(REQUEST_ID, USERNAME, applyNewPositionModelDTORequest))
        .thenReturn(expectedResult);
    assertTrue(
        this.beirutController.applyNewPosition(applyNewPositionModelDTORequest) == expectedResult);
    this.beirutController.applyNewPosition(applyNewPositionModelDTORequest);
    verify(this.beirutService, times(2)).applyNewPosition(REQUEST_ID, USERNAME,
        applyNewPositionModelDTORequest);
  }

  @PrepareForTest({SecurityContextHolder.class, GdnUUIDHelper.class})
  @Test
  public void testGetAllPositionWithPageable() throws Exception {
    this.positionDTOResponses.add(this.positionDTOResponse1);
    this.positionDTOResponses.add(this.positionDTOResponse2);
    GdnRestListResponse<PositionDTOResponse> expectedResult =
        new GdnRestListResponse<PositionDTOResponse>(this.positionDTOResponses, PAGE_META_DATA,
            REQUEST_ID);
    when(this.beirutService.getAllPositionWithPageable(REQUEST_ID, USERNAME, PAGE, SIZE))
        .thenReturn(expectedResult);
    assertTrue(this.beirutController.getAllPositionWithPageable(PAGE, SIZE) == expectedResult);
    verify(this.beirutService, times(1)).getAllPositionWithPageable(REQUEST_ID, USERNAME, PAGE,
        SIZE);
  }

  @PrepareForTest({SecurityContextHolder.class, GdnUUIDHelper.class})
  @Test
  public void testGetCandidatePositionBySolrQuery() throws Exception {
    this.candidatePositionSolrDTOResponses.add(candidatePositionSolrDTOResponse1);
    this.candidatePositionSolrDTOResponses.add(candidatePositionSolrDTOResponse2);
    GdnRestListResponse<CandidatePositionSolrDTOResponse> expectedResult =
        new GdnRestListResponse<CandidatePositionSolrDTOResponse>(
            this.candidatePositionSolrDTOResponses, PAGE_META_DATA, REQUEST_ID);
    when(
        this.beirutService.getCandidatePositionBySolrQuery(REQUEST_ID, USERNAME, QUERY, PAGE, SIZE))
            .thenReturn(expectedResult);
    assertTrue(
        this.beirutController.getCandidatePositionBySolrQuery(QUERY, PAGE, SIZE) == expectedResult);
    this.beirutController.getCandidatePositionBySolrQuery(QUERY, PAGE, SIZE);
    verify(this.beirutService, times(2)).getCandidatePositionBySolrQuery(REQUEST_ID, USERNAME,
        QUERY, PAGE, SIZE);
  }

  @PrepareForTest({SecurityContextHolder.class, GdnUUIDHelper.class})
  @Test
  public void testUpdateCandidateStatus() throws Exception {
    ids.add(ID_1);
    ids.add(ID_2);

    UpdateCandidateStatusModelDTORequest updateCandidateStatusModelDTORequest =
        new UpdateCandidateStatusModelDTORequest();
    updateCandidateStatusModelDTORequest.setIdCandidates(ids);
    updateCandidateStatusModelDTORequest.setIdPosition(ID_1);
    updateCandidateStatusModelDTORequest.setStatusDTORequest(statusDTORequest.name());

    GdnBaseRestResponse expectedResult = new GdnBaseRestResponse(REQUEST_ID);
    when(this.beirutService.updateCandidatesStatus(REQUEST_ID, USERNAME,
        updateCandidateStatusModelDTORequest)).thenReturn(expectedResult);
    assertTrue(this.beirutController
        .updateCandidatesStatus(updateCandidateStatusModelDTORequest) == expectedResult);
    this.beirutController.updateCandidatesStatus(updateCandidateStatusModelDTORequest);
    verify(this.beirutService, times(2)).updateCandidatesStatus(REQUEST_ID, USERNAME,
        updateCandidateStatusModelDTORequest);
  }

  @PrepareForTest({SecurityContextHolder.class, GdnUUIDHelper.class})
  @Test
  public void testUpdatePosition() throws Exception {
    GdnBaseRestResponse expectedResult = new GdnBaseRestResponse(REQUEST_ID);
    List<String> idCandidates = new ArrayList<>();
    idCandidates.add(ID_1);
    idCandidates.add(ID_2);

    UpdatePositionModelDTORequest updatePositionModelDTORequest =
        new UpdatePositionModelDTORequest();
    updatePositionModelDTORequest.setIdPositionTarget(ID_1);
    updatePositionModelDTORequest.setTitle(TITLE_1);

    when(this.beirutService.updatePosition(REQUEST_ID, USERNAME, updatePositionModelDTORequest))
        .thenReturn(expectedResult);
    assertTrue(
        this.beirutController.updatePosition(updatePositionModelDTORequest) == expectedResult);
    this.beirutController.updatePosition(updatePositionModelDTORequest);
    verify(this.beirutService, times(2)).updatePosition(REQUEST_ID, USERNAME,
        updatePositionModelDTORequest);
  }


}
