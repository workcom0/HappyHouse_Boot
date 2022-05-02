package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public int idCheck(String checkId) throws Exception {
		return memberMapper.idCheck(checkId); // 0 or 1
	}

	@Override
	public void registerMember(MemberDto memberDto) throws Exception {
		memberMapper.registerMember(memberDto);
	}

	@Override
	public MemberDto login(String id) throws Exception {
		return memberMapper.login(id);
	}
	
	@Override
	public List<MemberDto> listMember() throws Exception {
		return memberMapper.listMember();
	}

	@Override
	public MemberDto getMember(String id) throws Exception {
		return memberMapper.getMember(id);
	}

	@Override
	public void updateMember(MemberDto memberDto) throws Exception {
		memberMapper.updateMember(memberDto);
	}

	@Override
	public void deleteMember(String id) throws Exception {
		memberMapper.deleteMember(id);
	}

	@Override
	public MemberDto findPassWord(MemberDto memberDto) throws Exception {
		return memberMapper.findPassWord(memberDto);
	}
}
