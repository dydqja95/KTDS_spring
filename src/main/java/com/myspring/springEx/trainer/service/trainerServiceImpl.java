package com.myspring.springEx.trainer.service;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.springEx.trainer.dao.trainerDAO;
import com.myspring.springEx.trainer.vo.trainerVO;

@Service("trainerService")
@Transactional(propagation = Propagation.REQUIRED)
public class trainerServiceImpl implements trainerService{
	@Autowired
	private trainerDAO trainerDAO;
	
	@Override
	public int checkCount(String id) throws DataAccessException{
		int trainerList = 2;
		trainerList = trainerDAO.checkCount(id);
		return trainerList;
	}
	
	@Override
	public void insertCount(Map trainMap) throws DataAccessException{
		trainerDAO.insertCount(trainMap);
	}
	
	@Override
	public void plusCount(Map trainMap) throws DataAccessException{
		trainerDAO.plusCount(trainMap);
	}
}
