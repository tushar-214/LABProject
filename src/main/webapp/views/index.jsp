<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
@import url('https://fonts.googleapis.com/css?family=Oswald:500');

.back {
  position: fixed;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: url(https://pp.userapi.com/c841122/v841122831/327e/nHt-92F6yc4.jpg) no-repeat top center #efeff1;
  background-size: cover;
}

.thx {
  position: fixed;
  left: 50%;
  transform: translateX(-50%);
  bottom: 15px;
}

nav {
  width: 100%;
  position: fixed;
  top: 50px;
  text-align: center;
}

nav a {
  font-family: 'Oswald', sans-serif;
  font-weight: 500;
  text-transform: uppercase;
  text-decoration: none;
  color: #16151b;
  margin: 0 15px;
  font-size: 16px;
  letter-spacing: 1px;
  position: relative;
  display: inline-block;
}

nav a:before {
  content: '';
  position: absolute;
  width: 100%;
  height: 3px;
  background: #16151b;
  top: 47%;
  animation: out 0.2s cubic-bezier(1, 0, 0.58, 0.97) 1 both;
}

nav a:hover:before {
  animation: in 0.2s cubic-bezier(1, 0, 0.58, 0.97) 1 both;
}

@keyframes in {
  0% {
    width: 0;
    left: 0;
    right: auto;
  }
  100% {
    left: 0;
    right: auto;
    width: 100%;
  }
}

@keyframes out {
  0% {
    width: 100%;
    left: auto;
    right: 0;
  }
  100% {
    width: 0;
    left: auto;
    right: 0;
  }
}

@keyframes show {
  0% {
    opacity: 0;
    transform: translateY(-10px);
  }
  100% {
    opacity: 1;
    transform: translateY(0);
  }
}

/* Manually converting the @for loop from SCSS */
nav a:nth-child(1) {
  animation: show 0.2s 1.1s ease 1 both;
}

nav a:nth-child(2) {
  animation: show 0.2s 1.2s ease 1 both;
}

nav a:nth-child(3) {
  animation: show 0.2s 1.3s ease 1 both;
}

nav a:nth-child(4) {
  animation: show 0.2s 1.4s ease 1 both;
}

nav a:nth-child(5) {
  animation: show 0.2s 1.5s ease 1 both;
}
nav a:nth-child(6) {
  animation: show 0.2s 1.6s ease 1 both;
}
nav a:nth-child(7) {
  animation: show 0.2s 1.7s ease 1 both;
}

body {
  font-size: 14px; /* Mobile */
}

@media (min-width: 768px) {
  body {
    font-size: 16px; /* Tablet and larger */
  }
}

</style>
<body>
<div class="back"></div>
<nav>
  <a href="#">About</a>
  <a href="/getAvailability">Availability</a>
  <a href="/studentform">Add Member</a>
  <a href="/getStudentData">Student Data</a>
  <a href="/seatBooking">Book Seat</a>
  <a href="/getSeatingData">Seating Details</a>
  <a href="#">Contacts</a>
</nav>

<!-- Unsplash copyright -->
</body>
</html>