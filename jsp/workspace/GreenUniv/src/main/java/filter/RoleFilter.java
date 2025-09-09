package filter;

import java.io.IOException;

import dto.UserDTO;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter(urlPatterns = {"/user_role/*"})
public class RoleFilter implements Filter {
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
		throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		HttpSession session = req.getSession(false);
		UserDTO user = (session == null) ? null : (UserDTO) session.getAttribute("loginUser");
		if (user == null) {
			resp.sendRedirect(req.getContextPath() + "/user/login.do?code=ROLE_NOT_ENOUGH");
			return;
		}
		chain.doFilter(request, response);
	}
}
