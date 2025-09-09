package controller;

import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.IOException;

public class Ping extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp)
      throws ServletException, IOException {
    resp.setContentType("text/plain; charset=UTF-8");
    resp.getWriter().println("OK ctx=" + req.getContextPath());
  }
}