package ex02;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;

public class WelcomeBodyTag extends SimpleTagSupport{

	@Override
	public void doTag() throws JspException, IOException{
		// jsp �������� ���ؽ�Ʈ ���� ��ȯ
		JspContext context = getJspContext();
		
		// ���ؽ�Ʈ ��ü���� jsp �������� ��� ��ü ��ȯ
		JspWriter out = context.getOut();
		
		// jsp ������ �߿��� body �κ� ����
		JspFragment body = getJspBody();
		
		out.println("HI Custom Tag! <br/>");
		
		// body �κп� StringWriter ��ü (��� ��Ʈ��)
		StringWriter strw = new StringWriter();
		body.invoke(strw); 
		// ��� ��Ʈ���� ����
		// body �κ� ���ڿ� ������ ��
		String str = strw.toString();
		
		out.println(str);
	}
	
}
