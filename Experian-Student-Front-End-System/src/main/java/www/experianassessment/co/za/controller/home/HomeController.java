package www.experianassessment.co.za.controller.home;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import www.experianassessment.co.za.config.util.AlertMessageHelper;
import www.experianassessment.co.za.config.util.AlertMessageHelper.AlertTypeEnum;

@Controller
public class HomeController {

	private static final Logger LOGGER = LoggerFactory.getLogger(HomeController.class);

	@GetMapping(value = "/home")
	public ModelAndView getAdminHomePage(ModelMap model, Principal principal, HttpServletRequest httpServletRequest) {

		ModelAndView mav = new ModelAndView("admin-dashboard");
		AlertMessageHelper alertMessages = new AlertMessageHelper(mav);

		try {

			return mav;

		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			alertMessages.addMessage(AlertTypeEnum.ERROR, "Error accessing the page");
			return new ModelAndView("redirect:/login");
		}

	}

}
