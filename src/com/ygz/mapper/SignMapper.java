package com.ygz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.ygz.entity.Signin;

@Repository
public interface SignMapper {
	//签到或签退
	@Insert("insert into signin(userid,signtime,type) values (#{userid},#{signtime},#{type})")
	public int insert(Signin signin);
	//签到记录
	@Select("select * from signin where userid=${userid} limit ${start},${psize}")
	
	  @Results(id="userMap",value= {
	  
	  @Result(property="userid",column="userid"),
	  
	  @Result(property="user",column="userid",
	  one=@One(select="com.ygz.mapper.UserMapper.get")) })
	 
	public List<Signin> findAllByUser(@Param("userid")int userid,@Param("start")int start,@Param("psize")int psize);
	
	//根据用户查询签到记录数
	@Select("select count(*) from signin where userid=#{userid}")
	public int countbyUser(int userid);
    //查询用户的最新状态
	@Select("select * from signin where userid=#{userid} order by signtime desc limit 0,1")
	public Signin newSignByUserid(int userid);
	@Select("select count(*) from signin")
	public int count();
	//管理员查询用户签到记录
	@Select("select * from signin limit ${start},${psize}")
	@ResultMap("userMap")
	public List<Signin> findAll(@Param("start")int start,@Param("psize") int psize);
}
