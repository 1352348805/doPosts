package com.doposts.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ConfigManager {
	
	public static String getProperty(String keyString) {
		String value = "";
		Properties params = new Properties();
		String  configFile = "database.properties";
		InputStream is = ConfigManager.class.getClassLoader().getResourceAsStream(configFile);
		try {
			params.load(is);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		value = params.getProperty(keyString);
		return value;
	}

}
