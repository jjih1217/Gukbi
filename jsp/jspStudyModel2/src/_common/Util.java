package _common;

import java.util.Calendar;
import java.util.UUID;

public class Util {
	
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
		//System.out.println("현재 시각은 :  " + year + "년도 " + month + "월 " + day + "일 " + hour + "시 " +  minute + "분 " + second + "초 ");
		
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
}
