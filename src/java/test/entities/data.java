/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.entities;

import java.util.List;

/**
 *
 * @author arnav
 */
public class data {

    private static int count=0;
    
    private double decibal;
    private int index=++count;

    public double getDecibal() {
        return decibal;
    }

    public void setDecibal(double decibal) {
        this.decibal = decibal;
    }

    public int getIndex() {
        return index;
    }
    
    
    
    
    
}
