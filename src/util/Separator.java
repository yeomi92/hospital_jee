package util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.Command;
import factory.CommandFactory;

public class Separator {
	public static CommandFactory factory=new CommandFactory();
	public static Command command;
	public static void init(HttpServletRequest request, HttpServletResponse response){
		String path=request.getServletPath();
		String directory=path.substring(0,path.indexOf("."));
		String action=request.getParameter("action");
		String page=request.getParameter("page");
		String pageNO=request.getParameter("pageNO");
		System.out.println("separaor에서 pageNO: "+pageNO);
		if(pageNO==null){
			System.out.println("pageNO이 null 일때");
			command=factory.createCommand(directory, action, page);
			System.out.println("directory: "+directory);
			System.out.println("action: "+action);
			System.out.println("page: "+page);
		}else{
			System.out.println("pageNO있을때");
			command=factory.createCommand(directory, action, page,pageNO);
		}
	}
}
