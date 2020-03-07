/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.controllers;

import com.fasterxml.jackson.jr.ob.JSON;
import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import test.dbentities.Noisebydate;
import test.dbentities.Noisepattern;
import test.dbentities.Samples;
import test.dbentities.UploadCommand;

/**
 *
 * @author arnav
 */
@Controller
public class NoiseserviceController
{

    @Autowired
    HibernateTemplate hibernateTemplate;

    @ResponseBody
    @Transactional
    @RequestMapping(value = "/upload")
    public String upload(@ModelAttribute UploadCommand command)
    {
        Samples s = new Samples();

        s.setDeviceid(command.getDeviceid());
        s.setDatetime(new Date());
       
        s.setLatitude(command.getLatitude());
        s.setLongitude(command.getLongitude());
        s.setNoiselevel(command.getNoiselevel());
        hibernateTemplate.save(s);

        return "{\"result\":\"success\"}";
    }

    @ResponseBody
    @RequestMapping("/query")
    public String query(
            @RequestParam(value = "lat_from", required = true) Double lat_from,
            @RequestParam(value = "lat_to", required = true) Double lat_to,
            @RequestParam(value = "long_from", required = true) Double long_from,
            @RequestParam(value = "long_to", required = true) Double long_to,
            @RequestParam(value = "dow", required = false) String dow,
            @RequestParam(value = "date", required = false) String date,
            @RequestParam(value = "time", required = false) String time,
            @RequestParam(value = "month", required = false) String month,
            @RequestParam(value = "year", required = false) String year
    ) throws ParseException, IOException
    {
        
        if(time==null){time="-";}
        if(date==null){date="-";}
        if(dow==null){dow="-";}
        if(month==null){month="-";}
       // SimpleDateFormat sdf = new SimpleDateFormat("H:m");
        //final Time dbtime = new java.sql.Time(sdf.parse(time).getTime());
        System.out.println("lat_from = " + lat_from);
        System.out.println("lat_to = " + lat_to);
        System.out.println("long_from = " + long_from);
        System.out.println("long_to = " + long_to);
        System.out.println("year = " + year);
        System.out.println("month = " + month);
        System.out.println("date = " + date);
        System.out.println("dow = " + dow);        
        System.out.println("dbtime = " + time);
        if (year == null)
        {
            //query noisepattern (pattern)
            List<Noisepattern> list = (List<Noisepattern>) (List<?>) hibernateTemplate.find("select p from Noisepattern p where "
                    + "p.longitudeNoise between ? and ? "
                    + "and p.latitudeNoise between ? and ? "
                    + "and p.day=? "
                    + "and p.month=?"
                    + "and p.qtime=?"
                    + "and p.weekday=?",
                    long_from, long_to,
                    lat_from, lat_to,
                    date,
                    month, 
                    time,
                    dow
            );
            
//            List<Noisepattern> list2=(List<Noisepattern>)(List<?>)hibernateTemplate.find("select p from Noisepattern p");

            return JSON.std.asString(list);
        } else
        {
            Calendar c = Calendar.getInstance();
            c.set(Calendar.YEAR, Integer.parseInt(year));
            c.set(Calendar.MONTH, Integer.parseInt(month)-1);
            c.set(Calendar.DAY_OF_MONTH, Integer.parseInt(date));
            c.set(Calendar.HOUR, 0);
            c.set(Calendar.MINUTE, 0);
            c.set(Calendar.SECOND, 0);

            java.sql.Date dbdate = new java.sql.Date(c.getTimeInMillis());
            System.out.println("dbdate: "+dbdate);

            //query noisebydate (history)
            List<Noisebydate> list = (List<Noisebydate>) (List<?>) hibernateTemplate.find("from Noisebydate d where "
                    + "d.longitudeNoise between ? and ? "
                    + "and d.latitudeNoise between ? and ? "
                    + "and d.date=? "
                    + "and d.qtime=?",
                    long_from, long_to,
                    lat_from, lat_to,
                    dbdate, new java.sql.Time(Integer.parseInt(time), 0, 0));

            return JSON.std.asString(list);
        }
    }

}
