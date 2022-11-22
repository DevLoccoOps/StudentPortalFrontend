package www.experianassessment.co.za.config.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ConfigFileHelper {

	private static final Logger LOGGER = LoggerFactory.getLogger(ConfigFileHelper.class);

	public String getIPAdrress() {
		Properties prop = getProperties();
		String ip_address = prop.getProperty("ip_address");
		return ip_address;

	}

	public String getBackendIPAdrress() {
		Properties prop = getProperties();
		String ip_backend_address = prop.getProperty("ip_backend_address");

		return ip_backend_address;

	}

	private Properties getProperties() {
		Properties prop = new Properties();
		try {
			InputStream in = this.getClass().getClassLoader()
					.getResourceAsStream("application.properties");
			prop.load(in);

		} catch (IOException e) {
			LOGGER.error(e.getMessage());
		}

		return prop;

	}

}
