/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.controllers;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import test.entities.Marks;
import test.entities.Student;
import test.entities.data;
import test.entities.noise;

/**
 *
 * @author arnav
 */
@Controller
public class HelloController {

    @ResponseBody
    @RequestMapping("/msg")
    public String msg() {
        return "Hello";
    }

    @RequestMapping("/msg2")
    public String msg2() {
        return "xyz";
    }

    @RequestMapping("/msg3")
    public ModelAndView msg3() {
        String name = "Arnav";

        ModelAndView mv = new ModelAndView();
        mv.setViewName("abc");
        mv.addObject("name", name);

        mv.addObject("n1", 10);
        mv.addObject("n2", 20);

        return mv;
    }
    
    @RequestMapping("/studentinfo")
    public ModelAndView studentInfo()
    {
        List<Marks> marks=new ArrayList<>();
        
        Marks m=new Marks();
        m.setSubject("English");
        m.setMarks(60);
        marks.add(m);
        
        m=new Marks();
        m.setSubject("Marathi");
        m.setMarks(0);
        marks.add(m);
        
                
        Student s=new Student();
        s.setMarks(marks);
        s.setName("Abcd");
        s.setRollno(10);
        
        ModelAndView mv=new ModelAndView("studentinfo");
        mv.addObject("student",s);
        
        return mv;
    }
    
    @RequestMapping("/noiseinfo")
    public ModelAndView noiseInfo()
    {
        //List<Data> noiseList=hibernateTemplate.find("");
        
        List<data> decibleList=new ArrayList<>();
        
        data m=new data();
        m.setDecibal(20);
        decibleList.add(m);
        
        m=new data();
        m.setDecibal(40);
        decibleList.add(m);

        m=new data();
        m.setDecibal(60);
        decibleList.add(m);

        m=new data();
        m.setDecibal(80);
        decibleList.add(m);

        m=new data();
        m.setDecibal(100);
        decibleList.add(m);

                
        noise n=new noise();
        n.setdecible(decibleList);
        
        ModelAndView mv=new ModelAndView("noiseinfo");
        mv.addObject("noise",n);
        
        return mv;
    }
    
    
}
