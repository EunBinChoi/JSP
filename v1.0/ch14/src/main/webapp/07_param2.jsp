<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("EUC-KR"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
name: ${param.name} <br/>
name: ${param['name']} <br/>
///////////////////////////////////// <br/><br/>

hobby: ${param.hobby} <br/>
: paramValues.hobby[0]�� ��� <br/>

///////////////////////////////////// <br/><br/>
hobby: ${paramValues.hobby} <br/>
: paramValues �迭�� �ּ� ��� <br/>

hobby: ${paramValues.hobby[0]} <br/>
hobby: ${paramValues.hobby[1]} <br/>
hobby: ${paramValues.hobby[2]} <br/>
hobby: ${paramValues.hobby[3]} <br/>
hobby: ${paramValues.hobby[4]} <br/>

///////////////////////////////////// <br/><br/>
hobby: ${paramValues["hobby"][0]} <br/>
hobby: ${paramValues["hobby"][1]} <br/>
hobby: ${paramValues["hobby"][2]} <br/>
hobby: ${paramValues["hobby"][3]} <br/>
hobby: ${paramValues["hobby"][4]} <br/>
<!-- �����Ͱ� ���� ��쿡�� �� ���ڿ��� ��� -->

</body>
</html>