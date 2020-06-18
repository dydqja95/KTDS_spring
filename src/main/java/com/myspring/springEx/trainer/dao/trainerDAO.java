package com.myspring.springEx.trainer.dao;

import java.util.List;
import java.util.HashMap;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import com.myspring.springEx.trainer.vo.trainerVO;

public interface trainerDAO {

	public void insertCount(Map trainMap) throws DataAccessException;
	public void plusCount(Map trainMap) throws DataAccessException;
	public int checkCount(String id) throws DataAccessException;
}

