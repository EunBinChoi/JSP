function list() {
	document.listFrm.action = "02_boardList.jsp";
	document.listFrm.submit();
}
	
function read(num){
	document.readFrm.num.value = num;
	document.readFrm.action = "04_boardRead.jsp";
	document.readFrm.submit();
}

function checkSearchFrm() {
	if (document.searchFrm.keyWord.value == "") {
		alert("검색어를 입력하세요.");
		document.searchFrm.keyWord.focus();
		return;
 	}
 	document.searchFrm.submit();
}