package www.experianassessment.co.za.config.security;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Service;

import www.experianassessment.co.za.model.ExperianUser;

@Service
@Configurable
public class ExperianCustomAuthenticationProvider implements AuthenticationProvider {

	private static final Logger LOGGER = LoggerFactory.getLogger(ExperianCustomAuthenticationProvider.class);

	public ExperianCustomAuthenticationProvider() {
		super();
	}

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		try {

			final String username = authentication.getName().toLowerCase();
			final String password = authentication.getCredentials().toString();

			ExperianUser userInfo = new ExperianUser();
			userInfo.setUsername("lebohang");
			userInfo.setPassword("r0twts70");

			final List<GrantedAuthority> grantedAuths = new ArrayList<>();
			grantedAuths.add(new SimpleGrantedAuthority("ROLE_ADMIN"));

			if (username.equals(userInfo.getUsername())) {
				final Authentication auth = new UsernamePasswordAuthenticationToken(userInfo, userInfo.getPassword(),
						grantedAuths);
				return auth;
			}

			return null;

		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
