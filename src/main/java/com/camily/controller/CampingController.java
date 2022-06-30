package com.camily.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CampingController {

	@RequestMapping(value = "campingList")
	public String campingList() {
		return "camping/CampingList";
	}
	
	@RequestMapping(value = "campingView")
	public String campingView() {
		return "camping/CampingView";
	}
}
