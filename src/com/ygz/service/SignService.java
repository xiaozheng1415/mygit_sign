package com.ygz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ygz.entity.Signin;
import com.ygz.mapper.SignMapper;
import com.ygz.util.Page;

@Service
public class SignService {
	@Autowired
	SignMapper signMapper;
	
	public Page<Signin> findAllByUser(Integer userid,Integer pageNo,Integer pageSize){
		Page<Signin> page=new Page<Signin>(pageNo,pageSize);
		page.setTotalCount(signMapper.countbyUser(userid));
		int start=page.getOffset();
		List<Signin> list=signMapper.findAllByUser(userid,start,pageSize);
		page.setResult(list);
		return page;		
	
	
	}
	//管理员查询签到记录
	public Page<Signin> findAll(Integer pageNo,Integer pageSize){
		Page<Signin> page=new Page<Signin>(pageNo,pageSize);
		page.setTotalCount(signMapper.count());
		int start=page.getOffset();
		List<Signin> list=signMapper.findAll(start,pageSize);
		page.setResult(list);
		return page;		
	
	
	}
}
