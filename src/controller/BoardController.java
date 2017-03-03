package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.ArticleBean;
import service.BoardService;
import serviceImpl.BoardServiceImpl;
import java.util.*;
import util.DispatcherServlet;
import util.Separator;

@WebServlet("/board.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Separator.init(request, response);
		ArticleBean bean=new ArticleBean();
		List<ArticleBean> list=new ArrayList<ArticleBean>();
		BoardService service=BoardServiceImpl.getInstance();
		switch (Separator.command.getAction()) {
		case "move":DispatcherServlet.send(request, response);break;
		case "list":
			try {
				list=service.boardList();
				int rowCount=5;
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("count",list.size());
			request.setAttribute("list",list);
			DispatcherServlet.send(request, response);
			break;
		case "detail":
			System.out.println("seq: "+request.getParameter("seq"));
			bean.setSeq(request.getParameter("seq"));
			try {
				request.setAttribute("article", service.findBySeq(bean));
			} catch (Exception e) {
				e.printStackTrace();
			}
			DispatcherServlet.send(request, response);
		default:
			break;
		}
	}

}
