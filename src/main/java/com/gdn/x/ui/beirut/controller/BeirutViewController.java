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
  public static final String RECRUITMENT_CENTER_EDIT="/recruitment-center-edit";
  public static final String RECRUITMENT_CENTER_DETAIL="/recruitment-center-detail";
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

  @RequestMapping(value = BeirutViewController.RECRUITMENT_CENTER_EDIT, method = RequestMethod.GET)
  public String getRecuitmentCenterEdit() {
    return "recruitment-center-edit";
  }

  @RequestMapping(value = BeirutViewController.RECRUITMENT_CENTER_DETAIL, method = RequestMethod.GET)
  public String getRecuitmentCenterDetail() {
    return "recruitment-center-detail";
  }
}
