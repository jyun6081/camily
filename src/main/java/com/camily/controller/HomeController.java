package com.camily.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.camily.service.CampingShopService;
import com.camily.service.AdminService;

/**
 * Handles requests for the application home page.
 */

@Controller
public class HomeController {
	
	@Autowired
	AdminService adsvc;
	@Autowired
	private CampingShopService csvc;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		
		ModelAndView mav = csvc.home();
		
		return mav;
	}

	@RequestMapping(value ="/admin")
	public ModelAndView adminMaingPage() {
		ModelAndView mav = adsvc.homeComponent();
		return mav;
	}
	
}
