<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>

<html>
<head>
 <style>
   .no-underline{
      text-decoration:none;
   }
 </style>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
</head>
<body>
	<nav>
		<ul>
			<li><a href="${contextPath}/trainer/trainer.do"  class="no-underline">운동시작</a></li>
			<li><a href="${contextPath}/board/listArticles.do"  class="no-underline">운동기록</a></li>
			<li><a href="" class="no-underline">식단관리</a></li>
		</ul>
	</nav>
</body>
</html>