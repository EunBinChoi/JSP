<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		pageContext.setAttribute("J", 31);
		pageContext.setAttribute("S", 8);
		pageContext.setAttribute("P", 22);
		// pageContext ����ҿ� ���� J, S, P ���� ����
		
		/*
		setAttribute(String, Object)
		int -> Integer Ÿ������ ��ȯ�Ǿ� ���� (���� �ڽ�, Auto Boxing)
		Integer -> int Ÿ������ ��ȯ�Ǿ� ���� (��ڽ�, UnBoxing)
		*/
%>
<html>
<head>
<title>Expression Language</title>
</head>
<body>
<h2>EL�� Operators</h2>
<b>J = ${J}, S = ${S}, P = ${P}</b><p/> 
<b>��� ������</b><hr width="250" align="left"/>
<!-- &#36;: ���������� $ ǥ���ϱ� ���� HTML Ư������ -->
&#36;{J + S} : ${J + S}<br/> 
&#36;{J - S} : ${J - S}<br/> 
&#36;{J * S} : ${J * S}<br/> 
&#36;{J / S} : ${J / S}<br/> 
&#36;{J % S} : ${J % S}<p/> 
&#36;{J / S} : ${J div S}<br/> 
&#36;{J % S} : ${J mod S}<p/> 

<b>�� ������</b><hr width="250" align="left"/>
&#36;{J < S} : ${J lt S}<br/> 
&#36;{J > S} : ${J gt S}<br/>
&#36;{S <= P} : ${S le P}<br/>
&#36;{S >= P} : ${S ge P}<br/>
&#36;{(10*10) == 100} : ${(10*10) eq 100}<br/> 
&#36;{(10*10) != 100} : ${(10*10) ne 100}<p/>
<!-- ��Ŭ������ ����� ���� ǥ�ð� ������ ���� ���� �ƴ� -->

&#36;{J < S} : ${J < S}<br/> 
&#36;{J > S} : ${J > S}<br/>
&#36;{S <= P} : ${S <= P}<br/>
&#36;{S >= P} : ${S >= P}<br/>
&#36;{(10*10) == 100} : ${(10*10) == 100}<br/> 
&#36;{(10*10) != 100} : ${(10*10) != 100}<p/>

<b>�� �� ���� ������</b><hr width="250" align="left"/>
&#36;{J > P && P < S} : ${J > P and P < S}<br/>
&#36;{J > P || P < S} : ${J > P or P < S}<br/>
&#36;{!(J == P)} : ${not(J == P)}<br/>
&#36;{J > P && P < S} : ${J > P && P < S}<br/>
&#36;{J > P || P < S} : ${J > P || P < S}<br/>
&#36;{!(J == P)} : ${!(J == P)}<br/>
&#36;{(J == S)? "����" : "�ٸ���" } : ${(J == S) ? "����" : "�ٸ���"}<p/> 
</body>
</html>