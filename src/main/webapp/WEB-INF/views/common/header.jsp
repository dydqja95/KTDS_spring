<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<script>
	function fn_articleForm(isLogOn,loginForm){
	  if(isLogOn == '' || isLogOn == 'false'){
		  location.href=loginForm+'?action=/board/articleForm.do'; 
	  }
	}
</script>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
<title>헤더</title>
</head>
<body>
<div border=0>
  <div class="head">
     <div class="logo">
		<a href="${contextPath}/main.do">
			<img src="${contextPath}/resources/image/logo.png" style="width:100px;height:44px;" />
		</a>
     </div>
	<div role="navigation">
		<ul class="main-menu">
			<li><a href="#">운동시작</a>
				<ul class="sub-menu">
					<li>
					<%-- <a  class="cls1"  href="javascript:fn_articleForm('${isLogOn}','${contextPath}/board/articleForm.do', 
                                                    '${contextPath}/member/loginForm.do')"><p class="cls2">글쓰기</p></a> --%>
					<a href="${contextPath}/trainer/trainer.do" aria-label="subemnu">운동1</a>
					</li>
					<li><a href="${contextPath}/trainer/pushUp" aria-label="subemnu" class="no-underline">운동2</a></li>
					<li><a href="#" aria-label="subemnu" class="no-underline">운동3</a></li>
					<li><a href="#" aria-label="subemnu" class="no-underline">운동4</a></li>
				</ul>
			</li>
				
			<li><a href="#">운동기록</a>
			</li>
			<li><a href="#">식단관리</a>
				<ul class="sub-menu">
					<li><a href="#" aria-label="subemnu" class="no-underline">추천식단</a></li>
					<li><a href="#" aria-label="subemnu" class="no-underline">식단짜기</a></li>
				</ul>
			</li>
			<li><a href="#">자유게시판</a></li>
			<li><a href="#">건의사항</a></li>
			<li>
				<c:choose>
          			<c:when test="${isLogOn == true  && member!= null}">
            			<!-- <h3>환영합니다. ${member.id }님!</h3>  -->
            			<a href="${contextPath}/member/logout.do">로그아웃</a>
          			</c:when>
          			<c:otherwise>
	        			<a href="${contextPath}/member/loginForm.do">로그인</a>
	      			</c:otherwise>
	   			</c:choose>
			</li>
		</ul>
	</div>
  </div>
</div>


</body>
</html>