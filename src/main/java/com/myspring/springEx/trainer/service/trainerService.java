package com.myspring.springEx.trainer.service;

import org.springframework.dao.DataAccessException;

import com.myspring.springEx.trainer.vo.trainerVO;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

public interface trainerService {

	public int checkCount(String id) throws DataAccessException;
	public void insertCount(Map trainMap) throws DataAccessException;
	public void plusCount(Map trainMap) throws DataAccessException;
}
