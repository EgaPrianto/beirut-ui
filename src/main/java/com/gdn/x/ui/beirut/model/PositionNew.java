package com.gdn.x.ui.beirut.model;

/**
 * Created by Gl552 on 10/30/2016.
 */
public class PositionNew {
  private String positionDTORequestString;
  private String filename;
  private String base64File;

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

  public String getPositionDTORequestString() {
    return positionDTORequestString;
  }

  public void setPositionDTORequestString(String positionDTORequestString) {
    this.positionDTORequestString = positionDTORequestString;
  }
}
