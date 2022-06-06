function del(num) {
	document.frm.action = "pBlogDelete";
	document.frm.num.value = num;
	document.frm.submit();
}
function rDel(rnum) {
	document.frm.action = "pReplyDelete";
	document.frm.rnum.value = rnum;
	document.frm.gid.value = "<%=gid%>";
	document.frm.submit();
}
function heart(num, gid) {
	document.frm.action = "pBlogUpHCnt";
	document.frm.num.value = num;
	document.frm.gid.value = gid;
	document.frm.submit();
}
function cmtPost(num, id, gid) {
	document.frm.action = "pReplyPost";
	cmt = document.getElementById("comments" + num);
	document.frm.comments.value = cmt.value;
	document.frm.num.value = num;
	document.frm.id.value = id;
	document.frm.gid.value = gid;
	document.frm.submit();
}
function goURL(url) {
	document.frm1.action = url;
	document.frm1.submit();
}