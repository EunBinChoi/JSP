function inputCheck() {
	// ��� �Է� �����Ͱ� �Է¹޾ƾ߸� ȸ������ ����
	if (document.regForm.id.value == "") {
		alert("���̵� �Է��� �ּ���");
		document.regForm.id.focus();
		return;
	}

	if (document.regForm.pwd.value == "") {
		alert("��й�ȣ�� �Է��� �ּ���");
		document.regForm.pwd.focus();
		return;
	}
	if (document.regForm.repwd.value == "") {
		alert("��й�ȣ�� �Է��� �ּ���");
		document.regForm.repwd.focus();
		return;
	}
	if (document.regForm.name.value == "") {
		alert("�̸��� �Է��� �ּ���");
		document.regForm.name.focus();
		return;
	}
	if (document.regForm.birthday.value == "") {
		alert("��������� �Է��� �ּ���");
		document.regForm.birthday.focus();
		return;
	}
	if (document.regForm.email.value == "") {
		alert("�̸����� �Է��� �ּ���");
		document.regForm.email.focus();
		return;
	}

	// ��й�ȣ ���� (8 ~ 16) ����
	if (document.regForm.pwd.value.length < 8
		|| document.regForm.pwd.value.length > 16) {
		alert("��й�ȣ�� ���� 8 ~ 16 ���̷� �Է����ּ���!");
		document.regForm.pwd.focus();
		return;
	}

	// ��й�ȣ�� ��й�ȣ ��Ȯ�� ���� ������ Ȯ��
	if (document.regForm.pwd.value != document.regForm.repwd.value) {
		alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
		document.regForm.repwd.focus();
		return;
	}

	// "���������������� 1991-12-25" "1999-12-12"
	// ������� ���� Ȯ�� (����ǥ���� �̿�)
	const reg_birth = /\d{4}-\d{2}-\d{2}/;
	if (document.regForm.birthday.value.search(reg_birth) == -1) {
		alert("������� ������ ���� �ʽ��ϴ�!");
		document.regForm.birthday.focus();
		return;
	}

	// �̸��� ���� Ȯ�� (����ǥ���� �̿�)
	const reg_email = /[A-Za-z0-9\-\.]+\@[A-Za-z0-9\-\.]+(\.[A-Za-z0-9]{2,3}){1,2}/;
	if (document.regForm.email.value.search(reg_email) == -1) {
		alert("�̸��� ������ ���� �ʽ��ϴ�!");
		document.regForm.email.focus();
		return;
	}

	// 
	document.regForm.submit();

}
//