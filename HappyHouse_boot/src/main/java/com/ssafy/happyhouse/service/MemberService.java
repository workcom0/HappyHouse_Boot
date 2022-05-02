package com.ssafy.happyhouse.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.MemberDto;

public interface MemberService {
	int idCheck(String checkId) throws Exception;
	
	MemberDto findPassWord(MemberDto memberDto) throws Exception;
	
	void registerMember(MemberDto memberDto) throws Exception;
	
	MemberDto login(String id) throws Exception;
	
	List<MemberDto> listMember() throws Exception;
	
	MemberDto getMember(String id) throws Exception;
	
	void updateMember(MemberDto memberDto) throws Exception;
	
	void deleteMember(String id) throws Exception;
	
	
}
