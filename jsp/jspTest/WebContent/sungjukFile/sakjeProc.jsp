<!-- sungjukFile/sakjeProc.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "_inc_fileInfo.jsp"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");

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
				
			} else {
				newValue += imsi + "\n";
			}
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
	
	if(result >  0) {
		out.println("<script>");
		out.println("alert('정상적으로 삭제되었습니다.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('삭제 중 오류가 발생했습니다.');");
		out.println("location.href='view.jsp?name=" + name + "';");
		out.println("</script>");
	}
	
%>