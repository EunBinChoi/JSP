<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP AJAX SEARCH ENGINE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	
	function searchFunction() {
		const searchRequest = new XMLHttpRequest();
		searchRequest.open("post", "./UsersSearchServlet?userName=" + $("#userName").val(), true);
		searchRequest.onreadystatechange = () => {
			if(searchRequest.readyState == 4 && searchRequest.status == 200) {
				
				// 검색된 결과를 table로 출력 (ajaxTable)
				const table = $("#ajaxTable")[0]; // dom 반환
				table.innerHTML = "";
				
				const object = JSON.parse(searchRequest.responseText);
				for(let i = 0; i < object.length; i++) {
					const user = [object[i].userName, object[i].userAge, object[i].userGender, object[i].userEmail]
					const row = table.insertRow(0); // 0번째 행에 추가 (tr)
					
					for(let j = 0; j < user.length; j++) {
						const cell = row.insertCell(j); // j번째 열 추가 (td)
						cell.innerHTML = user[j];
					}
				}
			}
		};
		searchRequest.send();
		
	}
	
	function registerFunction() {
		const registerRequest = new XMLHttpRequest();
		registerRequest.open("post", 
				"./UsersRegisterServlet?userName=" + $("#registerName").val() 
						+ "&userAge=" + $("#registerAge").val() 
						+ "&userGender=" + $("input[name=registerGender]:checked").val() 
						+ "&userEmail=" + $("#registerEmail").val()
						, true);
		registerRequest.onreadystatechange = () => {
			if(registerRequest.readyState == 4 && registerRequest.status == 200) {
				const result = registerRequest.responseText; // "-1", "1"
	
				if(result == "-1") { // == (value), === (value + type)
					alert("등록 실패했습니다.");
				}
				else {
					// 등록된 사람이 search 결과 테이블에 포함되도록 (view에서)
					const userName = $("#userName");
					const registerName = $("#registerName");
					const registerAge = $("#registerAge");
					const registerEmail = $("#registerEmail");
					
					userName.val(""); // select * (keyword가 빈문자열)
					
					// 입력 폼의 데이터를 초기화
					registerName.val("");
					registerAge.val("");
					$("#registerGenderMale").prop("checked", true);
					$("#registerGenderFemale").prop("checked", false);
					registerEmail.val("");
					
					// 추가한 회원의 정보도 보일 수 있도록 select * 을 통해 결과 테이블에 보여줌
					// UsersSearchServlet?userName=
					// select * from users where userName like % keyword %
					// keyword == "" => select *
					searchFunction();
				}
			}
		};
		registerRequest.send();
		
	}
	

	window.onload = () => {	
		searchFunction(); 
	}
</script>
</head>
<body>
<br>
<div class="container" style="margin:20px;">
	<div class="" style="margin:20px; text-align: right;">
		<input class="" id="userName" onkeyup="searchFunction();" type="text" size="20">
		<button class="" onclick="searchFunction();" type="button">검색</button>	
	</div>
	<table class="table" style="width: 500px; text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th style="padding:5px; background-color: #fafafa; text-align: center;">이름</th>
				<th style="padding:5px; background-color: #fafafa; text-align: center;">나이</th>
				<th style="padding:5px; background-color: #fafafa; text-align: center;">성별</th>
				<th style="padding:5px; background-color: #fafafa; text-align: center;">이메일</th>
			</tr>
		</thead>
		<tbody id="ajaxTable">
		</tbody>
	</table>
</div>
<div class="container" style="margin:20px;">
	<table class="table"  style="width: 500px; text-align: center; border: 1px solid #dddddd">
		<thead>
			<tr>
				<th colspan="2" style="background-color: #fafafa; text-align: center;">회원 등록 양식</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td style="background-color: #fafafa; text-align: center;"><h5>이름</h5></td>
				<td><input class="" type="text" id="registerName" size="20"></td>
			</tr>
			<tr>
				<td style="background-color: #fafafa; text-align: center;"><h5>나이</h5></td>
				<td><input class="" type="text" id="registerAge" size="20"></td>
			</tr>
			<tr>
				<td style="background-color: #fafafa; text-align: center;"><h5>성별</h5></td>
				<td>
					<div class="" style="text-align: center; margin:0 auto;">
						<div class="" data-toggle="buttons">
							<label class="">
								<input type="radio" id="registerGenderMale" name="registerGender" autocomplete="off" value="남자" checked>남자
							</label>
							<label class="">
								<input type="radio" id="registerGenderFemale" name="registerGender" autocomplete="off" value="여자">여자
							</label>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td style="background-color: #fafafa; text-align: center;"><h5>이메일</h5></td>
				<td><input class="" type="text" id="registerEmail" size="20"></td>
			</tr>
			<tr>
				<td colspan="2"><button class="" onclick="registerFunction();" type="button">등록</button></td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>