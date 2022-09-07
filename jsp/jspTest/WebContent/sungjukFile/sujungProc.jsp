<!-- sungjukFile/sujungProc.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "_inc_fileInfo.jsp"%> <!-- 변수공유 가능 -->
    
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String kor_ = request.getParameter("kor");
	String eng_ = request.getParameter("eng");
	String mat_ = request.getParameter("mat");
	String sci_ = request.getParameter("sci");
	String his_ = request.getParameter("his");
	
	String msg = name + "," + kor_ + "," + eng_ + "," + mat_ + "," + sci_ + "," + his_;
	
	//File은 하나만 수정할 수 없음
	//전체를 불러와서 overwrite
	
	//불러오기
	String newValue = ""; //바꿀 전체 값
	try {
		//java.io.file f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while (sReader.hasNextLine()) {
			String imsi = sReader.nextLine();
			
			String[] imsiArray = imsi.split(",");
			if(name.equals(imsiArray[0])) {
				newValue += msg; //newValue에 sujung에서 넘어온 값
			} else {
				newValue += imsi;
			}
			newValue += "\n";
		}
		sReader.close();
	} catch (Exception e) {
		//e.printStackTrace();
	}
	
	//out.println(newValue);
	
	// overwrite
	int result = 0;
	try {
		FileWriter fw = new FileWriter(uploadFile); //overwrite
		//FileWriter fw = new FileWriter(uploadFile, true); //append
		fw.write(newValue);
		fw.close();
		result++;
	} catch (Exception e) {
		//e.printStackTace();
		result = 0;
	}
	
	if(result > 0) {
		out.println("<script>");
		out.println("alert('정상적으로 수정되었습니다.');");
		out.println("location.href='view.jsp?name=" + name + "';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 중 오류가 발생했습니다.');");
		out.println("location.href='sujung.jsp?name=" + name + "';");
		out.println("</script>");
	}
	
%>