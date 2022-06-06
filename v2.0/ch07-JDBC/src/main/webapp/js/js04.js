function isValidUpdateForm(formName, dbpwd) {
	if (!(isValidID(document.forms[formName]["id"].value))) {
		document.forms[formName]["id"].focus();
		return false;
	}
	else if (!(isValidCurPass(document.forms[formName]["curpwd"].value, dbpwd))) {
		document.forms[formName]["curpwd"].focus();
		return false;
	}

	else if (!(isValidNewPass(document.forms[formName]["newpwd"].value))) {
		document.forms[formName]["newpwd"].focus();
		return false;
	}
	else if (!(isValidNewRePass(document.forms[formName]["newpwd"].value, document.forms[formName]["newrepwd"].value))) {
		document.forms[formName]["newrepwd"].focus();
		return false;
	}
	else if (!(isValidName(document.forms[formName]["name"].value))) {
		document.forms[formName]["name"].focus();
		return false;
	}
	else if (!(isValidEmail(document.forms[formName]["email"].value))) {
		document.forms[formName]["email"].focus();
		return false;
	}
	else if (!(isValidPhone(document.forms[formName]["phone"].value))) {
		document.forms[formName]["phone"].focus();
		return false;
	}
	return true;

}

function isValidName(name) {
	// 조건
	// 1) 이름을 무조건 입력
	if (name == "") { alert("NAME must be filled out"); return false; }
	return true;
}

function isValidID(id) {
	// 조건
	// 1) 아이디를 무조건 입력
	// 2) 아이디는 영문자로 시작
	// 3) 아이디는 3글자 이상
	if (id == "") { alert("ID must be filled out"); return false; }
	// else if (!(id.charAt(0) >= "a" && id.charAt(0) <= "z" || id.charAt(0) >= "A" && id.charAt(0) <= "Z")) { alert("ID must be started with alphabet"); return false; }
	// else if (id.length < 3) { alert("ID must be at least 3 letters long"); return false; }

	// regex
	/*else if(!(/^[a-zA-Z]\w{2,}$/g.test(id))) {
		alert("ID mismatch regex!"); 
		return false;
	}*/
	return true;
}

function isValidCurPass(pwd, dbpwd) {
	if (pwd == "") { alert("PASSWORD must be filled out"); return false; }
	else if(pwd != dbpwd) {
		alert("PASSWORD does not match PASSWORD IN DATABASE"); return false;
	}
	return true;
}


function isValidNewPass(newpwd) {
	// 조건
	// 1) 비밀번호를 무조건 입력
	// 2) 8 <=  <= 16 자리 사이
	// 3) 대문자와 특수문자를 무조건 하나씩 포함 
	if (newpwd == "") { alert("NEW PASSWORD must be filled out"); return false; }
	// else if (!(pass.length >= 8 && pass.length <= 16)) { alert("PASSWORD must be 8 ~ 16 letters long"); return false; }

	// const mustCapital = ["A", "Z"];
	// const mustSpecial = [[33, 47], [58, 64], [91, 96], [123, 126]];
	// let countCapital = 0;
	// let countSpecial = 0;
	// for (let i = 0; i < pass.length; i++) {
	//     if (pass.charAt(i) >= mustCapital[0] && pass.charAt(i) <= mustCapital[1]) {
	//         countCapital++;
	//     }

	//     for (let j = 0; j < mustSpecial.length; j++) {
	//         if (pass.charCodeAt(i) >= mustSpecial[j][0] && pass.charCodeAt(i) <= mustSpecial[j][1]) {
	//             countSpecial++;
	//         }
	//     }
	//     // if(pass.charCodeAt(i) >= 33 && pass.charCodeAt(i) <= 47 
	//     // || pass.charCodeAt(i) >= 58 && pass.charCodeAt(i) <= 64 
	//     // || pass.charCodeAt(i) >= 91 && pass.charCodeAt(i) <= 96 
	//     // || pass.charCodeAt(i) >= 123 && pass.charCodeAt(i) <= 126)
	// }

	// if (!(countCapital > 0 && countSpecial > 0)) { alert("PASSWORD must include one capital and one special character"); return false; }

	// regex
	/*else if(!(/(?=.*[A-Z])(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/g.test(pass))) {
		alert("PASSWORD mismatch regex!");
		return false;
	}*/

	return true;

}

function isValidNewRePass(newpwd, newrepwd) {
	if (newrepwd == "") { alert("NEW PASSWORD REWRITE must be filled out"); return false; }
	else if(newpwd != newrepwd) {
		alert("NEW PASSWORD REWRITE does not match NEW PASSWORD"); return false;
	}
	return true;
}

function isValidEmail(email) {
	// 조건
	// 1) 이메일이 무조건 입력
	// 2) 이메일에 @가 포함
	if (email == "") { alert("EMAIL must be filled out"); return false; }
	// else if (email.indexOf('@') == -1) { alert("EMAIL must has @ letter"); return false; }

	// regex
	else if (!(/^[A-Za-z0-9\-\_\.]+\@[A-Za-z0-9\-]+(\.[A-Za-z]{2,3}){1,2}$/g.test(email))) {
		alert("EMAIL mismatch regex!");
		return false;
	}
	return true;
}

function isValidPhone(phone) {
	// 조건
	// 1) 위치 정보가 무조건 입력
	if (phone == "") { alert("PHONE must be filled out"); return false; }

	// regex
	else if (!(/^\d{2,3}-\d{3,4}-\d{4}$/g.test(phone))) {
		alert("PHONE mismatch regex!");
		return false;
	}
	return true;
}