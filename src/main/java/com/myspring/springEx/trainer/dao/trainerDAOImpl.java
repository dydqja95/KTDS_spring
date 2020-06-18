package com.myspring.springEx.trainer.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import com.myspring.springEx.trainer.vo.trainerVO;

@Repository("TrainerDAO")
public class trainerDAOImpl implements trainerDAO{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int checkCount(String id) throws DataAccessException{
		int result = 2; 
		result = sqlSession.selectOne("mapper.trainer.checkSquatTrainer", id); // id랑count를 넣어야 하는데 어떻게?		
		return result;
	}
	
	@Override
	public void insertCount(Map trainMap) throws DataAccessException{
		int result = sqlSession.insert("mapper.trainer.insertSquatTrainer", trainMap);
	}
	
	@Override
	public void plusCount(Map trainMap) throws DataAccessException{
		sqlSession.update("mapper.trainer.plusSquatTrainer", trainMap);
	}
}
