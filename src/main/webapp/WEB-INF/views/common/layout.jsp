<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <style>
      #container {
        width: auto;
        margin: 0px auto;
        text-align:center;
        border: 0px solid #bcbcbc;
      }
      #header {
        padding: 5px;
        margin-bottom: 5px;
        border: 0px solid #bcbcbc;
        background-color: gray;
       	font-size: 15px;
       	text-align:center;
       	height:44px;
       	width: auto;
      }
      .head > div{
      	float:left;
      	margin: 0 10px;
      }
      .main-menu, .sub-menu{
      	list-style-type:none;
      	margin:0;
      	padding:0;
      }
      .main-menu > li{
      	float:left;
      }
      .main-menu > li > a{
      	font-size: 10px;
	  	color: rgba(255,255,255,0.85);
	  	text-align: center;
	  	text-decoration: none;
	  	letter-spacing: 0.05em;
	  	display: block;
	  	padding: 14px 36px;
	  	border-right: 1px solid rgba(0,0,0,0.15);
	  	text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
      } 
      .main-menu > li:nth-child(1) > a{
      	border-left: 1px solid rgba(0, 0, 0, 0, 15);
      }
      .main-menu > li:hover .sub-menu{
      	opacity:1;
      	visibility: visible;
      }
      .sub-menu{
      	position:absolute;
      	background:#757575;
      	opacity: 0;
      	visibility: hidden;
      }
      .sub-menu > li{
      	padding: 16px 28px;
      	border-bottom: 1px solid gray;
      }
      .sub-menu > li > a{
      	color: rgba(255, 255, 255, 0, 6);
      	text-decoration:none;
      }
      .login > a{
      	font-size: 0.85rem;
      	color: rgba(255,255,255,0.85);
      	text-ecoration:none;
      	text-align: center;
      	letter-spacing: 0.053m;
      	text-shadow: 1px 1px 1px rgba(0,0,0,0.2);
      }
      #content {
      	height:800px;
        padding: 5px;
        margin-right: 5px;
        float: center;
        border: 0px solid #bcbcbc;
        background-color: #575757;
      }
      .bodyContent{
      	widht:650px;
      }
      #content > h1{
      	text-align:center;
      }
      .Announcement{
      	padding: 10px;
      	border:10px;
      }
      #footer {
        clear: both;
        padding: 5px;
        border: 0px solid #bcbcbc;
         background-color: lightblue;
      }
      
    </style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body>
    <div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      <%-- <div id="menu">
          <tiles:insertAttribute name="side"/> 
      </div> --%>
      <div id="content">
          <tiles:insertAttribute name="body"/>
      </div>
      <div id="footer">
          <tiles:insertAttribute name="footer"/>
      </div>
    </div>
  </body>
</html>