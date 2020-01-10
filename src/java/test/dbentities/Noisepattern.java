/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.dbentities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author arnav
 */
@Entity
@Table(name = "noisepattern")
@NamedQueries(
{
    @NamedQuery(name = "Noisepattern.findAll", query = "SELECT n FROM Noisepattern n")
})
public class Noisepattern implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "day")
    private String day;
    @Column(name = "month")
    private String month;
    @Column(name = "weekday")
    private String weekday;
    @Column(name = "qtime")
    
    private String qtime;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "longitude_noise")
    private Double longitudeNoise;
    @Column(name = "latitude_noise")
    private Double latitudeNoise;
    @Column(name = "noiselevel")
    private Double noiselevel;

    public Noisepattern()
    {
    }

    public Noisepattern(Integer id)
    {
        this.id = id;
    }

    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    public String getDay()
    {
        return day;
    }

    public void setDay(String day)
    {
        this.day = day;
    }

    public String getMonth()
    {
        return month;
    }

    public void setMonth(String month)
    {
        this.month = month;
    }

    public String getWeekday()
    {
        return weekday;
    }

    public void setWeekday(String weekday)
    {
        this.weekday = weekday;
    }

    public String getQtime()
    {
        return qtime;
    }

    public void setQtime(String qtime)
    {
        this.qtime = qtime;
    }

    public Double getLongitudeNoise()
    {
        return longitudeNoise;
    }

    public void setLongitudeNoise(Double longitudeNoise)
    {
        this.longitudeNoise = longitudeNoise;
    }

    public Double getLatitudeNoise()
    {
        return latitudeNoise;
    }

    public void setLatitudeNoise(Double latitudeNoise)
    {
        this.latitudeNoise = latitudeNoise;
    }

    public Double getNoiselevel()
    {
        return noiselevel;
    }

    public void setNoiselevel(Double noiselevel)
    {
        this.noiselevel = noiselevel;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Noisepattern))
        {
            return false;
        }
        Noisepattern other = (Noisepattern) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "test.dbentities.Noisepattern[ id=" + id + " ]";
    }
    
}
