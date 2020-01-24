/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.controllers;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import test.entities.RegisterForm;
import test.dbentities.Users;

/**
 *
 * @author arnav
 */
@Controller
public class registerController
{

    @Autowired
    HibernateTemplate hibernateTemplate;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public ModelAndView login()
    {
        ModelAndView mv = new ModelAndView("register");
        final RegisterForm Registerform = new RegisterForm();
        //loginForm.setUsername("abcd");
        mv.addObject("registerform", Registerform);

        return mv;
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public ModelAndView register(@ModelAttribute RegisterForm form)
    {
        String specialpassword = form.getSpecialpassword();
        String username = form.getUsername();
        String password = form.getPassword();
        String spassword = "MakeInIndia";
//        System.out.println("username = " + username);
//        System.out.println("password = " + password);
//        System.out.println("Retyped password = " + retypedpassword);
        if (specialpassword.equals(spassword))
        {
            return new ModelAndView("redirect:/login.htm");
        } else
        {
            ModelAndView mv = new ModelAndView("register");
            mv.addObject("registerform", form);
            //mv.addObject("message", "Login failed");
            mv.addObject("message1", "please enter valid special password");

            return mv;
        }
    }

    

    @RequestMapping("/getUsers")
    public void getUsers()
    {
        int id = 1;

        Users u = hibernateTemplate.get(Users.class, id);
        List<Users> list = (List<Users>) (List<?>) hibernateTemplate.find("from Users u where u.username=? and u.password=?");
        System.out.println(u.getUsername() + ":" + u.getPasswordhash());
    }

}
