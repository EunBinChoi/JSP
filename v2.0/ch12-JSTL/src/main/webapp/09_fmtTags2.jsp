<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<h2>Formatting Tags2</h2>
<!-- core 태그 set으로 변수 num 선언 -->
<c:set var="num" value="123456789"/>

<!-- number 타입으로 num값 출력 -->
숫자 : <fmt:formatNumber value="${num}" type="number"/><br/>

<!-- precent 타입으로 num값 출력
세자리 단위로 ',' (콤마)의 사용여부를 groupingUsed 속성에 true/false 설정 (기본값 true)  -->
퍼센트 : <fmt:formatNumber value="${num}" type="percent" groupingUsed="true"/><br/>

<!-- currency (통화) 타입으로 num값 출력
통화의 심볼은 $로 설정 -->
달러 : <fmt:formatNumber value="${num}" type="currency" currencySymbol="$"/><br/>

<!-- 정수 자리와 실수 4자리로 지정한 패턴 (pattern)으로 num값 출력 -->
패턴 : <fmt:formatNumber value="${num}" pattern="0.0000" groupingUsed="false"/><p/>

<!-- 실수값을 정수부분만 파싱하여 변수로 선언  -->
<fmt:parseNumber var="i" integerOnly="true" value="123.456"/>
실수를 제외한 정수 : <c:out value="${i}"/>

<!-- 
	숫자->문자열: format 태그를 사용하여 변수 num을 숫자, 통화, 퍼센트, 패턴 등 원하는 형식의 문자열로 출력
	문자열->숫자: parseNumber 태그를 이용하여 123.456의 값을 원하는 문자열 형태로 출력
 -->
</body>
</html>