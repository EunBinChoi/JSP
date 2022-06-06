<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page import = "java.util.Date" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<title>JSTL</title>
</head>
<body >
<h2>Formatting Tags</h2>
<!-- core �±� set���� ���� num ���� -->
<c:set var="num" value="123456789"/>

<!-- number Ÿ������ num�� ��� -->
���� : <fmt:formatNumber value="${num}" 
type="number"/><br/>

<!-- precent Ÿ������ num�� ���
���ڸ� ������ ',' (�޸�)�� ��뿩�θ� 
groupingUsed �Ӽ��� true/false ���� (�⺻�� true)  -->
�ۼ�Ʈ : <fmt:formatNumber value="${num}" 
type="percent" groupingUsed="true"/><br/>

<!-- currency (��ȭ) Ÿ������ num�� ���
��ȭ�� �ɺ��� $�� ���� -->
�޷� : <fmt:formatNumber value="${num}" 
type="currency" currencySymbol="$"/><br/>

<!-- ���� �ڸ��� �Ǽ� 4�ڸ��� ������ ���� (pattern)���� num�� ��� -->
���� : <fmt:formatNumber value="${num}" 
pattern="0.0000" groupingUsed="false"/><p/>

<!-- �Ǽ����� �����κи� �Ľ��Ͽ� ������ ����  -->
<fmt:parseNumber var="i" integerOnly="true" 
value="123.456"/>
�Ǽ��� ������ ���� : <c:out value="${i}"/>

<!-- 
����->���ڿ�: format �±׸� ����Ͽ� ���� num�� ����, ��ȭ, �ۼ�Ʈ, ���� �� ���ϴ� ������ ���ڿ��� ���
���ڿ�->����: parseNumber �±׸� �̿��Ͽ� 123.456�� ���� ���ϴ� ���ڿ� ���·� ���
 -->
 
 
 <hr/>
 
 <!-- �ð� �� ��¥ ������ ������ �ִ� Date ��ü ���� -->
<c:set var="dayTime" value="<%=new Date()%>"/>

<!-- ��¥ ������ full ��Ÿ�Ϸ� ��� -->
<fmt:formatDate value="${dayTime}" type="date" dateStyle="full"/><br/>

<!-- �ð� ������ �⺻ ��Ÿ�Ϸ� ��� -->
<fmt:formatDate value="${dayTime}" type="time"/><p/>

<!-- Ÿ���� ���� -->
<fmt:timeZone value="Europe/London">
<!-- ������ Ÿ������ ���� ���� �ð� ��¥ ��� -->
Europe/London : <fmt:formatDate value="${dayTime}" type="both" dateStyle="full" timeStyle="full"/><br/>
</fmt:timeZone>

<fmt:setTimeZone value="America/New_York"/>
America/New_York : <fmt:formatDate value="${dayTime}" type="both" dateStyle="full" timeStyle="full"/><br/>
 
 
</body>
</html>