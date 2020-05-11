package com.ygz.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.ygz.entity.Signin;
import com.ygz.entity.User;
import com.ygz.mapper.SignMapper;
import com.ygz.service.SignService;
import com.ygz.util.Page;

@Controller
@RequestMapping("sign")
public class SignController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	SignMapper signMapper;
	@Autowired
	SignService signService; 
	private Map<String,Object> map=new HashMap<String,Object>();
	private Gson gson=new Gson();
	
	@RequestMapping("index")
	public String signshow() {
		return "login";
	}
	
	//时间
	@RequestMapping(value="/getServerTime",produces="text/plain;charset=UTF-8")
	@ResponseBody
	//produces="text/plain;charset=UTF-8"防止返回是乱码
	public String getServerTime(Signin signin) {
		Date now=new Date();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String t=dateFormat.format(now);
		map.put("serverTime",t);
		return gson.toJson(map);
	}
	
	@RequestMapping("signIn")
	@ResponseBody
	public String signIn(Integer signType) {
		Date now=new Date();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String t=dateFormat.format(now);
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		Signin signin=new  Signin();
		signin.setSigntime(t);
		signin.setUserid(user.getId());
		signin.setType(signType);
		signMapper.insert(signin);
		
		//构造json字符串
		if(signType==1) {
			map.put("signstate","1");
			map.put("msg","已签退");
		}
		else {
			map.put("signstate","0");
			map.put("msg","已签到");
		}
		System.out.println(gson.toJson(map));
		return gson.toJson(map);
		}
	  @RequestMapping("sign")
	  public String sign() {
		  return "jsp/sign";
	  }
	  @RequestMapping("findAllsignByuserid.do")
	  public String findAllsignByuserid(Model model,@RequestParam(defaultValue="1")Integer pageNo) {
		  HttpSession session=request.getSession();
		  User user=(User)session.getAttribute("user");
		  int pageSize=5;
		  Page<Signin> page=signService.findAllByUser(user.getId(), pageNo, pageSize);
		  model.addAttribute("page",page);
		  return "jsp/signlist";
	  }
	
	  //获取签到状态
	  @ResponseBody
	  @RequestMapping("getSignState")
	  public Map<String,Object> getSignState(Integer userid) {
		  Signin signin=signMapper.newSignByUserid(userid);
		  if(signin==null) {
			  map.put("signState","1");
			  map.put("msg", "未签到");
		  }else {
			  if(signin.getType()==1) {
			  map.put("signState","1");
			  map.put("msg", "未签到");
			  }
			  else {
				  map.put("signState","0");
				  map.put("msg", "已签到");
			  }
		  }
		return map;
	  }
}
