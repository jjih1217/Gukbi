<!-- memberFile/sujungProc.jsp -->
<%@page import="java.io.FileWriter"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	String msg = "";
	msg += id + ",";
	msg += passwd + ",";
	msg += name + ",";
	msg += phone + ",";
	msg += email + ",";
	msg += address;
	
	String attachPath = "C:/jih/attach";
	String uploadPath = attachPath + request.getContextPath();
	String uploadFile = uploadPath + "/member.txt";
	
	String newMsg = "";
	try {
		java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()) {
			String data = sReader.nextLine();
			
			int loc = data.indexOf(",");
			String imsi_id = data.substring(0,loc);
			
			if(id.equals(imsi_id)) {
				newMsg += msg;
			} else {
				newMsg += data;
			}
			newMsg += "\n";
		}
			
	} catch (Exception e ) {
		//e.printStackTrace();
	}
	
	
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
		out.println("alert('정상적으로 수정되었습니다.');");
		out.println("location.href='view.jsp?id=" + id + "';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 중 오류가 발생했습니다.');");
		out.println("location.href='sujung.jsp?id=" + id + "';");
		out.println("</script>");
	}

%>
