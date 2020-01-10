/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package noiseminions.miner;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author arnav
 */
public class Database
{

    static
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException ex)
        {
            Logger.getLogger(NoiseEstimator.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static Connection getConnection() throws SQLException
    {
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/noise", "root", "root");
        return con;
    }

}
