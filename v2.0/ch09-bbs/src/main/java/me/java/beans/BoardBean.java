package me.java.beans;

public class BoardBean {
	private int num;
	private String name;
	private String subject;
	private String content;
	private int pos;
	private int ref;
	private int depth;
	private String regDate;
	private String pass;
	private String ip;
	private int count;
	private String fileName;
	private int fileSize;
	
	public BoardBean() {
		super();
	}
	
	
	public BoardBean(String name, String subject, String content, int pos, int ref, int depth, String regDate,
			String pass, String ip, int count, String fileName, int fileSize) {
		super();
		this.name = name;
		this.subject = subject;
		this.content = content;
		this.pos = pos;
		this.ref = ref;
		this.depth = depth;
		this.regDate = regDate;
		this.pass = pass;
		this.ip = ip;
		this.count = count;
		this.fileName = fileName;
		this.fileSize = fileSize;
	}



	public BoardBean(int num, String name, String subject, String content, int pos, int ref, int depth, String regDate,
			String pass, String ip, int count, String fileName, int fileSize) {
		super();
		this.num = num;
		this.name = name;
		this.subject = subject;
		this.content = content;
		this.pos = pos;
		this.ref = ref;
		this.depth = depth;
		this.regDate = regDate;
		this.pass = pass;
		this.ip = ip;
		this.count = count;
		this.fileName = fileName;
		this.fileSize = fileSize;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPos() {
		return pos;
	}
	public void setPos(int pos) {
		this.pos = pos;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getFileSize() {
		return fileSize;
	}
	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}
	@Override
	public String toString() {
		return "BoardBean [num=" + num + ", name=" + name + ", subject=" + subject + ", content=" + content + ", pos="
				+ pos + ", ref=" + ref + ", depth=" + depth + ", regDate=" + regDate + ", pass=" + pass + ", ip=" + ip
				+ ", count=" + count + ", fileName=" + fileName + ", fileSize=" + fileSize + "]";
	}
	
}
