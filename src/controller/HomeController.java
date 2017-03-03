package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DispatcherServlet;
import util.Separator;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/home.do")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Separator.init(request, response);
		switch (Separator.command.getAction()) {
		case "move":DispatcherServlet.send(request, response);break;
		case "logout":
			session.invalidate();
			DispatcherServlet.send(request, response);
			break;
		default:break;
		}
	}
}
