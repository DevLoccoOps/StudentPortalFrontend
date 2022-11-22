package www.experianassessment.co.za.controller.student;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import www.experianassessment.co.za.config.util.AlertMessageHelper;
import www.experianassessment.co.za.config.util.AlertMessageHelper.AlertTypeEnum;
import www.experianassessment.co.za.config.util.CommonUtils;
import www.experianassessment.co.za.config.util.RestClient;
import www.experianassessment.co.za.controller.enums.APIServices;
import www.experianassessment.co.za.controller.enums.StudentVariablesEnum;
import www.experianassessment.co.za.form.EditForm;
import www.experianassessment.co.za.form.RegisterForm;
import www.experianassessment.co.za.form.SearchForm;
import www.experianassessment.co.za.reply.StudentReply;
import www.experianassessment.co.za.request.model.StudentRequest;
import www.experianassessment.co.za.request.reply.model.StudentInfo;

@Controller
public class StudentController {

	private static final Logger LOGGER = LoggerFactory.getLogger(StudentController.class);

	@GetMapping(value = "/student/register")
	public ModelAndView getRegisterStudent(ModelMap model, Principal principal, HttpServletRequest httpServletRequest) {

		ModelAndView mav = new ModelAndView("register-student");
		AlertMessageHelper alertMessages = new AlertMessageHelper(mav);
		mav.addObject("registerForm", new RegisterForm());
		try {

			return mav;

		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			alertMessages.addMessage(AlertTypeEnum.ERROR, "Error accessing the page");
			return new ModelAndView("redirect:/home");
		}

	}

	@PostMapping(value = "/student/register")
	public ModelAndView postRegisterStudent(ModelMap model, Principal principal, @Valid RegisterForm registerForm) {

		ModelAndView mav = new ModelAndView("register-student");
		AlertMessageHelper alertMessages = new AlertMessageHelper(mav);

		try {

			StudentRequest studentRequest = new StudentRequest();
			StudentInfo studentInfo = new StudentInfo();
			studentInfo.setFirstName(registerForm.getFirstName());
			studentInfo.setLastName(registerForm.getLastName());
			studentInfo.setCellNumber(registerForm.getCountryCode() + registerForm.getCellNumber());
			studentInfo.setDob(registerForm.getDob());
			studentInfo.setEmailAddress(registerForm.getEmailAddress());
			studentInfo.setCurrentScore(registerForm.getCurrentScore());
			studentRequest.setStudentInfo(studentInfo);

			RestClient<StudentReply, StudentRequest> restClient = new RestClient<>();
			StudentReply reply = restClient.Post(APIServices.API_REGISTER_STUDENT.toString(), "", "", studentRequest,
					StudentReply.class);

			if (reply.isSuccess()) {

				return new ModelAndView("redirect:/student/search");

			} else {
				alertMessages.addMessage(AlertTypeEnum.ERROR, reply.getErrorMessage());
				alertMessages.addMessage(AlertTypeEnum.WARNING, reply.getWarningMessage());

				return mav;
			}
		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			alertMessages.addMessage(AlertTypeEnum.ERROR, "Error accessing the page");
			return mav;
		}

	}

	@GetMapping(value = "/student/search")
	public ModelAndView getSearchStudent(ModelMap model, Principal principal, HttpServletRequest httpServletRequest) {

		ModelAndView mav = new ModelAndView("search");
		AlertMessageHelper alertMessages = new AlertMessageHelper(mav);
		mav.addObject("searchForm", new SearchForm());
		try {

			StudentRequest studentRequest = new StudentRequest();
			RestClient<StudentReply, StudentRequest> restClient = new RestClient<>();
			StudentReply reply = restClient.Post(APIServices.API_GET_STUDENT_LIST.toString(), "", "", studentRequest,
					StudentReply.class);

			if (reply.isSuccess()) {

				mav.addObject("studentInfoList", reply.getStudentInfoList());

			} else {
				alertMessages.addMessage(AlertTypeEnum.ERROR, reply.getErrorMessage());
				alertMessages.addMessage(AlertTypeEnum.WARNING, reply.getWarningMessage());

			}

		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			alertMessages.addMessage(AlertTypeEnum.ERROR, "Error accessing the page");
			return new ModelAndView("redirect:/home");
		}

		return mav;
	}

	@PostMapping(value = "/student/search")
	public ModelAndView postSearchByStudent(ModelMap model, @Valid SearchForm searchForm, Principal principal,
			HttpServletRequest httpServletRequest) {

		ModelAndView mav = new ModelAndView("search");
		AlertMessageHelper alertMessages = new AlertMessageHelper(mav);
		mav.addObject("searchForm", new SearchForm());
		try {

			StudentRequest studentRequest = new StudentRequest();
			StudentInfo studentInfo = new StudentInfo();
			studentInfo.setStudentNumber(searchForm.getSearchCategory());
			LOGGER.info(searchForm.getSearchCategory());
			LOGGER.info(searchForm.getSearchType());
			studentInfo.setFirstName(searchForm.getSearchCategory());
			studentInfo.setLastName(searchForm.getSearchCategory());
			studentInfo.setEmailAddress(searchForm.getSearchCategory());
			studentRequest.setStudentInfo(studentInfo);
			studentRequest.setSearchType(searchForm.getSearchType());
			RestClient<StudentReply, StudentRequest> restClient = new RestClient<>();
			StudentReply reply = restClient.Post(APIServices.API_SEARCH_BY.toString(), "", "", studentRequest,
					StudentReply.class);

			if (reply.isSuccess()) {

				if (searchForm.getSearchType().equals(StudentVariablesEnum.TYPE_STUDENT_NUMBER.variableName())) {

					List<StudentInfo> studentInfoList = new ArrayList<>();
					studentInfoList.add(reply.getStudentInfo());

					mav.addObject("studentInfoList", studentInfoList);
					mav.addObject("searchForm", searchForm);
				} else {
					alertMessages.addMessage(AlertTypeEnum.ERROR, reply.getErrorMessage());
					alertMessages.addMessage(AlertTypeEnum.WARNING, reply.getWarningMessage());
					mav.addObject("studentInfoList", reply.getStudentInfoList());
				}

			}

			return mav;

		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			alertMessages.addMessage(AlertTypeEnum.ERROR, "Error accessing the page");
			return new ModelAndView("redirect:/home");
		}

	}

	@GetMapping(value = "/student/edit/{studentNumber}")
	public ModelAndView gettEditStudent(ModelMap model, @PathVariable("studentNumber") String studentNumber,
			@Valid SearchForm searchForm, Principal principal, HttpServletRequest httpServletRequest) {

		ModelAndView mav = new ModelAndView("edit-student");
		EditForm editForm = new EditForm();
		mav.addObject("editForm", editForm);
		AlertMessageHelper alertMessages = new AlertMessageHelper(mav);

		try {

			StudentRequest studentRequest = new StudentRequest();
			StudentInfo studentInfo = new StudentInfo();
			studentInfo.setStudentNumber(studentNumber);
			studentRequest.setStudentInfo(studentInfo);

			RestClient<StudentReply, StudentRequest> restClient = new RestClient<>();
			StudentReply reply = restClient.Post(APIServices.API_GET_STUDENT_INFO.toString(), "", "", studentRequest,
					StudentReply.class);

			if (reply.isSuccess()) {

				editForm.setFirstName(reply.getStudentInfo().getFirstName());
				editForm.setLastName(reply.getStudentInfo().getLastName());
				editForm.setEmailAddress(reply.getStudentInfo().getEmailAddress());
				editForm.setCellNumber(Long.valueOf(reply.getStudentInfo().getCellNumber()));
				editForm.setDob(reply.getStudentInfo().getDob());
				editForm.setStudentNumber(reply.getStudentInfo().getStudentNumber());
				editForm.setAverageScore(reply.getStudentInfo().getAverageScore());
				editForm.setCurrentScore(reply.getStudentInfo().getCurrentScore());
				mav.addObject("editForm", editForm);
				mav.addObject("studentInfo", reply.getStudentInfo());

				return mav;

			} else {
				alertMessages.addMessage(AlertTypeEnum.ERROR, reply.getErrorMessage());
				alertMessages.addMessage(AlertTypeEnum.WARNING, reply.getWarningMessage());
				mav.addObject("searchForm", searchForm);
			}

			return mav;

		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			alertMessages.addMessage(AlertTypeEnum.ERROR, "Error accessing the page");
			return new ModelAndView("redirect:/home");
		}

	}

	@PostMapping(value = "/student/edit/{studentNumber}")
	public ModelAndView postEditStudent(ModelMap model, @PathVariable("studentNumber") String studentNumber,
			@Valid SearchForm searchForm, Principal principal, HttpServletRequest httpServletRequest) {

		ModelAndView mav = new ModelAndView("edit-student");

		mav.addObject("editForm", searchForm);
		AlertMessageHelper alertMessages = new AlertMessageHelper(mav);

		try {

			StudentRequest studentRequest = new StudentRequest();
			StudentInfo studentInfo = new StudentInfo();
			studentInfo.setFirstName(searchForm.getFirstName());
			studentInfo.setLastName(searchForm.getLastName());
			studentInfo.setCellNumber(searchForm.getCountryCode() + searchForm.getCellNumber());
			studentInfo.setDob(searchForm.getDob());
			studentInfo.setEmailAddress(searchForm.getEmailAddress());
			studentInfo.setCurrentScore(searchForm.getCurrentScore());
			studentInfo.setStudentNumber(studentNumber);
			studentRequest.setStudentInfo(studentInfo);

			RestClient<StudentReply, StudentRequest> restClient = new RestClient<>();
			StudentReply reply = restClient.Post(APIServices.API_UPDATE_STUDENT.toString(), "", "", studentRequest,
					StudentReply.class);

			if (reply.isSuccess()) {

				return new ModelAndView("redirect:/student/search");

			} else {
				alertMessages.addMessage(AlertTypeEnum.ERROR, reply.getErrorMessage());
				alertMessages.addMessage(AlertTypeEnum.WARNING, reply.getWarningMessage());
			}

		} catch (Exception e) {
			LOGGER.error(e.getMessage());
			alertMessages.addMessage(AlertTypeEnum.ERROR, "Error accessing the page");
			return mav;

		}
		return mav;
	}

	@ModelAttribute("countryCodes")
	public Map<String, String> getCountryCodes() throws IOException {
		return CommonUtils.getCountryCodes();

	}
}
