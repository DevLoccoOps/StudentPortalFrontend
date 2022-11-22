package www.experianassessment.co.za.config.util;

import java.util.LinkedHashMap;
import java.util.Map;

public class CommonUtils {
	
	public static Map<String, String> getCountryCodes() {
		Map<String, String> countryCodes = new LinkedHashMap<>();

		countryCodes.put("27", "+27");
	

		return countryCodes;
	}

}
