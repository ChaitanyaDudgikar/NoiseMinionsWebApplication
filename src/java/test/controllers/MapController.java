/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author cdudg
 */
@Controller
public class MapController
{
    @RequestMapping("view")
    public String view()
    {
        return "map";
    }
}
