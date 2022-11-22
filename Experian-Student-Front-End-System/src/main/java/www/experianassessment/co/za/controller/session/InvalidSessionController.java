package www.experianassessment.co.za.controller.session;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InvalidSessionController {
	@RequestMapping(value = "/session/invalid", method = RequestMethod.GET)
	public String getInvalidSessionPage(ModelMap model) {
		return "invalid";
	}
}

