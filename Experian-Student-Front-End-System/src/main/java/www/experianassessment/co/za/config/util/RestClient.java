package www.experianassessment.co.za.config.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

import com.google.gson.Gson;

public class  RestClient<T, K> {

	private T responseObj;
	private K requestObj;
	private int statusCode;
	private String json;

	/**
	 * 
	 * @param api
	 * @param requestObject
	 * @param returnClass
	 * @return
	 */
	public T Post(String api, String username, String password, K requestObject, Class<T> returnClass)
			throws Exception {

		Gson gson = new Gson();

		try {

			URL url = new URL(api);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setDoOutput(true);
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-Type", "application/json");

			String encoded = Base64.getEncoder()
					.encodeToString((username + ":" + password).getBytes(StandardCharsets.UTF_8));
			conn.setRequestProperty("Authorization", "Basic " + encoded);

			String input = gson.toJson(requestObject);

			OutputStream os = conn.getOutputStream();
			os.write(input.getBytes());
			os.flush();

			setStatusCode(conn.getResponseCode());

			if (conn.getResponseCode() < 200 && conn.getResponseCode() >= 300) {
				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			String output;

			while ((output = br.readLine()) != null) {
				responseObj = gson.fromJson(output, returnClass);
				setJson(output);
			}

			conn.disconnect();

		} catch (MalformedURLException e) {
			e.printStackTrace();
			throw e;
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		}

		return responseObj;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
	}

}
