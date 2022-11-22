package www.experianassessment.co.za.config.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import www.experianassessment.co.za.model.AlertMessage;

public class AlertMessageHelper {

	/**
	 * 
	 */

	public enum AlertTypeEnum {

		ERROR("alert alert-danger", "Error!"), WARNING("alert alert-warning", "Warning!"),
		INFO("alert alert-info", "Info!");

		private String cssClass;
		private String prefix;

		AlertTypeEnum(String cssClass, String prefix) {
			this.cssClass = cssClass;
			this.prefix = prefix;
		}

		public String getCssClass() {
			return cssClass;
		}

		public String getPrefix() {
			return prefix;
		}

	}

	private List<AlertMessage> messages = new ArrayList<>();

	private ModelAndView mav;

	public AlertMessageHelper(ModelAndView mav) {
		this.mav = mav;
		this.mav.addObject("alertMessages", messages);
	}

	public void addMessage(AlertTypeEnum type, String message) {
		if (message != null && !message.isEmpty()) {
			AlertMessage alert = new AlertMessage();
			alert.setCssClass(type.getCssClass());
			alert.setPrefix(type.getPrefix());
			alert.setMessage(message);

			messages.add(alert);
		}
	}

	public void addMessage(AlertTypeEnum type, List<String> messages) {
		messages.stream()
				.forEach(msg -> this.messages.add(new AlertMessage(type.getCssClass(), type.getPrefix(), msg)));

	}

	private List<AlertMessage> getMessages() {
		return messages;
	}
}
