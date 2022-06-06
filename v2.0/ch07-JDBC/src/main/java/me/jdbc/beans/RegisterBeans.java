package me.jdbc.beans;

public class RegisterBeans {
	// REGISTER table의 열 (속성) 이름과 동일하게 만듦
	private String id, pwd, name, email, phone;

	public String getId() { return id; }
	public void setId(String id) { this.id = id; }

	public String getPwd() { return pwd; }
	public void setPwd(String pwd) { this.pwd = pwd; }

	public String getName() { return name; }
	public void setName(String name) { this.name = name; }

	public String getEmail() { return email; }
	public void setEmail(String email) { this.email = email; }

	public String getPhone() { return phone; }
	public void setPhone(String phone) { this.phone = phone; }
}
