package com.ssafy.happyhouse.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.NoticeDto;
import com.ssafy.util.PageNavigation;

public interface NoticeService {
	void registerNotice(NoticeDto noticeDto) throws SQLException;
	List<NoticeDto> listNotice(Map<String, String> map) throws SQLException;
	PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
	NoticeDto getNotice(int noticeNo) throws SQLException;
	void updateNotice(NoticeDto noticeDto) throws SQLException;
	void deleteNotice(int noticeNo) throws SQLException;
}
