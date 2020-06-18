package com.myspring.springEx.trainer.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("trainerVO")
public class trainerVO {

	private String id;
	private String exercise_count;
	private Date nowdate;
	
	public trainerVO(){
		
	}
	
	public trainerVO(String id, String exercise_count, Date nowdate) {
		this.id = id;
		this.exercise_count = exercise_count;
		this.nowdate = nowdate;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getExercise_count() {
		return exercise_count;
	}
	public void setExercise_count(String exercise_count) {
		this.exercise_count = exercise_count;
	}
	public Date getNowdate() {
		return nowdate;
	}
	public void setNowdate(Date nowdate) {
		this.nowdate = nowdate;
	}
	
	
}
