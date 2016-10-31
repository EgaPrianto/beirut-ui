package com.gdn.x.ui.beirut.controller;

import com.gdn.x.ui.beirut.model.PositionNew;
import com.gdn.x.ui.beirut.service.BeirutService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Gl552 on 24/09/2016.
 */
@Controller
@RequestMapping(value = BeirutViewController.BASE_PATH)
public class BeirutViewController {
    public static final String BASE_PATH = "/view";
    public static final String RECRUITMENT_CENTER = "/recruitment-center";
    public static final String CANDIDATE_POSITION_DETAIL =
        "/candidate-position-detail/{idCandidate}/{idPosition}";

    public static final String JOBS_MANAGEMENT = "/jobs-management";
    public static final String POSITION_DETAIL = "/position-detail/{id}";
    public static final String CREATE_NEW_POSITION = "/create-new-position";

    private static final Logger LOG = LoggerFactory.getLogger(BeirutViewController.class);

    @Autowired
    private BeirutService beirutService;

    @RequestMapping(value = BeirutViewController.POSITION_DETAIL, method = RequestMethod.GET)
    public ModelAndView getPositionDetail(@PathVariable String id){
        ModelAndView mav = new ModelAndView("position-detail");
        mav.addObject("id",id);
        return mav;
    }

    @RequestMapping(value = BeirutViewController.CREATE_NEW_POSITION,
        method = RequestMethod.GET)
    public String createNewPosition() {
        return "create-new-position";
    }

    @RequestMapping(value = BeirutViewController.CANDIDATE_POSITION_DETAIL,
        method = RequestMethod.GET)
    public ModelAndView getCandidatePositionDetail(@PathVariable String idCandidate,
        @PathVariable String idPosition) {
        //    LOG.debug("%%% idCandidate: "+idCandidate);
        //    LOG.debug("%%% idPosition: "+idPosition);
        ModelAndView mav = new ModelAndView("candidate-position-detail");
        mav.addObject("idCandidate", idCandidate);
        mav.addObject("idPosition", idPosition);
        return mav;
    }

    @RequestMapping(value = BeirutViewController.JOBS_MANAGEMENT,
        method = RequestMethod.GET)
    public String getJobsManagement() {
        return "jobs-management";
    }

    @RequestMapping(value = BeirutViewController.RECRUITMENT_CENTER,
        method = RequestMethod.GET)
    public String getRecuitmentCenter() {
        return "recruitment-center";
    }


}
