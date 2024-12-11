package com.example.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="student_seat_booking")
public class StudentSeatBooking {
	
	private String name;
	private String mobile;
	@Id
	private Integer seatId;
	private String date ;
	private String seattype;
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
	public Integer getSeatId() {
		return seatId;
	}
	public void setSeatId(Integer seatId) {
		this.seatId = seatId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSeattype() {
		return seattype;
	}
	public void setSeattype(String seattype) {
		this.seattype = seattype;
	}
	@Override
	public String toString() {
		return "StudentSeatBooking [name=" + name + ", mobile=" + mobile + ", seatId=" + seatId + ", date=" + date
				+ ", seattype=" + seattype + "]";
	}
	
	public StudentSeatBooking(String name, String mobile, Integer seatId, String date, String seattype) {
		super();
		this.name = name;
		this.mobile = mobile;
		this.seatId = seatId;
		this.date = date;
		this.seattype = seattype;
	}
	
	public StudentSeatBooking() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	

}
