package com.example.model;

import org.antlr.v4.runtime.misc.NotNull;

import jakarta.annotation.Generated;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity(name="Student_lab")
public class StudentInfo {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)	
	private Integer studentId;
	@NotNull
	private String name;
	@NotNull
    private String mobile;
	@NotNull
	private String email;
	
    private String address;
    @NotNull

    private String qualification;
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public StudentInfo(int studentId, String name, String mobile, String email, String address, String qualification) {
		super();
		this.studentId = studentId;
		this.name = name;
		this.mobile = mobile;
		this.email = email;
		this.address = address;
		this.qualification = qualification;
	}
	@Override
	public String toString() {
		return "StudentInfo [studentId=" + studentId + ", name=" + name + ", mobile=" + mobile + ", email=" + email
				+ ", address=" + address + ", qualification=" + qualification + "]";
	}
	public StudentInfo() {
		super();
	
	}
  
	
    
}
