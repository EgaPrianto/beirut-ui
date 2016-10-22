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
  public static final String POSITION_SUMMARY_PATH = "/position-summary";
  public static final String RECUITMENT_CENTER = "/recruitment-center";
  public static final String JOBS_MANAGEMENT = "/jobs-management";
  @Autowired
  private BeirutService beirutService;

  @RequestMapping(value = BeirutViewController.RECUITMENT_CENTER)
  public String getJobsManagement() {
    return "jobs-management";
  }

  @RequestMapping(value = BeirutViewController.POSITION_SUMMARY_PATH, method = RequestMethod.GET)
  public String getPositionSummary() {
    return "position-summary";
  }
}
