package greenuniv.filter;

import java.io.IOException;

import greenuniv.dto.UserDTO;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/professor/*", "/admin/*"})
public class AuthFilter implements Filter {
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
				throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		HttpSession session = req.getSession(false);
		UserDTO loginUser = (session == null) ? null : (UserDTO) session.getAttribute("loginUser");
		
		
		if(loginUser == null) {
			resp.sendRedirect(req.getContextPath() + "/user/login.do");
			return;
		}
		chain.doFilter(request, response);
	}
}
