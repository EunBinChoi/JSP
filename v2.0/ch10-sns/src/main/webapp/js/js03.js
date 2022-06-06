// frm 폼에 삭제하고 싶은 포토포스트의 num을 지정하고
// pBlogDelete로 URL 맵핑 값으로 지정한 PBlogDeleteServlet 서블릿으로 호출하는 자바스크립트 함수
function del(num) {
	document.frm.action = "pBlogDelete";
	document.frm.num.value = num;
	document.frm.submit();
}

// frm 폼에 삭제하고 싶은 포토포스트 댓글을 rnum을 지정하고
// pReplyDelete로 URL 맵핑 값으로 지정한 PReplyDeleteServlet 서블릿을 호출하는 자바스크립트 함수
function rDel(rnum) {
	document.frm.action = "pReplyDelete";
	document.frm.rnum.value = rnum;
	document.frm.submit();
}

// frm 폼에 '좋아요' 카운트를 증가하고 싶은 포토포스트 num을 지정하고
// pBlogUpHCnt로 URL 맵핑 값으로 지정한 PBlogHCntServlet 서블릿을 호출하는 자바스크립트 함수
function heart(num) {
	document.frm.action = "pBlogUpHCnt";
	document.frm.num.value = num;
	document.frm.submit();
}

// frm 폼에 댓글 입력하고 싶은 포토포스트 num을 지정하고 
// pReplyPost로 URL 맵핑 값으로 지정한 PReplyPostServlet 서블릿을 호출하는 자바스크립트 함수
// id값은 comment + num 값으로 동적으로 id값이 만들어짐

// 03_home.jsp 페이지에 다수개의 포토포스트가 존재하기 때문에 id값을 동적으로 만들고
// 댓글로 입력한 comment 값을 가져올 수가 있음
// 만약 입력폼이 전체 페이지에 정적으로 존재한다면 이런 기능이 필요가 없지만 동적 입력폼이 존재하면 이런 기능으로 구현해야 함
function cmtPost(num, id) {
	document.frm.action = "pReplyPost";
	cmt = document.getElementById("comments" + num);
	document.frm.comments.value = cmt.value;
	document.frm.num.value = num;
	document.frm.id.value = id;
	document.frm.submit();
}

// frm1 폼에 url과 gid 값을 지정하고 지정된 url 값으로 gid 값과 같이 요청하여 이동함
// gid 값은 상황에 따라 있을 수도 있고 없을 수도 있음
function goURL(url, gid) {
	document.frm1.action = url;
	document.frm1.gid.value = gid;
	document.frm1.submit();
}