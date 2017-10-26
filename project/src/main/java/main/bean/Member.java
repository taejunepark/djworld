package main.bean;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

public class Member {
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String birth;
	private String email;
	private String gender;
	private String power;
	private int bam;
	private String reg;
	private String status;
	private String profile;
	
	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Member() {
	}
	
	public String getEmail() {
		return email;
	}
	

	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getBam() {
		return bam;
	}
	public void setBam(int bam) {
		this.bam = bam;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirth() {
		return birth;
	}
	public String getBirthPrint() {
		return birth.substring(0, 4)+"년 "+birth.substring(4, 6)+"월 "+birth.substring(6,8)+"일";
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPower() {
		return power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	public String getReg() {
		return reg;
	}
	public String getDate() {
		return reg.substring(0, 10);
	}
	public void setReg(String reg) {
		this.reg = reg;
	}
	
	public Member(ResultSet rs) throws SQLException{
		setId(rs.getString("id"));
		setPw(rs.getString("pw"));
		setName(rs.getString("name"));
		setPhone(rs.getString("phone"));
		setBirth(rs.getString("birth"));
		setEmail(rs.getString("email"));
		setGender(rs.getString("gender"));
		setBam(rs.getInt("bam"));
		setPower(rs.getString("power"));
		setReg(rs.getString("reg"));
		setProfile(rs.getString("profile"));
	}
	
	public Member(HttpServletRequest request) {
		setId(request.getParameter("id"));
		setPw(request.getParameter("pw"));
		setName(request.getParameter("name"));
		setPhone(request.getParameter("phone"));
		setBirth(request.getParameter("birth"));
		setEmail(request.getParameter("email"));
		setGender(request.getParameter("gender"));
		String bam = request.getParameter("bam");
		setBam(bam==null?0:Integer.parseInt(bam));
		setPower(request.getParameter("power"));
		setReg(request.getParameter("reg"));
		setProfile(request.getParameter("profile"));
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", birth=" + birth
				+ ", email=" + email + ", gender=" + gender + ", power=" + power + ", bam=" + bam + ", reg=" + reg
				+ ", status=" + status + ", profile=" + profile + "]";
	}
}
