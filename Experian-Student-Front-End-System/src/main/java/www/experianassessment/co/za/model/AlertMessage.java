package www.experianassessment.co.za.model;

import java.io.Serializable;

public class AlertMessage implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String cssClass;
	private String prefix;
	private String message;

	public AlertMessage() {
	}

	public AlertMessage(String cssClass, String prefix, String message) {
		super();
		this.cssClass = cssClass;
		this.prefix = prefix;
		this.message = message;
	}

	public String getCssClass() {
		return cssClass;
	}

	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	public String getPrefix() {
		return prefix;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
