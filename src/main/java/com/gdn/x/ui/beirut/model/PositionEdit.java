package com.gdn.x.ui.beirut.model;

import com.gdn.common.web.base.BaseRequest;

/**
 * Created by Gl552 on 11/6/2016.
 */
public class PositionEdit extends BaseRequest {
  private String id;
  private String base64File;
  private String filename;

  public String getBase64File() {
    return base64File;
  }

  public void setBase64File(String base64File) {
    this.base64File = base64File;
  }

  public String getFilename() {
    return filename;
  }

  public void setFilename(String filename) {
    this.filename = filename;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }
}
