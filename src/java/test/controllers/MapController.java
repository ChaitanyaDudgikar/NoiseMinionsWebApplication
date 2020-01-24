/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.controllers;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import test.dbentities.Users;

/**
 *
 * @author cdudg
 */
@Controller
public class MapController
{

    @RequestMapping("/map")
    public String view(HttpSession session)
    {
        Users user = (Users) session.getAttribute("user");
        if (user == null)
        {
            return "redirect:/login.htm";
        } else
        {
            return "map";
        }
    }
}
