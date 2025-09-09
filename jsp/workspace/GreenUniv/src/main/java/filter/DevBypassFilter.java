// DevBypassFilter.java
package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

//  프로젝트의 실제 DTO 패키지로 임포트
import dto.UserDTO;

public class DevBypassFilter implements Filter {
  @Override
  public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
      throws IOException, ServletException {

    HttpServletRequest r = (HttpServletRequest) req;
    HttpSession session = r.getSession();
    String ctx = r.getContextPath();
    String uri = r.getRequestURI().substring(ctx.length());

    boolean devOpen = uri.startsWith("/professor/")
                   || uri.startsWith("/student/")
                   || uri.startsWith("/department/");

    if (devOpen && session.getAttribute("loginUser") == null) {
      // 빈 UserDTO면 충분 (세터 없어도 됨)
      session.setAttribute("loginUser", new UserDTO());
    }
    chain.doFilter(req, res);
  }
}
