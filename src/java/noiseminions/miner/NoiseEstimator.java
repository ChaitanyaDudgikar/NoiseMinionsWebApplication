/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package noiseminions.miner;

import javax.transaction.Transactional;
import org.springframework.orm.hibernate4.HibernateTemplate;
import test.dbentities.Samples;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author arnav
 */
public class NoiseEstimator
{

    public static double calDistance(double lat1,
            double lat2, double lon1,
            double lon2)
    {

        // The math module contains a function 
        // named toRadians which converts from 
        // degrees to radians. 
        lon1 = Math.toRadians(lon1);
        lon2 = Math.toRadians(lon2);
        lat1 = Math.toRadians(lat1);
        lat2 = Math.toRadians(lat2);

        // Haversine formula  
        double dlon = lon2 - lon1;
        double dlat = lat2 - lat1;
        double a = Math.pow(Math.sin(dlat / 2), 2)
                + Math.cos(lat1) * Math.cos(lat2)
                * Math.pow(Math.sin(dlon / 2), 2);

        double c = 2 * Math.asin(Math.sqrt(a));

        // Radius of earth in kilometers. Use 3956  
        // for miles 
        double r = 6371;

        // calculate the result 
        return (c * r);
    }

    @Transactional
    public static void estimateNoiseSources(HibernateTemplate hibernateTemplate) throws Exception
    {

        try (Connection con = Database.getConnection();
                PreparedStatement stmt = con.prepareStatement("select * from samples where longitude>? and longitude<? and latitude>? and latitude<?"))
        {

            for (double longitude = 75; longitude < 76; longitude += 1e-3)
            {
                for (double latitude = 17; latitude < 18; latitude += 1e-3)
                {
                    System.out.printf("%.4f %.4f\n", latitude, longitude);

                    double longitude2 = longitude + 1e-3f;
                    double latitude2 = latitude + 1e-3f;

                    //retrieve entries bet long,lat,long2,lat2
                    stmt.setDouble(1, longitude);
                    stmt.setDouble(2, longitude2);
                    stmt.setDouble(3, latitude);
                    stmt.setDouble(4, latitude2);
                    List<Samples> samples = new ArrayList<>();
                    try (ResultSet rs = stmt.executeQuery())
                    {
                        while (rs.next())
                        {
                            Samples s = new Samples();
                            s.setLongitude(rs.getDouble("longitude"));
                            s.setLatitude(rs.getDouble("latitude"));
                            s.setNoiselevel(rs.getDouble("noiselevel"));

                            samples.add(s);
                        }
                    }

                    if (samples.isEmpty())
                    {
                        System.out.println("...Skipping");
                        continue;
                    }

                    double minlong = 0;
                    double minlat = 0;
                    double mindiff = Float.MAX_VALUE;
                    double enoiselevel = 0;

                    for (double slongitude = longitude; slongitude <= longitude2; slongitude += 1e-4)
                    {
                        for (double slatitude = latitude; slatitude < latitude2; slatitude += 1e-4)
                        {
                            for (double decibel = 0; decibel < 110; decibel += 10)
                            {
                                for (Samples s : samples)
                                {
                                    double noiselevel = s.getNoiselevel();
                                    double distance = calDistance(slatitude, s.getLatitude(), slongitude, s.getLongitude()); //gcd between sample slong, slat

                                    double edecibel = decibel / distance / distance;

                                    double diff = Math.abs(edecibel - noiselevel);

                                    if (diff < mindiff)
                                    {
                                        mindiff = diff;
                                        minlong = slongitude;
                                        minlat = slatitude;
                                        enoiselevel = decibel;
                                    }
                                }
                            }
                        }
                    }

                    System.out.println(latitude + "," + longitude + " => " + minlat + "," + minlong + "," + enoiselevel + "," + mindiff);
                    //store to db
                }
            }
        }
    }
}
