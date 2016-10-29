package com.gdn.x.ui.beirut.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
<<<<<<< HEAD
  public static final String INSERT_NEW_POSITION = "/insert-new-position";
  public static final String POSITION_VIEW = "/position-view";
  public static final String POSITION_EDIT = "/position-edit";

=======
  public static final String RECRUITMENT_CENTER_EDIT="/recruitment-center-edit";
  public static final String RECRUITMENT_CENTER_DETAIL="/recruitment-center-detail";
>>>>>>> af33bbf524d07fb546504ef9666f8c5a4389e8f1
  @Autowired
  private BeirutService beirutService;

  @RequestMapping(value = BeirutViewController.JOBS_MANAGEMENT, method = RequestMethod.GET)
  public String getJobsManagement() {
    return "jobs-management";
  }

  @RequestMapping(value = BeirutViewController.RECRUITMENT_CENTER, method = RequestMethod.GET)
  public String getRecuitmentCenter() {
    return "recruitment-center";
  }

<<<<<<< HEAD
  @RequestMapping(value = BeirutViewController.INSERT_NEW_POSITION, method = RequestMethod.GET)
  public String getInsertNewPosition() { return "insert-new-position"; }

  @RequestMapping(value = BeirutViewController.POSITION_VIEW, method = RequestMethod.GET)
  public String getPositionView() { return "position-view"; }

  @RequestMapping(value = BeirutViewController.POSITION_EDIT, method = RequestMethod.GET)
  public String getPositionEdit() { return "position-edit"; }
=======
  @RequestMapping(value = BeirutViewController.RECRUITMENT_CENTER_EDIT, method = RequestMethod.GET)
  public String getRecuitmentCenterEdit() {
    return "recruitment-center-edit";
  }

  @RequestMapping(value = BeirutViewController.RECRUITMENT_CENTER_DETAIL, method = RequestMethod.GET)
  public String getRecuitmentCenterDetail() {
    return "recruitment-center-detail";
  }
>>>>>>> af33bbf524d07fb546504ef9666f8c5a4389e8f1
}
