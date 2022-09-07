<!-- memberFile/sakjeProc.jsp -->
<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	
	String attachPath = "C:/jih/attach";
	String uploadPath = attachPath + request.getContextPath();
	String uploadFile = uploadPath + "/member.txt";
	
	//불러오기
	String newMsg = "";
	try {
		java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()) {
			String data = sReader.nextLine();
			
			int loc = data.indexOf(",");
			String imsi_id = data.substring(0,loc);
			
			if(id.equals(imsi_id)) {
				
			} else {
				newMsg += data + "\n";
			}
		}
		sReader.close();	
	} catch (Exception e ) {
		//e.printStackTrace();
	}
	
	// overwrite
	int result = 0;
	try {
		FileWriter fw = new FileWriter(uploadFile);
		fw.write(newMsg);
		fw.close();
		result++;
	} catch (Exception e ) {
		//e.printStackTrace();
	}
	
	if(result > 0) {
		out.println("<script>");
		out.println("alert('정상적으로 삭제되었습니다.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('삭제 중 오류가 발생했습니다.');");
		out.println("location.href='view.jsp??id=" + id + "';");
		out.println("</script>");
	}

%>
