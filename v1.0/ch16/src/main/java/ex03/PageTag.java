package ex03;

import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import javax.servlet.jsp.*;

public class PageTag extends SimpleTagSupport {
	
	// tag �Ӽ����� ����
	private int from; // ���� ������
	private int to; // �� ������
	
	// setter, getter
	public int getFrom() {
		return from;
	}
	public void setFrom(int from) {
		this.from = from;
	}
	public int getTo() {
		return to;
	}
	public void setTo(int to) {
		this.to = to;
	}


	@Override
	public void doTag() 
			throws JspException, IOException{
//		int start = from;
//		int end = to;
//		
		JspWriter out = getJspContext().getOut();
		out.println("Paging Test <br/>");
		for(int i = from; i <= to; i ++) {
			out.print("<a href=./03_pageTag.jsp?"
					+"nowPage=" + i + ">");
			out.println("[" + i + "]");
			out.println("</a> &nbsp;");
		}
	}
}
