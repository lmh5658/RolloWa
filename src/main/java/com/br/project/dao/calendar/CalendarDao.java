package com.br.project.dao.calendar;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.br.project.dto.calendar.CalendarDto;
import com.br.project.dto.member.MemberDto;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class CalendarDao {
	private final SqlSessionTemplate sqlSession;

	public List<CalendarDto> selectPCalendar() {
		return sqlSession.selectList("calMapper.selectPCalendar");
	}

	public int insertCal(CalendarDto calendar) {
		return sqlSession.insert("calMapper.insertCal", calendar);
	}

	public int insertCoworker(String userNo) {
		return sqlSession.insert("calMapper.inserCoworker", userNo);
	}

	public int calUpdate(CalendarDto calendar) {
		return sqlSession.update("calMapper.calUpdate", calendar);
	}

	public List<MemberDto> selectTeamPeer(String teamCode) {
		return sqlSession.selectList("memberMapper.selectTeamPeer", teamCode);
	}

	public int coworkerDelete(String calNO) {
		return sqlSession.delete("calMapper.coworkerDelete", calNO);
	}

	public int reInserCoworker(String calNO, String userNo) {
		Map<String, String> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("calNO", calNO);
		return sqlSession.insert("calMapper.reInserCoworker", map);
	}


	
}
