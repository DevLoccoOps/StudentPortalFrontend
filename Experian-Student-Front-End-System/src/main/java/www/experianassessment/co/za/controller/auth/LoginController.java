package www.experianassessment.co.za.controller.auth;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import www.experianassessment.co.za.config.util.AlertMessageHelper;
import www.experianassessment.co.za.config.util.AlertMessageHelper.AlertTypeEnum;
import www.experianassessment.co.za.form.LoginForm;

@Controller
public class LoginController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(LoginController.class);

	@GetMapping("/login")
	public ModelAndView loginPage(@RequestParam(value = "error", required = false) String error) {

		List<String> errorMessages = new ArrayList<>();
		ModelAndView mav = new ModelAndView("login");
		AlertMessageHelper alertMessages = new AlertMessageHelper(mav);

		if (error != null && error.equals("true")) {

			errorMessages.add("Invalid credentials");
		}

		mav.addObject("loginForm", new LoginForm());
		alertMessages.addMessage(AlertTypeEnum.WARNING, errorMessages);

		return mav;

	}
	
	@PostMapping("/login")
	public ModelAndView submitLogin(@Valid LoginForm loginForm, Principal principal) {

		ModelAndView mav = new ModelAndView("login");

		mav.addObject("loginForm", new LoginForm());
		try {

			return new ModelAndView("redirect:/home");
		} catch (Exception e) {

		}

		return mav;
	}

}
