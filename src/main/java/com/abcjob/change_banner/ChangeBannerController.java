package com.abcjob.change_banner;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abcjob.entity.UserProfile;
import com.abcjob.login.LoginService;

@Controller
public class ChangeBannerController {
	
	@Autowired
	ChangeBannerService changeBannerService;
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping("/change-banner")
	public ModelAndView changeBanner(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		UserProfile profile = loginService.getCurrentUser(session);
		
		if(profile == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		
		List<String> listBanner = new ArrayList<>();
		
		for(int i = 1; i <= 8; i++) {
			listBanner.add("banner" + i);
		}
	    
	    mv.addObject("listBanner", listBanner);
		
		mv.setViewName("change-banner");
		
		return mv;
	}
	
	// Save Change Banner
	@RequestMapping(value = "/changeBanner", method = RequestMethod.GET)
	public ModelAndView saveChangeBanner(HttpSession session, @RequestParam("banner") String banner) {
		ModelAndView mv = new ModelAndView();
		UserProfile profile = loginService.getCurrentUser(session);
		
		if(profile == null) {
			mv.setViewName("redirect:/login");
			return mv;
		}
		
		UserProfile editedProfile = changeBannerService.changeBanner(profile.getId_profile(), banner);
		
		session.setAttribute("profile", editedProfile);
		mv.setViewName("redirect:/user-profile");
		
		return mv;
	}
}
