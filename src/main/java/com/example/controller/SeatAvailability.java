package com.example.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.model.StudentSeatBooking;
import com.example.service.StudentImpl;

@Controller
public class SeatAvailability {

	@Autowired
	private StudentImpl impl;

	@GetMapping("/getAvailability")
	public ModelAndView getSeatingAvailability() {
		ModelAndView mv = new ModelAndView();

		// Fetch the availability list from your service
		List<StudentSeatBooking> availability = impl.getAvialability();

		// Separate the list by seattype
		List<StudentSeatBooking> nonReserveList = availability.stream()
				.filter(booking -> "Non Reserve".equals(booking.getSeattype())).collect(Collectors.toList());

		List<StudentSeatBooking> acReserveList = availability.stream()
				.filter(booking -> "Ac Reserve".equals(booking.getSeattype())).collect(Collectors.toList());

		List<StudentSeatBooking> reserveList = availability.stream()
				.filter(booking -> "Reserve".equals(booking.getSeattype())).collect(Collectors.toList());

		// Log the availability for debugging purposes

		// Add the separated lists to the ModelAndView

		mv.addObject("acReserveList", acReserveList);
		mv.addObject("reserveList", reserveList);
		mv.addObject("nonReserveList", nonReserveList);

		// Set the view name
		mv.setViewName("SeatAvailabilty");

		return mv;
	}

}
