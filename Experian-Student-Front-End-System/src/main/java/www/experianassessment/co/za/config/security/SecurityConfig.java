package www.experianassessment.co.za.config.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.session.HttpSessionEventPublisher;

@Configuration
@EnableWebSecurity
@ComponentScan("www.experianassessment.co.za")
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private ExperianCustomAuthenticationProvider experianCustomAuthenticationProvider;

	public SecurityConfig() {
		super();
	}

	@Override
	protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(experianCustomAuthenticationProvider);
		auth.eraseCredentials(false);
	}

	@Override
	protected void configure(final HttpSecurity http) throws Exception {

		http.csrf().disable().authorizeRequests()

				.antMatchers("/home*").hasAnyAuthority("ROLE_ADMIN")
				.antMatchers("/login*").hasAnyAuthority("ROLE_ADMIN")
				.antMatchers("/*").hasAnyAuthority("ROLE_ADMIN")
				
				// Auth
				.antMatchers("/resources/**").permitAll().antMatchers("/anonymous*").anonymous()
				.antMatchers("/login*").permitAll().antMatchers("/register*").permitAll()
				.antMatchers("/forgot*").permitAll().antMatchers("/success").permitAll()

				.and().formLogin().loginPage("/login").loginProcessingUrl("/login")
				.successHandler(successHandler()).failureUrl("/login?error=true")

				.and().logout().logoutUrl("/logout").logoutSuccessUrl("/login?logout=true")
				.deleteCookies("JSESSIONID")

//				.and().logout().logoutUrl("/auth/404").deleteCookies("JSESSIONID")

				.and().rememberMe().key("uniqueAndSecret").tokenValiditySeconds(86400)

				.and().sessionManagement().sessionFixation().migrateSession()
				.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED).invalidSessionUrl("/login")
				.maximumSessions(15).maxSessionsPreventsLogin(false).sessionRegistry(sessionRegistry())
				.expiredUrl("/login");

	}

	@Bean
	public SessionRegistry sessionRegistry() {
		SessionRegistry sessionRegistry = new SessionRegistryImpl();
		return sessionRegistry;
	}

	@Bean
	public HttpSessionEventPublisher httpSessionEventPublisher() {
		return new HttpSessionEventPublisher();
	}

	private AuthenticationSuccessHandler successHandler() {
		return new ExperianSimpleUrlAuthenticationSuccessHandler();
	}

}
