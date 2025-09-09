package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginCheckFilter implements Filter {

  private static final String[] WHITE = {
      "/", "/index.jsp",
      "/user/login.do", "/user/logout.do",
      "/css/", "/js/", "/images/", "/assets/",
      "/professor/", "/student/", "/department/"
  };

  @Override
  public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
      throws IOException, ServletException {
    HttpServletRequest r = (HttpServletRequest) req;
    HttpServletResponse resp = (HttpServletResponse) res;
    HttpSession session = r.getSession(false);
    String ctx = r.getContextPath();
    String uri = r.getRequestURI().substring(ctx.length());

    boolean white = false;
    for (String p : WHITE) {
      if (uri.startsWith(p)) { white = true; break; }
    }

    if (white || (session != null && session.getAttribute("loginUser") != null)) {
      chain.doFilter(req, res);
    } else {
      resp.sendRedirect(ctx + "/user/login.do");
    }
  }
}
