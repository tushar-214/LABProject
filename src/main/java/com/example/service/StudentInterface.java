package com.example.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.model.StudentInfo;
import com.example.model.StudentSeatBooking;

public interface StudentInterface {
 
 public StudentInfo	AddStudentInfo(StudentInfo info);
 
 public List<StudentInfo> getStudentDetails();
 
 public String addSeatbooking(StudentSeatBooking seatBooking);
 
 public List<StudentSeatBooking> getBookDetails();
 
 public boolean deleteSeatById(String seatId);
 
 public List<StudentSeatBooking> getAvialability();
 

}
