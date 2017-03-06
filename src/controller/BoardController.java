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
			String strPageNO=request.getParameter("pageNO");
			System.out.println("화면에서 넘어온 PAGE_NO :"+strPageNO);
			int rowCount=5;
			int pageNO=Integer.parseInt(strPageNO);
			int pageStart=(pageNO-1)*rowCount+1;
			int pageEnd=pageNO*rowCount;
			String[] pageArr={String.valueOf(pageStart),String.valueOf(pageEnd)};
			int count=0;
			try {
				list=service.boardList(pageArr);
				count = service.count();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			int pageCount=0;
			if(count%rowCount==0){
				pageCount=count/rowCount;
			}else{
				pageCount=count/rowCount+1;
			}
			int blockSize=5;
			int blockStart=pageNO-((pageNO-1)%blockSize);
			int prevBlock=blockStart-blockSize;
			int nextBlock=blockStart+blockSize;
			int blockEnd=0;
			if(blockStart+rowCount-1 < pageCount){
				blockEnd=blockStart+blockSize-1;
			}else{
				blockEnd=pageCount;
			}
			request.setAttribute("count", count);
			request.setAttribute("pageCount", pageCount);
			request.setAttribute("list", list);
			request.setAttribute("pageStart", pageStart);
			request.setAttribute("pageEnd", pageEnd);
			request.setAttribute("blockStart", blockStart);
			request.setAttribute("blockEnd", blockEnd);
			request.setAttribute("prevBlock", prevBlock);
			request.setAttribute("nextBlock", nextBlock);
			request.setAttribute("pageNO", pageNO);
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
