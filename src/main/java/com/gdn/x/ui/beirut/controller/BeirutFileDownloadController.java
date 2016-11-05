package com.gdn.x.ui.beirut.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gdn.common.util.GdnUUIDHelper;
import com.gdn.x.ui.beirut.service.BeirutService;

@Controller
@RequestMapping(value = BeirutFileDownloadController.BASE_PATH)
public class BeirutFileDownloadController {
  public static final String BASE_PATH = "/file";
  private static final Logger LOG = LoggerFactory.getLogger(BeirutFileDownloadController.class);
  public static final String CANDIDATE_DETAIL = "/candidate-detail/{idCandidate}";


  @Autowired
  private BeirutService beirutService;


  @RequestMapping(value = BeirutFileDownloadController.CANDIDATE_DETAIL,
      method = RequestMethod.GET)
  public void getFile(@PathVariable String idCandidate, HttpServletResponse response)
      throws Exception {
    try {
      byte[] byteFile = beirutService.getCandidateDetail(GdnUUIDHelper.generateUUID(),
          getUsername(), idCandidate);
      InputStream is = new ByteArrayInputStream(byteFile);

      String mimeType = "application/pdf";
      response.setContentType(mimeType);
      long curTime = System.currentTimeMillis();
      Date dateDownload = new Date(curTime);
      DateFormat dateFormat = new SimpleDateFormat("MM-dd-yyyy HH-mm-ss");
      response.setHeader("Content-Disposition",
          String.format("attachment; filename=\"" + dateFormat.format(dateDownload) + ".pdf\""));

      FileCopyUtils.copy(is, response.getOutputStream());
      response.flushBuffer();
    } catch (IOException ex) {
      LOG.info("Error writing file to output stream. idcandidate was '{}'", idCandidate, ex);
      throw new RuntimeException("IOError writing file to output stream");
    }

  }

  private String getUsername() {
    final org.springframework.security.core.Authentication auth =
        SecurityContextHolder.getContext().getAuthentication();
    return "TempUsername";
  }
}
