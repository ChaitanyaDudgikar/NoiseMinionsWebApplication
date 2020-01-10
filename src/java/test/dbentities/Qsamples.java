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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
@Table(name = "qsamples")
@NamedQueries(
{
    @NamedQuery(name = "Qsamples.findAll", query = "SELECT q FROM Qsamples q")
})
public class Qsamples implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "qsampleid")
    private Integer qsampleid;
    @Column(name = "day")
    private String day;
    @Column(name = "datetime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date datetime;
    @Column(name = "month")
    private String month;
    @Column(name = "weekday")
    private String weekday;
    @Column(name = "qtime")
    @Temporal(TemporalType.TIME)
    private Date qtime;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "qlongitude")
    private Double qlongitude;
    @Column(name = "qlatitude")
    private Double qlatitude;
    @Column(name = "noiselevel")
    private Double noiselevel;
    @JoinColumn(name = "sampleid", referencedColumnName = "sampleid")
    @ManyToOne
    private Samples sampleid;

    public Qsamples()
    {
    }

    public Qsamples(Integer qsampleid)
    {
        this.qsampleid = qsampleid;
    }

    public Integer getQsampleid()
    {
        return qsampleid;
    }

    public void setQsampleid(Integer qsampleid)
    {
        this.qsampleid = qsampleid;
    }

    public String getDay()
    {
        return day;
    }

    public void setDay(String day)
    {
        this.day = day;
    }

    public Date getDatetime()
    {
        return datetime;
    }

    public void setDatetime(Date datetime)
    {
        this.datetime = datetime;
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

    public Date getQtime()
    {
        return qtime;
    }

    public void setQtime(Date qtime)
    {
        this.qtime = qtime;
    }

    public Double getQlongitude()
    {
        return qlongitude;
    }

    public void setQlongitude(Double qlongitude)
    {
        this.qlongitude = qlongitude;
    }

    public Double getQlatitude()
    {
        return qlatitude;
    }

    public void setQlatitude(Double qlatitude)
    {
        this.qlatitude = qlatitude;
    }

    public Double getNoiselevel()
    {
        return noiselevel;
    }

    public void setNoiselevel(Double noiselevel)
    {
        this.noiselevel = noiselevel;
    }

    public Samples getSampleid()
    {
        return sampleid;
    }

    public void setSampleid(Samples sampleid)
    {
        this.sampleid = sampleid;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (qsampleid != null ? qsampleid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Qsamples))
        {
            return false;
        }
        Qsamples other = (Qsamples) object;
        if ((this.qsampleid == null && other.qsampleid != null) || (this.qsampleid != null && !this.qsampleid.equals(other.qsampleid)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "test.dbentities.Qsamples[ qsampleid=" + qsampleid + " ]";
    }
    
}
