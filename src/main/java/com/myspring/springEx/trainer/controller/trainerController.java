package com.myspring.springEx.trainer.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.springEx.trainer.service.trainerService;
import com.myspring.springEx.trainer.vo.trainerVO;
import com.myspring.springEx.member.vo.MemberVO;

@Controller("trainerController")
public class trainerController {
	@Autowired
	private trainerService trainerService;
	@Autowired
	private trainerVO trainerVO;
	//@Autowired
	//private MemberVO memberVO;
	
	//private static final Logger logger = LoggerFactory.getLogger(trainerController.class);
	//@Autowired
	//private MemberService memberService;
	//@Autowired
	//private MemberVO memberVO ;	
		
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value="/trainer/trainer.do" ,method = RequestMethod.GET)
	public ModelAndView trainer(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//String viewName = getViewName(request);
		String viewName = (String)request.getAttribute("viewName");
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);  //조회한 회원 정보를 modelandview의 addObject메소드를 이용해 바인딩 합니다
		return mav;
	}
	
	
	@RequestMapping(value = "/trainer/save.do", method = RequestMethod.POST)
	public String save(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		Map<String,Object> trainMap = new HashMap<String, Object>();
		Enumeration enu = request.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();    // parameter들을 가져
			String value = request.getParameter(name); // 가져온 parameter들의 value를 넣어준다.
			trainMap.put(name, value);                  // parameter에 해당하는 value를 trainMap에 넣음 >>>>> python dictionary 구조!!
		}
		HttpSession session = request.getSession();    // session가져
		MemberVO memberVO = (MemberVO) session.getAttribute("member"); // member 객체를 가져왓 memberVO에 넣어준다.
		String id = memberVO.getId();  // 왜 자꾸 static을 요구하는지...?
		trainMap.put("id", id);
		//trainMap.put("count", request.getParameter((String)enu.nextElement()));
		
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		int trainList = trainerService.checkCount(id);
		if (trainList == 1) {
			trainerService.plusCount(trainMap);
		    return "redirect:/main.do";
		}
		else {
			trainerService.insertCount(trainMap);
		    return "redirect:/main.do";
		}
//		try {//count gotj 0
//			List trainList = trainerService.checkCount(id);  // trainMap의 id를 받아 확인한다.
//						
//			trainerService.plusCount(trainMap);              // try catch로 에러가 없다면(id가 있다면) 지금 가진 count값에 새로운 count값 추
//			message = "<script>";                            // 저장완료라고 알림뜨고 main.do
//			message += "alert('저장완료 case1');";
//			message += " location.href='" + request.getContextPath()+"/main.do';";
//			message += "</script>";
//		}
//		catch(Exception e) {
//			trainerService.plusCount(trainMap);            // (id가 없다면) trainMap의 id와 count를 DB에 넣는다.
//			message = "<script>";							 // 저장완료라고 알림뜨고 main.do
//			message += "alert('저장완료 case2');";
//			message += " location.href='" + request.getContextPath()+"/main.do';";
//			message += "</script>";
		
	}
}
