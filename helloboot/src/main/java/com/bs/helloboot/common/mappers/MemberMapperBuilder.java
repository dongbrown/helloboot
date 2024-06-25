package com.bs.helloboot.common.mappers;

import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

public class MemberMapperBuilder {
	
	// 동적 SQL을 생성하여 회원 검색 쿼리를 반환하는 메서드입니다.
	public static String selectMemberByWhere(Map<String, Object> param) {
		return new SQL() {{
			SELECT("*"); // 모든 컬럼을 선택합니다.
			FROM("MEMBER"); // MEMBER 테이블에서 데이터를 조회합니다.
			// userName 파라미터가 주어진 경우, LIKE 조건을 추가합니다.
			if(param.get("userName") != null && !param.get("userName").equals("")) {
				WHERE("USERNAME LIKE '%' || #{userName} ||'%'");
			}
			// gender 파라미터가 주어진 경우, 동등 조건을 추가합니다.
			if(param.get("gender") != null && !param.get("gender").equals("")) {
				WHERE("Gender = #{gender}");
			}
		}}.toString(); // SQL 객체를 문자열로 변환하여 반환합니다.
	}

}
