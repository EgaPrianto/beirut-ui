package com.gdn.x.ui.beirut.model;

/**
 * Created by Gl552 on 10/30/2016.
 */
public class PositionNew {
  private String positionDTORequestString;
  private String filename;
  private byte[] files;

  public String getFilename() {
    return filename;
  }

  public byte[] getFiles() {
    return files;
  }

  public String getPositionDTORequestString() {
    return positionDTORequestString;
  }

  public void setFile(byte[] files) {
    this.files = files;
  }

  public void setFilename(String filename) {
    this.filename = filename;
  }

  public void setPositionDTORequestString(String positionDTORequestString) {
    this.positionDTORequestString = positionDTORequestString;
  }
}
