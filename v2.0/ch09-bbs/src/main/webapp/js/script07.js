function check() {
	if (document.updateFrm.pass.value == "") {
		alert("수정을 위해 패스워드를 입력하세요.");
		document.updateFrm.pass.focus();
		return;
	} // 수정할 내용 입력하고 비밀번호 입력 여부 체크하는 js 함수
	document.updateFrm.submit();
}