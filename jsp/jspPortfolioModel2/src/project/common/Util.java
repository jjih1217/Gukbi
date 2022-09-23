package project.common;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

public class Util {
	
	public String[] getServerInfo(HttpServletRequest request) throws UnknownHostException {
		String referer = request.getHeader("REFERER");
		if(referer == null || referer.trim().equals("")) {
			referer = "";
		}
		
		String path = request.getContextPath();          //  /jspPortfolioModel2
		String url = request.getRequestURL().toString(); //  http://localhost:8090/jspPortfolioModel2/member_servlet/member_chuga.do
		String uri = request.getRequestURI().toString(); //  /jspPortfolioModel2/member_servlet/member_chuga.do
		String ip = Inet4Address.getLocalHost().getHostAddress();
		
		String ip6 = request.getHeader("X-Forwarded-For");  
        if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {  
        	ip6 = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {  
        	ip6 = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {  
        	ip6 = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {  
        	ip6 = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip6 == null || ip6.length() == 0 || "unknown".equalsIgnoreCase(ip6)) {  
        	ip6 = request.getRemoteAddr();  
        }

        String[] imsiUriArray = uri.split("/"); // [ _ , jspPortfolioModel2 , member_servlet , member_chuga.do ]
		String imsiUrlFileName = imsiUriArray[imsiUriArray.length - 1]; // 4-1 member_chuga.do
		
		if(path.equals("/"+ imsiUrlFileName)) {
			imsiUrlFileName = "dashBoard_index.do";
		}
		
		imsiUrlFileName = imsiUrlFileName.replace(".do", ""); // member_chuga
		
		String[] imsiArray = imsiUrlFileName.split("_");
		String folderName = imsiArray[0];
		String fileName = imsiArray[1];
		
		/*
		String folderName = "";
		String fileName = "";
		if (!imsiUrlFileName.equals(path.substring(1))) {
			String[] imsiArray = imsiUrlFileName.split("_");
			folderName = imsiArray[0];
			fileName = imsiArray[1];
		}
		*/
		
		String[] array = new String[8];
		array[0] = referer;
		array[1] = path;
		array[2] = url; 
		array[3] = uri; 
		array[4] = ip;
		array[5] = ip6;
		array[6] = folderName;
		array[7] = fileName;
	
		return array;
	}
	
	public String getCheckString(String str) {
		String result = "";
		result = str;
		result = result.replace(">","&gt;");
		result = result.replace("<","&lt;");
		result = result.replace("\"","&quot;");
		result = result.replace("'","&apos;");
		return result;
	}
	
	
	public int getNumberCheck(String str, int defaultStr) {
		int result = 0;
		
		String temp = str;
		if(temp == null || temp.trim().equals("")) {
			temp = "-";
		} 
		
		for(int i=0; i<=9; i++) {
			temp = temp.replace(i + "", "");
		}
		
		/*
		try {
			Double.parseDouble(str);
		} catch (Exception e) {
			return Integer.parseInt(imsiDefaultNumber);
		}
		*/
		
		if(temp.equals("")) { // only 숫자
			result = Integer.parseInt(str);
		} else {
			result = defaultStr;
		}
		
		return result;
	}
	
	public String getNullBlankCheck(String str) {
		String result = str;
		if(result == null || result.trim().equals("")) {
			result = "";
		}
		return result;
	}
	
	public int[] getCalandar() {
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		
		int[] result = new int[6];
		result[0] = year;
		result[1] = month;
		result[2] = day;
		result[3] = hour;
		result[4] = minute;
		result[5] = second;
		
		return result;
	}
	
	public String getDateTime() {
		
		int[] intResult = getCalandar();
		String result = "";
		
		result += intResult[0]; // 년
		
		int imsi = 0;
		for(int i=1; i<intResult.length; i++) {
			imsi = intResult[i];
			
			if(imsi < 10) {
				result += "0" + imsi;
			} else {
				result += imsi;
			}
		}
		
		return result;
	}
	public String createUuid(){
		return UUID.randomUUID().toString();
	}
	
	public Map<String, Integer> getPagerMap(int pageNumber, int pageSize, int blockSize, int totalRecord) {
		
		int jj = totalRecord - pageSize * (pageNumber - 1);
		int startRecord = pageSize * (pageNumber - 1) + 1;
		int lastRecord = pageSize * pageNumber;
		if(lastRecord > totalRecord) {
			lastRecord = totalRecord;
		}
		
		int totalPage = 0;
		int startPage = 1;
		int lastPage = 1;
		if(totalRecord > 0) {
			totalPage = totalRecord / pageSize + (totalRecord % pageSize == 0 ? 0 : 1);
			startPage = (pageNumber / blockSize - (pageNumber % blockSize != 0 ? 0 : 1)) * blockSize + 1;
			lastPage = startPage + blockSize - 1;
			if(lastPage > totalPage) {
				lastPage = totalPage;
			}
			
		} 
		
		Map<String,Integer> map = new HashMap<>();
		map.put("jj", jj);
		map.put("startRecord", startRecord);
		map.put("lastRecord", lastRecord);
		map.put("totalPage", totalPage);
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);
		

		return map;
	}
}
