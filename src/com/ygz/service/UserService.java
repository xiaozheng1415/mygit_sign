package com.ygz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ygz.entity.User;
import com.ygz.mapper.UserMapper;
import com.ygz.util.Page;

@Service
public class UserService {
	@Autowired
	UserMapper userMapper;
	public Page<User> findAllByPage(int pageNo,int pageSize){
		Page<User> page=new Page<User>(pageNo,pageSize);
		page.setTotalCount(userMapper.count());
		List<User> result=userMapper.findAll(page.getOffset(), pageSize);
		page.setResult(result);
		return page;
	}
}
