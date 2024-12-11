package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.model.StudentSeatBooking;

public interface SeatBooking extends JpaRepository<StudentSeatBooking, Integer> {

}
