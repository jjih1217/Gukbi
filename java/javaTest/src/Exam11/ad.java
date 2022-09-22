package Exam11;

public class ad {
	String uri = "/jspPortfolioModel2/";
	String[] imsiUriArray = uri.split("/");
	System.out.println("imsiUriArray : " + imsiUriArray);
	
	String imsiUrlFileName = imsiUriArray[imsiUriArray.length - 1];
	
	System.out.println("imsiUriArray.length : " + imsiUriArray.length);
	System.out.println("imsiUrlFileName: " + imsiUrlFileName);
	
	//imsiUrlFileName = imsiUrlFileName.replace(".do", "");
	
}
