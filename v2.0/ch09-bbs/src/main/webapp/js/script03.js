function checkPostFrm() {
    if (document.postFrm.name.value == "") {
		alert("성명을 입력하세요.");
        document.postFrm.name.focus();
        return false;
    }
    else if (document.postFrm.subject.value == "") {
		alert("제목을 입력하세요.");
        document.postFrm.subject.focus();
        return false;
    }
	else if (document.postFrm.content.value == "") {
		alert("내용을 입력하세요.");
        document.postFrm.content.focus();
        return false;
    }
    else if (document.postFrm.pass.value == "") {
		alert("비밀번호를 입력하세요.");
        document.postFrm.pass.focus();
        return false;
    }
	return true;
}
