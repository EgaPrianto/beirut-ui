package com.gdn.x.ui.beirut.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gdn.x.ui.beirut.service.BeirutService;

/**
 * Created by Gl552 on 24/09/2016.
 */
@Controller
@RequestMapping(value = BeirutViewController.BASE_PATH)
public class BeirutViewController {
  public static final String BASE_PATH = "/view";
  public static final String RECRUITMENT_CENTER = "/recruitment-center";
  public static final String JOBS_MANAGEMENT = "/jobs-management";
  public static final String JOBS_MANAGEMENT_DETAIL = "/jobs-management-detail/{id}";
  public static final String INSERT_NEW_POSITION = "/insert-new-position";
  public static final String POSITION_VIEW = "/position-view";
  public static final String POSITION_EDIT = "/position-edit";
  public static final String RECRUITMENT_CENTER_EDIT = "/recruitment-center-edit";
  public static final String RECRUITMENT_CENTER_DETAIL =
      "/recruitment-center-detail/{idCandidate}/{idPosition}";

  private static final Logger LOG = LoggerFactory.getLogger(BeirutViewController.class);

  @Autowired
  private BeirutService beirutService;

  @RequestMapping(value = BeirutViewController.RECRUITMENT_CENTER_DETAIL,
      method = RequestMethod.GET)
  public ModelAndView getCandidatePositionDetail(@PathVariable String idCandidate,
      @PathVariable String idPosition) {
    // LOG.debug("%%% idCandidate: "+idCandidate);
    // LOG.debug("%%% idPosition: "+idPosition);
    ModelAndView mav = new ModelAndView("recruitment-center-detail");
    mav.addObject("idCandidate", idCandidate);
    mav.addObject("idPosition", idPosition);
    return mav;
  }

  @RequestMapping(value = BeirutViewController.INSERT_NEW_POSITION, method = RequestMethod.GET)
  public String getInsertNewPosition() {
    return "insert-new-position";
  }

  @RequestMapping(value = BeirutViewController.JOBS_MANAGEMENT, method = RequestMethod.GET)
  public String getJobsManagement() {
    return "jobs-management";
  }

  @RequestMapping(value = BeirutViewController.JOBS_MANAGEMENT_DETAIL, method = RequestMethod.GET)
  public ModelAndView getPositionDetail(@PathVariable String id) {
    ModelAndView mav = new ModelAndView("jobs-management-detail");
    mav.addObject("id", id);
    return mav;
  }

  @RequestMapping(value = BeirutViewController.POSITION_EDIT, method = RequestMethod.GET)
  public String getPositionEdit() {
    return "position-edit";
  }

  @RequestMapping(value = BeirutViewController.POSITION_VIEW, method = RequestMethod.GET)
  public String getPositionView() {
    return "position-view";
  }

  @RequestMapping(value = BeirutViewController.RECRUITMENT_CENTER, method = RequestMethod.GET)
  public String getRecuitmentCenter() {
    return "recruitment-center";
  }

  @RequestMapping(value = BeirutViewController.RECRUITMENT_CENTER_EDIT, method = RequestMethod.GET)
  public String getRecuitmentCenterEdit() {
    return "recruitment-center-edit";
  }



}
