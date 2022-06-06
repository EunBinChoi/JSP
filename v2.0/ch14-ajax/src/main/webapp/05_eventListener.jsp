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
	//  xhr 객체 생성 => 데이터 받아옴 (json, xml) => button
	/*
	const xhr = new XMLHttpRequest();
	xhr.open("GET", 'data/xml.xml', true);
	xhr.onreadystatechange = () => { 
		if(xhr.readyState == 4 && xhr.status == 200) {
			document.getElementById('createTable').addEventListener("click", clickEventHandler);
		}
	}
	
	const clickEventHandler = () => {	
		const persons = xhr.responseXML.getElementsByTagName("person");
		let htmlTag = "<table border='1' style='width:300px;'>";
		htmlTag += "<tr>";
		htmlTag += "<th>name</th>";
		htmlTag += "<th>age</th>";
		htmlTag += "</tr>";
		
		for(let i = 0; i < persons.length; i++) {
			htmlTag += "<tr>";
			if(persons[i].children.length != 0) {
				htmlTag += "<td>" + persons[i].getElementsByTagName("name")[0].innerHTML + "</td>";
				htmlTag += "<td>" + persons[i].getElementsByTagName("age")[0].innerHTML + "</td>";
			}
			if(persons[i].attributes.length != 0) {
				htmlTag += "<td>" + persons[i].getAttribute("name") + "</td>";
				htmlTag += "<td>" + persons[i].getAttribute("age") + "</td>";
			}
			htmlTag += "</tr>";
			
		}	
		htmlTag += "</table>";
		document.getElementById("result").innerHTML += htmlTag;
		
	};	
	
	xhr.send();
	*/
	
	// button =>  xhr 객체 생성 => 데이터 받아옴 (json, xml) 
	const clickEventHandler = () => {	
		const xhr = new XMLHttpRequest();
		xhr.open("GET", 'data/xml.xml', true);
		
		xhr.onreadystatechange = () => { 
			if(xhr.readyState == 4 && xhr.status == 200) {
				const persons = xhr.responseXML.getElementsByTagName("person");
				let htmlTag = "<table border='1' style='width:300px;'>";
				htmlTag += "<tr>";
				htmlTag += "<th>name</th>";
				htmlTag += "<th>age</th>";
				htmlTag += "</tr>";
				
				for(let i = 0; i < persons.length; i++) {
					htmlTag += "<tr>";
					if(persons[i].children.length != 0) {
						htmlTag += "<td>" + persons[i].getElementsByTagName("name")[0].innerHTML + "</td>";
						htmlTag += "<td>" + persons[i].getElementsByTagName("age")[0].innerHTML + "</td>";
					}
					if(persons[i].attributes.length != 0) {
						htmlTag += "<td>" + persons[i].getAttribute("name") + "</td>";
						htmlTag += "<td>" + persons[i].getAttribute("age") + "</td>";
					}
					htmlTag += "</tr>";
					
				}	
				htmlTag += "</table>";
				document.getElementById("result").innerHTML += htmlTag;	
				
			}
		}
		xhr.send();
	};	
	
	
	
</script>
	<div id="result"></div>
	<input type="button" id="createTable" value="create table!" onclick="clickEventHandler()">
</body>
</html>