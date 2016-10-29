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
  public static final String INSERT_NEW_POSITION = "/insert-new-position";
  public static final String POSITION_VIEW = "/position-view";

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

  @RequestMapping(value = BeirutViewController.INSERT_NEW_POSITION, method = RequestMethod.GET)
  public String getInsertNewPosition() {
    return "insert-new-position";
  }
}
