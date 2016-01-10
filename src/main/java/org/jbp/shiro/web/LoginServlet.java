package org.jbp.shiro.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
@SuppressWarnings("serial")
@WebServlet(name="loginServlet",urlPatterns="/login")
public class LoginServlet extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("LoginServlet.doGet();");
		req.getRequestDispatcher("/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		System.out.println("LoginServlet.doPost();");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		UsernamePasswordToken token = new UsernamePasswordToken(username, password);
		String msg = "";
		Subject subject =SecurityUtils.getSubject();
		try {
			subject.login(token);
		}catch(UnknownAccountException e){
			msg = "用户名出错！";
		}catch(IncorrectCredentialsException e) {
			msg = "密码出错！";
		}catch(AuthenticationException e) {
			msg = "其他认证错误！";
		}
		req.setAttribute("msg", msg);
		if(!"".equals(msg)) {
			req.getRequestDispatcher("/login.jsp").forward(req, resp);
			return;
		}
		msg = "认证通过！";
		req.setAttribute("msg", msg);
		req.setAttribute("subject", subject);
		req.getRequestDispatcher("/WEB-INF/jsp/index.jsp").forward(req, resp);
	}
}
