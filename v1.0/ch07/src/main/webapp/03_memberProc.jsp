
<!-- �����ϴ� �κ� (business logic) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% 
	request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="regBean" class="ex02.MemberBean"/>
<!-- beans (id, pwd, name, birthday, email) ���� -->
<jsp:setProperty name="regBean" property="*"/>
<!-- Member Beans�� ��� �ʵ� (id, name, pwd ,..)
	�� set�ϱ� ���� �Լ� ȣ��
	
	* �ڹٺ��� �ʵ尪 == input �±� name ��
	* ���� �ٸ��� �Ǹ� setter() ȣ�� X
	
	* input �±� name �� -> POST ����
	(id, pwd, repwd, birthday, email)
	* name=Sally
	* id=abc
	* pwd=12345678
	* repwd=12345678
	* email=qwer@naver.com
	
	* �ڹٺ��� �ʵ尪 ���� 
	(id, pwd, name, birthday, email)
	* setName(name)
	* setId(id)
	* setPwd(pwd)
	* setRepwd() (�Լ� ���� X, ȣ�� X)
	
	setId(����ڿ��� �Է¹��� id)
	setPwd(����ڿ��� �Է¹��� pwd)
	setName(����ڿ��� �Է¹��� name)
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������ Ȯ��</title>
</head>
<body>
<table width="80%"align="center" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
	<table width="90%" border="1" cellspacing="0" cellpadding="2"  align="center">
        <form name="regForm" method="post" action="memberInsert.jsp">
        <!-- memberInsert.jsp ���߿� DB ������ �����ؼ� ȸ������ ���� ���� �κ� -->
          <tr align="center"> 
            <td colspan="3"><font color="#FFFFFF"><b> 
              <jsp:getProperty name="regBean" property="name" />
              ȸ������ �ۼ��Ͻ� �����Դϴ�. Ȯ���� �ּ���</b></font></td>
          </tr>
          <tr> 
            <td width="24%">���̵�</td>
            <td width="41%"><jsp:getProperty name="regBean" property="id" /></td>
          </tr>
          <tr> 
            <td>�н�����</td>
            <td> <jsp:getProperty name="regBean" property="pwd" /></td>
          </tr>
          <tr> 
            <td>�̸�</td>
            <td> <jsp:getProperty name="regBean" property="name" /></td>
          </tr>
          <tr> 
            <td>�������</td>
            <td> <jsp:getProperty name="regBean" property="birthday" /></td>
          </tr>
          <tr>
            <td>�̸���</td>
            <td><jsp:getProperty name="regBean" property="email" /></td>
          </tr>
          <tr> 
            <td colspan="2" align="center"> 
             <input type="button" value="Ȯ�οϷ�"> &nbsp; 
			  <input type="button" value="�ٽþ���" onClick="history.back()"> 
			  <!-- �߸��� ������ ������ �ٽ� 02_member.jsp�� �̵��Ͽ� ȸ�������� �ٽ� �Է¹��� -->
            </td>
          </tr>
        </form>
      </table>
	  </td>
  </tr>
</table>
</body>
</html>