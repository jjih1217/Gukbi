package config;

public class Util {
	
	public String getNullBlankCheck(String str, String defaultStr) {
		String result = str;
		if(result == null || result.trim().equals("")) {
			result = defaultStr;
		}	
		return result;
	}
	
	public String getCheckString(String str) {
		String result = str;
		result = result.replace("&", "&amp;");
		result = result.replace("<", "&lt;");
		result = result.replace(">", "&gt;");
		result = result.replace("\"", "&quot;");
		result = result.replace("'", "&apos;");
		return result;
	}
}
