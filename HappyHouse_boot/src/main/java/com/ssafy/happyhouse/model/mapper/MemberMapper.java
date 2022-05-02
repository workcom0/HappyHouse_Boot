package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.MemberDto;

@Mapper
public interface MemberMapper {
	int idCheck(String id);
	
	public MemberDto findPassWord(MemberDto memberDto) throws Exception;
	
	void registerMember(MemberDto memberDto) throws SQLException;
	
	MemberDto login(String id) throws SQLException;
	
	List<MemberDto> listMember() throws Exception;
	
	MemberDto getMember(String id) throws Exception;
	
	void updateMember(MemberDto memberDto) throws Exception;
	
	void deleteMember(String id) throws Exception;
}
