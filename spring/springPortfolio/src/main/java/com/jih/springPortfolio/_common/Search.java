package com.jih.springPortfolio._common;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

public class Search {
		Util util = new Util();
		public String getSerchInfo(int pageNumber, String searchGubun, String searchData) throws UnsupportedEncodingException  {
		
			String imsiSearchYN = "O";
			searchGubun = util.getNullBlankCheck(searchGubun);
			searchData = util.getNullBlankCheck(searchData);
			if(searchGubun.equals("") || searchData.equals("")) {
				imsiSearchYN = "X";
				searchGubun = "";
				searchData = "";
			}
			
			searchGubun = URLDecoder.decode(searchGubun,"UTF-8");
			searchData = URLDecoder.decode(searchData,"UTF-8");
			
			String searchQuery = "";
			if(imsiSearchYN.equals("O")) {
				String imsiSerchGubun = URLEncoder.encode(searchGubun,"UTF-8");
				String imsiSerchData = URLEncoder.encode(searchData,"UTF-8");
				searchQuery = "pageNumber=" + pageNumber + "&searchGubun=" + imsiSerchGubun + "&searchData=" + imsiSerchData;
			}
			
		return searchQuery;
	}
}
