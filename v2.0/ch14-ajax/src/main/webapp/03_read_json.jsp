<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	const xhr = new XMLHttpRequest();
	xhr.open("GET", 'data/json.js', true);
	xhr.onreadystatechange = () => {
		if(xhr.readyState == 4 && xhr.status == 200) {
			const responseText = xhr.responseText;
			const jsonObj = JSON.parse(responseText);
			let htmlTag = "<table border='1' style='width:300px;'>";
			htmlTag += "<tr>";
			htmlTag += "<th>name</th>";
			htmlTag += "<th>age</th>";
			htmlTag += "</tr>";
			for(let i = 0; i < jsonObj.length; i++) {
				htmlTag += "<tr>";
				htmlTag += "<td>" + jsonObj[i]["name"] + "</td>";
				htmlTag += "<td>" + jsonObj[i].age + "</td>";
				htmlTag += "</tr>";
			}
			htmlTag += "</table>";
			
			document.getElementById("result").innerHTML += htmlTag;
		}
	}
	xhr.send();
</script>
<div id="result"></div>
</body>
</html>