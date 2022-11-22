package www.experianassessment.co.za.form;

import java.io.Serializable;

public class EditForm implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long studentId;
	private String studentNumber;
	private String firstName;
	private String lastName;
	private Long cellNumber;
	private int countryCode;
	private String dob;
	private String emailAddress;
	private int currentScore;
	private int averageScore;
	public Long getStudentId() {
		return studentId;
	}
	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}
	public String getStudentNumber() {
		return studentNumber;
	}
	public void setStudentNumber(String studentNumber) {
		this.studentNumber = studentNumber;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public int getCurrentScore() {
		return currentScore;
	}
	public void setCurrentScore(int currentScore) {
		this.currentScore = currentScore;
	}
	public int getAverageScore() {
		return averageScore;
	}
	public void setAverageScore(int averageScore) {
		this.averageScore = averageScore;
	}
	public int getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(int countryCode) {
		this.countryCode = countryCode;
	}
	public Long getCellNumber() {
		return cellNumber;
	}
	public void setCellNumber(Long cellNumber) {
		this.cellNumber = cellNumber;
	}

	
	
	
	
}
