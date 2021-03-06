package factory;

import command.Command;
import command.ListCommand;
import command.MoveCommand;

public class CommandFactory {
	public Command createCommand(String directory,String action,String page){
		Command command=new MoveCommand(directory, action, page);
		return command;
	}
	public Command createCommand(String directory,String action,String page,String pageNO){
		Command command=null;
		switch (action) {
		case "list":
			command=new ListCommand(directory, action, page, pageNO);
			break;
		default:
			break;
		}
		return command;
	}
}
