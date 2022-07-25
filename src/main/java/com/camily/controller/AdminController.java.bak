package com.camily.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.camily.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	AdminService advc;
	
	@RequestMapping(value="/adminCamping")
	public String adminCamping(){
		return "admin/AdminCamping";
	}

}
