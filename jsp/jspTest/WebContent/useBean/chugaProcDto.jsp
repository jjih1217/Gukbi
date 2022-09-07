<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="testUseBean.BossDTO"%>  
  
<%
	request.setCharacterEncoding("UTF-8");
	String boss_1 = request.getParameter("boss_1");
	String boss_2 = request.getParameter("boss_2");
	String boss_3 = request.getParameter("boss_3");
	
	BossDTO bossDto = new BossDTO();
	bossDto.setBoss_1(boss_1);
	bossDto.setBoss_2(boss_2);
	bossDto.setBoss_3(boss_3);
	
	out.println("boss_1: " + boss_1);
	out.println("boss_2: " + boss_2);
	out.println("boss_3: " + boss_3);
	
	out.println("<br>");
	
	out.println("boss_1: " + bossDto.getBoss_1());
	out.println("boss_2: " + bossDto.getBoss_2());
	out.println("boss_3: " + bossDto.getBoss_3());
%>