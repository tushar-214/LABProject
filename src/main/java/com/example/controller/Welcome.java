package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.ui.Model; // Correct Model import

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.example.model.StudentInfo;
import com.example.model.StudentSeatBooking;
import com.example.service.StudentImpl;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
public class Welcome {
	
	@Autowired
	private StudentImpl impl;

	@GetMapping("/studentform")
	public ModelAndView getApp() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("jsp_homework");
		return mv;
	}

	@PostMapping("/submitform")
	public String submitForm(@ModelAttribute StudentInfo studentInfo, Model model) {
		StudentInfo savedStudentInfo = impl.AddStudentInfo(studentInfo);
		model.addAttribute("student", savedStudentInfo);
		model.addAttribute("message", "Student information saved successfully!");
		return "jsp_homework"; // Name of JSP view to display the confirmation
	}

	@GetMapping("/getStudentData")
	public ModelAndView studentData() {
		ModelAndView mv = new ModelAndView();
		List<StudentInfo> studentData = impl.getStudentDetails();
		mv.addObject("studentData", studentData);
		mv.setViewName("StudentDetails");
		return mv;

	}

	@GetMapping("/seatBooking")
	public ModelAndView getSeatBooking() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Student_seat_booking");
		return mv;
	}

	@PostMapping("/seatbooked")
	public String bookSeat(@ModelAttribute StudentSeatBooking seatBooking, Model model) {
		impl.addSeatbooking(seatBooking);
		model.addAttribute("message", "Seat Booked successfully!");
		return "Student_seat_booking"; // Name of JSP view to display the confirmation
	}
	
	
	@GetMapping("/getSeatingData")
	public ModelAndView getBookingDetails()
	{
		ModelAndView mv=new ModelAndView();
     	List<StudentSeatBooking> bookDetails=impl.getBookDetails();
     	mv.addObject("seating",bookDetails);
     	mv.setViewName("Booking_data");
		return mv;
	}
	
	@DeleteMapping("/seatdelete/{seatId}")
	public ResponseEntity<Map<String, String>> deleteSeat(@PathVariable("seatId") String seatId) {
	    // Call the service to delete the record from the database
	    boolean isDeleted = impl.deleteSeatById(seatId);    	    
	    Map<String, String> response = new HashMap<>();
	    if (isDeleted) {
	        response.put("message", "Student Deleted successfully!");
	        return ResponseEntity.ok(response);  // 200 OK with success message
	    } else {
	        response.put("message", "Student Not Deleted successfully!");
	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(response);  // 400 Bad Request with error message
	    }
	}

	    
	    
	    
	}
	


