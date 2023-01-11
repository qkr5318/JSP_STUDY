package member.model;

import java.util.Date;

import com.sun.xml.internal.ws.api.ha.StickyFeature;

public class Member {
	
	private String id;
	private String name;
	private String password;
	private Date regDate;
	
	public Member(String id, String name, String password, Date regDate) {
		this.id = id;
		this.name = name;
		this.password = password;
		this.regDate = regDate;
	}

	public String getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getPassword() {
		return password;
	}

	public Date getRegDate() {
		return regDate;
	}
	
	public boolean matchPassword(String pwd) {  // matchPassword() 메서드는 암호 변경 기능 구현 시 사용함
		return password.equals(pwd);
		
	}
	
	public void changePassword(String newPwd) {
		this.password=newPwd;
	}
	
	

}
