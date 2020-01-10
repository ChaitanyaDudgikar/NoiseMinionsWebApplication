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
public class Student {

    private int rollno;
    private String name;

    private List<Marks> marks;

    public int getRollno() {
        return rollno;
    }

    public void setRollno(int rollno) {
        this.rollno = rollno;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Marks> getMarks() {
        return marks;
    }

    public void setMarks(List<Marks> marks) {
        this.marks = marks;
    }


    public double getAverage()
    {
        double d=0;
        for(Marks m:getMarks())
            d+=m.getMarks();
        return d/getMarks().size();
    }
}
