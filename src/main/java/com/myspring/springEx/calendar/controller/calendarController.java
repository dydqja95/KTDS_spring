package com.myspring.springEx.calendar.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.springEx.member.service.MemberService;
import com.myspring.springEx.member.vo.MemberVO;

@Controller("calendarController")
public class calendarController {

	@RequestMapping(value="/home.do" ,method = RequestMethod.GET)
	public ModelAndView trainer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = getViewName(request);
		String viewName = (String)request.getAttribute("viewName");
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);  //조회한 회원 정보를 modelandview의 addObject메소드를 이용해 바인딩 합니다
		return mav;
	}
}