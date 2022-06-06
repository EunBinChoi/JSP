<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<h2>Functions Tags</h2>
<c:set var="str" value="JSP :: Java Server Page"/>
<hr width="430" align="left" color="red"/>
str : <b>${str}</b><br/>
length : <b>${fn:length(str)}</b><br/>
<br/><br/>
substring : <b>${fn:substring(str,0,8)}</b><br/>
substringAfter : <b>${fn:substringAfter(str,"JSP")}</b><br/>
substringBefore : <b>${fn:substringBefore(str,"Page")}</b><br/>
<br/><br/>
toUpperCase : <b>${fn:toUpperCase(str)}</b><br/>
toLowerCase  : <b>${fn:toLowerCase(str)}</b><br/>
<br/><br/>
replace  : <b>${fn:replace(str,"JSP","Android")}</b><br/>
indexOf  : <b>${fn:indexOf(str,"the")}</b><br/>
<br/><br/>
startsWith  : <b>${fn:startsWith(str,"JSP")}</b><br/>
endsWith  : <b>${fn:endsWith(str,"JSP")}</b><br/>
<br/><br/>
contains  : <b>${fn:contains(str,"jsp")}</b><br/>
containsIgnoreCase  : <b>${fn:containsIgnoreCase(str,"jsp")}</b><br/>
<br/><br/>
trim  : ***<b>${fn:trim("   Hello!!!! JSP!!!!!   ")}</b>***<br/>

<!-- JSP :: Java Server Page 
	String[] arr = JSP,::,Java,Server,Page
	"JSP&&::&&Java&&Server&&Page"
-->
<c:set var="arr" value="${fn:split(str,' ')}"/>
join : <b>${fn:join(arr,"&&")}</b><br/>
<hr width="430" align="left" color="blue"/>
</body>
</html>