package com.gdn.x.ui.beirut.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by Gl552 on 24/09/2016.
 */
@Controller
@RequestMapping(value = BeirutViewController.BASE_PATH)
public class BeirutViewController {
    public static final String BASE_PATH = "/view";
    public static final String POSITION_SUMMARY_PATH = "/position-summary";

    @RequestMapping(value = BeirutViewController.POSITION_SUMMARY_PATH,
    method = RequestMethod.GET)
    public String getPositionSummary() {
        return "position-summary";
    }

}
