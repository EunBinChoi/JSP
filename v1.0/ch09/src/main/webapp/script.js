function loginCheck(actionURL){
	if(document.login.id.value==""){
		alert("���̵� �Է��� �ּ���.");
		document.login.id.focus();
		return;
	}
	if(document.login.pwd.value==""){
		alert("��й�ȣ�� �Է��� �ּ���.");
		document.login.pwd.focus();
		return;
	}
	document.login.action = actionURL;
	document.login.submit();
}
