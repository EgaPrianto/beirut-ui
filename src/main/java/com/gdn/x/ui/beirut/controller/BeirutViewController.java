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
<<<<<<< HEAD
  public static final String POSITION_SUMMARY_PATH = "/position-summary";
  public static final String RECUITMENT_CENTER = "/recruitment-center";
=======
  public static final String RECRUITMENT_CENTER = "/recruitment-center";
>>>>>>> 39920a7475aac46c49ec392f72660cd9e6922047
  public static final String JOBS_MANAGEMENT = "/jobs-management";
  @Autowired
  private BeirutService beirutService;

<<<<<<< HEAD
  @RequestMapping(value = BeirutViewController.RECUITMENT_CENTER)
=======
  @RequestMapping(value = BeirutViewController.JOBS_MANAGEMENT, method = RequestMethod.GET)
>>>>>>> 39920a7475aac46c49ec392f72660cd9e6922047
  public String getJobsManagement() {
    return "jobs-management";
  }

<<<<<<< HEAD
  @RequestMapping(value = BeirutViewController.POSITION_SUMMARY_PATH, method = RequestMethod.GET)
  public String getPositionSummary() {
    return "position-summary";
=======
  @RequestMapping(value = BeirutViewController.RECRUITMENT_CENTER, method = RequestMethod.GET)
  public String getRecuitmentCenter() {
    return "recruitment-center";
>>>>>>> 39920a7475aac46c49ec392f72660cd9e6922047
  }
}
