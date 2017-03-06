package command;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class Command{
	@Getter@Setter
	protected String directory,action,page,pageNO,searchWord;
	@Getter
	private String view;
	protected Command() {
	}
	public Command(String directory,String action,String page){
		this.directory=directory;
		this.action=action;
		this.page=page;
		this.setView();
	}
	
	public void setView(){
		this.view=(this.directory.equals("/home")||this.action.equals("logout"))?"/WEB-INF/jsp/common/"+this.page+".jsp":"/WEB-INF/jsp"+this.directory+"/"+this.page+".jsp";
	}
}
