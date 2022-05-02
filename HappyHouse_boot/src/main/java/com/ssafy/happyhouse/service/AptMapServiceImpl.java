package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.AptInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;
import com.ssafy.happyhouse.model.mapper.AptMapMapper;



@Service
public class AptMapServiceImpl implements AptMapService {
	
	@Autowired
	private AptMapMapper aptMapMapper;

	@Override
	public List<SidoGugunCodeDto> getSido() throws Exception {
		return aptMapMapper.getSido();
	}

	@Override
	public List<SidoGugunCodeDto> getGugun(String sido) throws Exception {
		return aptMapMapper.getGugun(sido);
	}

	@Override
	public List<AptInfoDto> getDong(String gugun) throws Exception {
		return aptMapMapper.getDong(gugun);
	}

	@Override
	public List<AptInfoDto> getApt(String dong) throws Exception {
		return aptMapMapper.getApt(dong);
	}

	@Override
	public List<AptInfoDto> getAptName(String dong, String aptName) throws Exception {
		return aptMapMapper.getAptName(dong, aptName);
	}

}
