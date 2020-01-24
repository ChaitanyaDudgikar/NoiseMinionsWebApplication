/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author cdudg
 */
@Controller
public class AboutController
{
     @RequestMapping("/about")
    public ModelAndView about()
    {
        return new ModelAndView("about");
    }
}
