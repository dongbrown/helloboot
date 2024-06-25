package com.bs.helloboot.common.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import com.bs.helloboot.model.dto.Member;

//Dao 필요없음 - Controller - Service - Mapper(인터페이스)
@Mapper
public interface MemberMapper {

	//ResultMap 생성하기
//	@Results(id="", value= {
//			@Result()
//	})

	
	
	@Select("SELECT * FROM MEMBER")
	List<Member> selectMemberAll();
	
	@Select("SELECT * FROM MEMBER WHERE USERID = #{userId}")
	Member selectMemberbyId(String userId);
	
	@Insert("INSERT INTO MEMBER VALUES(#{userId}, #{password},"
			+ " #{name}, #{gender}, #{age}, #{email}, #{phone}, #{address},"
			+ " #{hobby}, #{enrollDate}) ")
	int insertMember(Member m);
	
	
	@SelectProvider(type = MemberMapperBuilder.class, method="selectMemberByWhere")
	// MemberMapperBuilder 클래스의 selectMemberByWhere 메서드를 이용하여 동적으로 SQL을 생성하여 실행합니다.
	public List<Member> selectMemberByWhere(Map<String, Object> param);

	
	
	
	
	
	
	
	
}
