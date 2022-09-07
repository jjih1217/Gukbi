package config;

public class Util {
	
	public int numberCheck(String str, int defaultNumber) {
		int result = defaultNumber;
		try {
			result = Integer.parseInt(str);
		} catch (Exception e) {
			//e.printStackTrace();
			result = defaultNumber;
		}
		return result;
	}
}
