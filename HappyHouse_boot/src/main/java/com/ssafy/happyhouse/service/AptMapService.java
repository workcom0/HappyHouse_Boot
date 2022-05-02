package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.model.AptInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;

public interface AptMapService {

	List<SidoGugunCodeDto> getSido() throws Exception;
	List<SidoGugunCodeDto> getGugun(String sido) throws Exception;
	List<AptInfoDto> getDong(String gugun) throws Exception;
	List<AptInfoDto> getApt(String dong) throws Exception;
	List<AptInfoDto> getAptName(String dong, String aptName)throws Exception;
}
