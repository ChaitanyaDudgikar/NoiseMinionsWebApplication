/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test.controllers;

import noiseminions.miner.NoiseEstimator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author arnav
 */
@Controller
public class NoiseEstimationController
{
    @Autowired
    HibernateTemplate hibernateTemplate;
    
    @RequestMapping("/estimate")
    public void estimate() throws Exception
    {
        NoiseEstimator.estimateNoiseSources(hibernateTemplate);
    }
}
