package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.StudentInfo;
import com.example.model.StudentSeatBooking;
import com.example.repository.SeatBooking;
import com.example.repository.StudentRepo;
@Service
public class StudentImpl implements StudentInterface {
	@Autowired
	private StudentRepo studentRepo;

	@Override
	public StudentInfo AddStudentInfo(StudentInfo info) {	
		return studentRepo.save(info);
	}

	@Override
	public List<StudentInfo> getStudentDetails() {
		
		return studentRepo.findAll();
	}

	@Autowired
	private SeatBooking seatbooking;
	
	@Override
	public String addSeatbooking(StudentSeatBooking seatBooking) {	
		seatbooking.save(seatBooking);
		return "seat book successfully ";
	}

	@Override
	public List<StudentSeatBooking> getBookDetails() {
		return seatbooking.findAll();
	}
	
	@Override
	public boolean deleteSeatById(String seatId) {
		 try {
		        // Parse the seatId to an integer
		        int id = Integer.parseInt(seatId);
		        seatbooking.deleteById(id);

		        // Return true if no exception occurs
		        return true;
		    } catch (Exception e) {
		        // Log the exception and return false if any error occurs
		        System.err.println("Error deleting seat with ID: " + seatId);
		        e.printStackTrace();
		        return false;
		    }
	}
	
	// logic for availabilty check 
	
	@Override
	public List<StudentSeatBooking> getAvialability() {
		// TODO Auto-generated method stub
		return seatbooking.findAll();
	}
	

}
