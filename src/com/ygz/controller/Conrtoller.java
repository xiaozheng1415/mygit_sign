package com.ygz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ygz.entity.Signin;
import com.ygz.entity.User;
import com.ygz.mapper.UserMapper;
import com.ygz.service.SignService;
import com.ygz.service.UserService;
import com.ygz.util.Page;

@Controller
@RequestMapping("user")
public class Conrtoller {
	@Autowired
	UserMapper userMapper;
	@Autowired
	HttpServletRequest request;
	//登录界面
	@Autowired
	UserService userService;
	@Autowired
	SignService signService;
	@RequestMapping("index")
	public String index() {
		return "jsp/login";
	}
	@RequestMapping("login")
	public String login(String account,String pswd,Model model) {
		User user=userMapper.dologin(account, pswd);
		if(user==null) {
			 model.addAttribute("loginType",-1); //用户名或密码错误
			 return "jsp/login";
		}else {
			if(user.getEnable()==0) {
				model.addAttribute("loginType",-2);//用户禁用
				return "jsp/login";
			}else {
				
				HttpSession session=request.getSession();
				session.setAttribute("user", user);
				if(user.getType()==0) {  //转到普通用户签到界面sign		
					return "forward:sign.do";	
				}else {
					return "redirect:getusers.do";	//转到管理员用户
				}
			}
		}
	}
	//签到界面
	@RequestMapping("sign")
	public String sign() {
		return "jsp/sign";
	}
	//注销
	@RequestMapping("logout")
	public String logout() {
		HttpSession session=request.getSession();
		session.removeAttribute("user");
		session.setMaxInactiveInterval(0);
		return "jsp/login";
	}
	//管理员
	@RequestMapping("getusers")
	public String getUsers(Model model,@RequestParam(defaultValue="1")Integer pageNo) {
		int pageSize=5;
		Page<User> page=userService.findAllByPage(pageNo,pageSize);
		model.addAttribute("page",page);
		return "jsp/userCtrl";
	}
	@RequestMapping("userAdd")
	public String useradd() {
		return "jsp/userAdd";
	}
	//验证用户名是否重复
	@ResponseBody
	@RequestMapping("findAccount")
	public User findAccount(String account) {
		
		User user=userMapper.findAccount(account);
		if(user!=null) {
			return user;
		}else {
			user=new User();
			user.setId(0);
			return user;
		}
		
	}
	@RequestMapping("addUser")
	public String addUser(User user) {
		if(user.getId()==null) {
		userMapper.insert(user);
		}else {
			userMapper.update(user);
		}
		
		return "redirect:getusers.do";
		
	}
	//查询签到记录分页
	@RequestMapping("findAllsignByuser.do")
	  public String findAllsign(Model model,@RequestParam(defaultValue="1")Integer pageNo) {
		  int pageSize=5;
		  Page<Signin> page=signService.findAll(pageNo, pageSize);
		  model.addAttribute("page",page);
		  return "jsp/usersignlist";
	  }
	//删除用用户
	@RequestMapping("deleteUser")
	public String deleteUser(int userid) {
		userMapper.delete(userid);
		return "redirect:getusers.do";
		
	}
	//更新用户
	@RequestMapping("edit")
	public String editUser(Model model,int userid) {
		User user=userMapper.findAllUser(userid);
		model.addAttribute("user2", user);
		return "jsp/userAdd";
		
	}
	
}
