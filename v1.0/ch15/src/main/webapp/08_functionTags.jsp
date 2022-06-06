<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<title>JSTL</title>
</head>
<body>
<h2>Functions Tags</h2>
<c:set var="str" value="JSP :: the whole new world!"/>
<!-- 
fn:split (���ڿ� -> �迭)
arr[] = {JSP, ::, the, whole, new, world!}

fn:join(arr, "&&") (�迭 -> ���ڿ�)
"JSP&&::&&the&&whole&&new&&world!"
 -->
<hr width="430" align="left" color="red"/>
str : <b>${str}</b><br/>
length : <b>${fn:length(str)}</b><br/>
substring : <b>${fn:substring(str,0,8)}</b><br/>
substringAfter : <b>${fn:substringAfter(str,"JSP")}</b><br/>
substringBefore : <b>${fn:substringBefore(str,"the")}</b><br/>
toUpperCase : <b>${fn:toUpperCase(str)}</b><br/>
toLowerCase  : <b>${fn:toLowerCase(str)}</b><br/>
replace  : <b>${fn:replace(str,"JSP","Android")}</b><br/>
indexOf  : <b>${fn:indexOf(str,"the")}</b><br/>
startsWith  : <b>${fn:startsWith(str,"JSP")}</b><br/>
endsWith  : <b>${fn:endsWith(str,"JSP")}</b><br/>
contains  : <b>${fn:contains(str,"jsp")}</b><br/>
containsIgnoreCase  : <b>${fn:containsIgnoreCase(str,"jsp")}</b><br/>
trim  : ***<b>${fn:trim("   Hello!!!! JSP!!!!!   ")}</b>***<br/>

<!-- JSP :: the whole new world!
{JSP, ::, the, whole, new, world}
"JSP&&::&&the&&whole&&new&&world"
 -->
<c:set var="arr" value="${fn:split(str,' ')}"/>
join : <b>${fn:join(arr,"&&")}</b><br/>
<hr width="430" align="left" color="blue"/>
</body>
</html>