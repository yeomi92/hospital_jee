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
		if(pageNO==null){
			command=factory.createCommand(directory, action, page);
		}else{
			command=factory.createCommand(directory, action, page,pageNO);
		}
	}
}
