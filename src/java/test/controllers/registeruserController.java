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
import test.dbentities.Users;
import test.entities.RegisterForm;


/**
 *
 * @author arnav
 */
@Controller
public class registeruserController
{

    @Autowired
    HibernateTemplate hibernateTemplate;

    @RequestMapping(value = "/registeruser", method = RequestMethod.GET)
    public ModelAndView registeruser()
    {
        ModelAndView m = new ModelAndView("registeruser");
        final registeruserForm registeruserform = new registeruserForm();

        m.addObject("registeruserform", registeruserform);
        return m;
    }

    @Transactional
    @RequestMapping(value = "/registeruser", method = RequestMethod.POST)
    public ModelAndView registeruser(@ModelAttribute registeruserForm form)
    {
        String retypedpassword = form.getRpassword();
        String username = form.getUsername();
        String password = form.getPassword();
        String role = form.getRole();
        
        if (retypedpassword.equals(password))
        {
            Users u= new Users();
            u.setUsername(username);
            u.setPasswordhash(password);
            u.setRole(role);
            
            hibernateTemplate.save(u);            
            return new ModelAndView("redirect:/index.htm");
        } else
        {
            ModelAndView mv = new ModelAndView("registeruser");
            mv.addObject("registeruserform", form);
            //mv.addObject("message", "Login failed");
            mv.addObject("message1", "please enter same password");

            return mv;
        }
         
         
         
    } 
//    @RequestMapping("/getUsers")
//    public void getUsers()
//    {
//        int id = 1;
//
//        Users u = hibernateTemplate.get(Users.class, id);
//        List<Users> list = (List<Users>) (List<?>) hibernateTemplate.find("from Users u where u.username=? and u.password=? and u.role=?");
//        System.out.println(u.getUsername() + ":" + u.getPasswordhash());
//    }
}