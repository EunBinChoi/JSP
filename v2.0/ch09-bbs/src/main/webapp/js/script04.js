function list() {
	document.listFrm.submit();
}

function down(filename) {
	document.downFrm.filename.value = filename;
	document.downFrm.submit();
}