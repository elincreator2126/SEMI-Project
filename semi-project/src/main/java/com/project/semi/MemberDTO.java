package com.project.semi;

public class MemberDTO {
	String id, name;
	int password;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPassword() {
		return password;
	}
	public void setPassword(int password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", name=" + name + ", password=" + password + "]";
	}
	
	
	
	
}