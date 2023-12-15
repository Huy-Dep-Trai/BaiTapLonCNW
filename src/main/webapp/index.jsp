<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
  HttpSession httpSession = request.getSession();

  if(httpSession != null && httpSession.getAttribute("Authenticated") != null && (Boolean)httpSession.getAttribute("Authenticated") == true){
    response.sendRedirect("Home");
  }
  else{
    response.sendRedirect("Login");
  }
%>