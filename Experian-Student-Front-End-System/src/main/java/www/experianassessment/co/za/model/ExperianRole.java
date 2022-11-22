package www.experianassessment.co.za.model;

import org.springframework.security.core.GrantedAuthority;

public class ExperianRole implements GrantedAuthority{


	/**
	 * 
	 */
	private static final long serialVersionUID = 3708704428286949285L;

	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthority() {
		return this.name;
	}
}