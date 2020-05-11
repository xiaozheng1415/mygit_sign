package com.ygz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.ygz.entity.User;

@Repository
public interface UserMapper {
	@Select("select * from user where account='${account}' and pswd='${pswd}'")
	public User dologin(@Param("account")String account,@Param("pswd")String pswd);
	@Select("select * from user where id=#{id}")
	public User get(int id);
	@Select("select * from user limit ${start},${psize}")
	public List<User> findAll(@Param("start")int start,@Param("psize") int psize);
	@Select("select count(*) from user")
	public int count();
	@Select("select * from user where account=#{account}")
	public User findAccount(String account);
	@Insert("insert into user(account,name,pswd,type,enable) values (#{account},#{name},#{pswd},#{type},#{enable})")
	public int insert (User user);
	@Delete("delete from user where id=#{id}")
	public int delete(int id);
	@Select("select * from user where id=#{id}")
	public User findAllUser(int id);
	@Update("update user set account=#{account},name=#{name},pswd=#{pswd},type=#{type},enable=#{enable} where id=#{id}")
	public int update(User user);
}
