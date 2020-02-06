/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.dbentities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.metamodel.SingularAttribute;

/**
 *
 * @author arnav
 */
@Entity
@Table(name = "samples")
@NamedQueries(
{
    @NamedQuery(name = "Samples.findAll", query = "SELECT s FROM Samples s")
})
public class Samples implements Serializable
{

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "sampleid")
    private Integer sampleid;
    @Column(name = "deviceid")
    private String deviceid;
    @Column(name = "datetime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date datetime;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "longitude")
    private Double longitude;
    @Column(name = "latitude")
    private Double latitude;
    @Column(name = "noiselevel")
    private Double noiselevel;
    
    @OneToMany(mappedBy = "sampleid")
    private List<Qsamples> qsamplesList;

    public Samples()
    {
    }

    public Samples(Integer sampleid)
    {
        this.sampleid = sampleid;
    }

    public Integer getSampleid()
    {
        return sampleid;
    }

    public void setSampleid(Integer sampleid)
    {
        this.sampleid = sampleid;
    }

    public String getDeviceid()
    {
        return deviceid;
    }

    public void setDeviceid(String deviceid)
    {
        this.deviceid = deviceid;
    }

    public Date getDatetime()
    {
        return datetime;
    }

    public void setDatetime(Date datetime)
    {
        this.datetime = datetime;
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
    public List<Qsamples> getQsamplesList()
    {
        return qsamplesList;
    }

    public void setQsamplesList(List<Qsamples> qsamplesList)
    {
        this.qsamplesList = qsamplesList;
    }

    @Override
    public int hashCode()
    {
        int hash = 0;
        hash += (sampleid != null ? sampleid.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object)
    {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Samples))
        {
            return false;
        }
        Samples other = (Samples) object;
        if ((this.sampleid == null && other.sampleid != null) || (this.sampleid != null && !this.sampleid.equals(other.sampleid)))
        {
            return false;
        }
        return true;
    }

    @Override
    public String toString()
    {
        return "test.dbentities.Samples[ sampleid=" + sampleid + " ]";
    }

    public void setDeviceid(SingularAttribute<Samples, String> deviceid)
    {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
