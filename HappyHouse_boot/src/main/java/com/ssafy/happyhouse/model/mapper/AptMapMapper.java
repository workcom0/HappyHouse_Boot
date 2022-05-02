package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.AptInfoDto;
import com.ssafy.happyhouse.model.SidoGugunCodeDto;

@Mapper
public interface AptMapMapper {

	List<SidoGugunCodeDto> getSido() throws SQLException;
	List<SidoGugunCodeDto> getGugun(String sido) throws SQLException;
	List<AptInfoDto> getDong(String gugun) throws SQLException;
	List<AptInfoDto> getApt(String dong) throws SQLException;
	List<AptInfoDto> getAptName(String dong, String aptName) throws SQLException;
}
