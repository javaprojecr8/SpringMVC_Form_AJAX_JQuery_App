package com.ashok.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ashok.model.User;

@Service("userService")
public class UserService {

	public UserService() {
		System.out.println("UserService::Controller");

	}

	private static Map<Integer, User> dataMap = new HashMap<Integer, User>();

	public boolean addUser(User u) {
		if (!dataMap.containsKey(u.getUserId())) {
			dataMap.put(u.getUserId(), u);
			return true;
		}

		return false;
	}

	public User findByUserId(Integer userId) {
		if (dataMap.containsKey(userId)) {
			return dataMap.get(userId);
		}

		return null;
	}

	public Collection<User> findAll() {
		return dataMap.values();
	}

}
