package www.experianassessment.co.za.controller.enums;

import www.experianassessment.co.za.config.util.ConfigFileHelper;

public enum APIServices {

	API_REGISTER_STUDENT(new ConfigFileHelper().getBackendIPAdrress() + "/student/register"),
	API_GET_STUDENT_LIST(new ConfigFileHelper().getBackendIPAdrress() + "/student/getStudentsList"),
	API_SEARCH_BY(new ConfigFileHelper().getBackendIPAdrress() + "/student/searchStudent"),
	API_CAPTURE_LATEST_SCORE(new ConfigFileHelper().getBackendIPAdrress() + "/student/captureScore"),
	API_GET_STUDENT_INFO(new ConfigFileHelper().getBackendIPAdrress() + "/student/getStudentInfo"),
	API_UPDATE_STUDENT(new ConfigFileHelper().getBackendIPAdrress() + "/student/updateStudentInfo")
	;

	private String text;

	private APIServices(final String text) {
		this.text = text;
	}

	@Override
	public String toString() {
		return text;
	}

}
