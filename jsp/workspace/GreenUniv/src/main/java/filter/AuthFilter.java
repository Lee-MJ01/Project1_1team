package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.Set;

public class AuthFilter implements Filter {

  private static final Set<String> OPEN_PREFIXES = Set.of(
      "/user/login.do",
      "/index.jsp", "/index.html", "/",
      "/css/", "/js/", "/images/", "/assets/",
      // 개발 중 무인증 접근 허용 페이지들:
      "/professor/", "/student/", "/department/"
  );

  private boolean isOpen(String uri) {
    if (uri == null || uri.isEmpty() || "/".equals(uri)) return true;
    for (String p : OPEN_PREFIXES) if (uri.startsWith(p)) return true;
    return false;
  }

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {

    HttpServletRequest req  = (HttpServletRequest) request;
    HttpServletResponse resp = (HttpServletResponse) response;

    String ctx = req.getContextPath();                // 예: /GreenUniv
    String uri = req.getRequestURI().substring(ctx.length()); // 예: /professor/write.do

    // 화이트리스트는 그냥 통과
    if (isOpen(uri)) {
      chain.doFilter(request, response);
      return;
    }

    HttpSession session = req.getSession(false);
    Object login = (session == null) ? null : session.getAttribute("loginUser");

    // 절대 캐스팅하지 말 것! (UserDTO로 캐스팅 금지)
    if (login == null) {
      resp.sendRedirect(ctx + "/user/login.do");
      return;
    }
    chain.doFilter(request, response);
  }
}
