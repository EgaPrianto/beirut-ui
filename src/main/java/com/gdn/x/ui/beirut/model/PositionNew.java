package com.gdn.x.ui.beirut.model;

/**
 * Created by Gl552 on 10/30/2016.
 */
public class PositionNew {
    private String positionDTORequestString;
    private String filename;
    private byte[] files;

    public byte[] getFiles() {
        return files;
    }

    public void setFile(byte[] files) {
        this.files = files;
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
