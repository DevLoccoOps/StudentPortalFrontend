package www.experianassessment.co.za.controller.session;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ExpiredSessionController {

	@RequestMapping(value = "/session/expired", method = RequestMethod.GET)
	public String getExpiredSessionPage(ModelMap model) {
		return "expired";
	}
}
