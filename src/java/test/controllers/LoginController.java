/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.controllers;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import test.dbentities.Users;
import test.entities.LoginForm;

/**
 *
 * @author arnav
 */
@Controller
public class LoginController
{

    @Autowired
    HibernateTemplate hibernateTemplate;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login()
    {
        ModelAndView mv = new ModelAndView("login");
        final LoginForm loginForm = new LoginForm();
       // loginForm.setUsername("abcd");
        mv.addObject("loginform", loginForm);

        return mv;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public ModelAndView login(@ModelAttribute LoginForm form, HttpSession session)
    {
        String username = form.getUsername();
        String password = form.getPassword();

        System.out.println("username = " + username);
        System.out.println("password = " + password);

        List<Users> list = (List<Users>) (List<?>) hibernateTemplate.find("from Users u where u.username=? and u.passwordhash=?", username, password);

        if (!list.isEmpty())
        {
            session.setAttribute("user", list.get(0));
            return new ModelAndView("redirect:/map.htm");
        } else
        {
            
            ModelAndView mv = new ModelAndView("login");
            mv.addObject("loginform", form);
            mv.addObject("message", "Login failed");
            session.removeAttribute("user");
            return mv;
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session)
    {
        session.removeAttribute("user");
        return "redirect:/index";
    }
}
