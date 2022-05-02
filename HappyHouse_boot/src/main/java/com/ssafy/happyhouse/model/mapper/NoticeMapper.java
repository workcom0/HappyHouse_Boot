package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.NoticeDto;

@Mapper
public interface NoticeMapper {
	void registerNotice(NoticeDto noticeDto) throws SQLException;
	List<NoticeDto> listNotice(Map<String, Object> map) throws SQLException;
	int getTotalCount(Map<String, String> map) throws SQLException;	
	NoticeDto getNotice(int noticeNo) throws SQLException;
	void updateNotice(NoticeDto noticeDto) throws SQLException;
	void deleteNotice(int noticeNo) throws SQLException;
}
