package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.ArticleBean;
import handler.PageHandler;
import service.BoardService;
import serviceImpl.BoardServiceImpl;
import java.util.*;
import java.util.logging.Handler;

import util.DispatcherServlet;
import util.Pagination;
import util.Separator;

@WebServlet("/board.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Separator.init(request, response);
		ArticleBean bean=new ArticleBean();
		PageHandler handler=new PageHandler();
		List<ArticleBean> list=new ArrayList<ArticleBean>();
		BoardService service=BoardServiceImpl.getInstance();
		Pagination pg=new Pagination();
		Map<String, String>params=new HashMap<>();
		switch (Separator.command.getAction()){
		case "move":DispatcherServlet.send(request, response);break;
		case "list":
			params.put("pageNO", request.getParameter("pageNO"));
			params.put("count", String.valueOf(service.count()));
			handler.process(params);
			String[]arr={"count","pageCount","pageNO","pageStart","pageEnd","blockStart","blockEnd","prevBlock","nextBlock"};
			for(int i=0;i<9;i++){
				request.setAttribute(arr[i],handler.getAttribute()[i]);
			}
			String[] pageArr={String.valueOf(handler.getAttribute()[3]),String.valueOf(handler.getAttribute()[4])};
			System.out.println(pageArr[0]+"pageArr"+pageArr[1]);
			list=service.boardList(pageArr);
			request.setAttribute("list", list);
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
