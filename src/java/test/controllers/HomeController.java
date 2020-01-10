/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author arnav
 */
@Controller
public class HomeController
{
    @Autowired
    HibernateTemplate hibernateTemplate;
    
    @RequestMapping("/userhome")
    public ModelAndView userhome()
    {
        return new ModelAndView("userhome");
    }
}
