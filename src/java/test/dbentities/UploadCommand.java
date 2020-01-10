/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.dbentities;

/**
 *
 * @author arnav
 */
public class UploadCommand
{
    private String deviceid;
    private Double longitude;
    private Double latitude;
    private Double noiselevel;

    public String getDeviceid()
    {
        return deviceid;
    }

    public void setDeviceid(String deviceid)
    {
        this.deviceid = deviceid;
    }

    public Double getLongitude()
    {
        return longitude;
    }

    public void setLongitude(Double longitude)
    {
        this.longitude = longitude;
    }

    public Double getLatitude()
    {
        return latitude;
    }

    public void setLatitude(Double latitude)
    {
        this.latitude = latitude;
    }

    public Double getNoiselevel()
    {
        return noiselevel;
    }

    public void setNoiselevel(Double noiselevel)
    {
        this.noiselevel = noiselevel;
    }

    
    
}
