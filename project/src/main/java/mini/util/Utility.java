package mini.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Utility {
	public static List<String> substrURL(String srcs){
		String srcPath;
		List<String> list = new ArrayList<>();
		
		while(srcs.length() != 0) {
			srcPath = srcs.contains(",")?srcs.substring(0, srcs.indexOf(',')):srcs.substring(0);
			list.add(srcPath);
			srcs = srcs.contains(",")?srcs.substring(srcPath.length() + 1):srcs.substring(srcPath.length());
		}
		
		return list;
	}
}
