function checkReplyFrm() {
    if (document.replyFrm.name.value == "") {
		alert("성명을 입력하세요.");
        document.replyFrm.name.focus();
        return false;
    }
    else if (document.replyFrm.subject.value == "") {
		alert("제목을 입력하세요.");
        document.replyFrm.subject.focus();
        return false;
    }
    else if (document.replyFrm.content.value == "") {
		alert("내용을 입력하세요.");
        document.replyFrm.content.focus();
        return false;
    }
    else if (document.replyFrm.pass.value == "") {
		alert("비밀번호를 입력하세요.");
        document.replyFrm.pass.focus();
        return false;
    }
	return true;
}
