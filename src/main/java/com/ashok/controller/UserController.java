package com.ashok.controller;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ashok.model.User;
import com.ashok.service.UserService;

@Controller
public class UserController {

	public UserController() {
		System.out.println("UserController::Constructor");
	}

	@Autowired
	private UserService userService;

	@RequestMapping("/")
	public String index(Model model) {
		User user = new User();
		model.addAttribute("user", user);
		return "userReg";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute User user) {
		System.out.println(user);
		boolean flag = userService.addUser(user);
		if (flag) {
			return "redirect:fetchAllUsers";
		}
		return "/";
	}

	@RequestMapping("/fetchAllUsers")
	public @ResponseBody Collection<User> fetchAllUsers() {
		return userService.findAll();
	}

}
