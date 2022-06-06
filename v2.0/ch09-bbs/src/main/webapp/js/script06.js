function check() {
	if (document.delFrm.pass.value == "") {
		alert("패스워드를 입력하세요.");
		document.delFrm.pass.focus();
		return false;
	}
	document.delFrm.submit();
}