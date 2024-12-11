<%@page import="java.util.Collections"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.example.model.StudentSeatBooking"%>
<%@ page import="java.util.Arrays" %>
<%
try {
	// seat declaration 
	int acseat=10;
	int reserv=10;
	
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dynamic Grid Colors</title>

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.grid-item {
	color: black; /* Text color for contrast */
	border: 1px solid #ddd;
	text-align: center;
	padding: 10px;
	margin: 5px;
	transition: transform 0.3s, background-color 0.3s; /* Smooth transition */
    cursor: pointer;
}



.grid-item:hover {
    background-color: #007bff; /* Change background color on hover */
    color: white;              /* Change text color */
    transform: scale(1.1);     /* Slightly enlarge on hover */
}

.card {
	margin-top: 100px;
}
</style>
</head>
<body>
	<jsp:include page="index.jsp" />
	<div class="container">
		<!-- seperate column for reserve  -->
		<div class="row">
			<div class="col-6">

				<div class="card">
					<div
						class="card-Header d-flex justify-content-center align-items-center"
						style="height: 100px; background-color: #f8f9fa;">
						<%
						List<StudentSeatBooking> bookDetails = (List<StudentSeatBooking>) request.getAttribute("reserveList");
						int rSize=bookDetails.size();
						%>
						<div class="col-6 col-md-10 grid-item"
							style="font-size: 24px; font-weight: bold;">Reserved Seat (<%=rSize%>)</div>
					</div>

					<div class="card-body">
						<div class="row justify-content-center">

							<%
							int [] ar=new int[rSize];
							int acount=0;
							// Retrieve the Availability reserve list from the request
							if (bookDetails != null && !bookDetails.isEmpty()) {
								for (StudentSeatBooking student : bookDetails) {
									ar[acount]=student.getSeatId();
//name split here logic
				String fullName = student.getName(); // e.g., "Tushar Bhosale"
				String initials = "";
						if (fullName != null && !fullName.trim().isEmpty()) {
								String[] parts = fullName.trim().split("\\s+");
								for (String part : parts) {
									initials += part.charAt(0); // Take the first character of each word
								        }
									}%>
							<div class="col-5 col-md-3 grid-item"> <b>Seat <%=student.getSeatId()%> <%=initials%></b></div>			
							<% acount++;
							}
							} else {%>
								<div class="col-6 col-md-5 grid-item">Seat Availables</div>
						  
						  <%}%>
						 
						</div>
					</div>
				</div>
			</div>


			<!-- seperate column for reserve  -->
			<div class="col-6">

				<div class="card">
					<div
						class="card-Header d-flex justify-content-center align-items-center"
						style="height: 100px; background-color: #f8f9fa;">
						<%					
						List<StudentSeatBooking> acBookDetails = (List<StudentSeatBooking>) request.getAttribute("acReserveList");
                        int acBookSize=acBookDetails.size();
                        int [] acAr=new int[acBookSize];
						int acRount=0;
						%>
						<div class="col-6 col-md-10 grid-item"
							style="font-size: 24px; font-weight: bold;">AC Reserved Seat (<%=acBookSize %>) </div>		
					</div>
					<div class="card-body">
						<div class="row justify-content-center">
							<%
							// Retrieve the Availability reserve list from the request

							if (acBookDetails != null && !acBookDetails.isEmpty()) {
								for (StudentSeatBooking acStudent : acBookDetails) {
									acAr[acRount]=acStudent.getSeatId();
//name split here logic
				String fullName = acStudent.getName(); // e.g., "Tushar Bhosale"
				String initials = "";
						if (fullName != null && !fullName.trim().isEmpty()) {
								String[] parts = fullName.trim().split("\\s+");
								for (String part : parts) {
									initials += part.charAt(0); // Take the first character of each word
								        }
									}%>
							<div class="col-5 col-md-3 grid-item"> <b>Seat <%=acStudent.getSeatId()%> <%=initials%></b></div>			
							<% acRount++;
							}
							} else {%>
								<div class="col-6 col-md-5 grid-item">Seats Availables</div>
						  
						  <%}%>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Avialable seat -->
		<div class="row ">
			<div class="col-6">

				<div class="card">
					<div
						class="card-Header d-flex justify-content-center align-items-center"
						style="height: 100px; background-color: #f8f9fa;">
						<div class="col-6 col-md-10 grid-item"
							style="font-size: 24px; font-weight: bold;">Available Reserved Seat (<%=reserv-rSize %>)</div>
					</div>

					<div class="card-body">
						<div class="row justify-content-center ">

			
			 <%  
				
			 Arrays.sort(ar); // Optional: sort for potential optimization in search
		        for (int i = 1; i <=acseat; i++) {
		            // Check if 'i' is not in 'ar'
		            if (Arrays.binarySearch(ar, i) < 0) { // binarySearch returns < 0 if the element is not found
		               %>  
		           <div class="col-6 col-md-2 grid-item">Seat <%=i %></div> 
		           <% }
		        }  %>
						</div>
					</div>
				</div>
			</div>


			<!-- seperate column for reserve  -->
			<div class="col-6">

				<div class="card">
					<div
						class="card-Header d-flex justify-content-center align-items-center"
						style="height: 100px; background-color: #f8f9fa;">
						<div class="col-6 col-md-10 grid-item"
							style="font-size: 24px; font-weight: bold;">Available AC
							Reserved Seat (<%=acseat- acBookSize%>)</div>
					</div>
					<div class="card-body">
						<div class="row justify-content-center">
						
				 <%  
			 Arrays.sort(acAr); // Optional: sort for potential optimization in search
		        for (int i = 11; i <=20; i++) {
		            // Check if 'i' is not in 'ar'
		            if (Arrays.binarySearch(acAr, i) < 0) { // binarySearch returns < 0 if the element is not found
		               %>  
		           <div class="col-6 col-md-2 grid-item">Seat <%=i %></div> 
		           <% }
		        }  %>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

	<!-- JavaScript to set dynamic colors -->
	<script>
    // Function to generate a random color
    function getRandomColor() {
        const letters = '0123456789ABCDEF';
        let color = '#';
        for (let i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    // Apply random background colors to grid items
    document.addEventListener("DOMContentLoaded", function () {
        const gridItems = document.querySelectorAll('.grid-item');
        gridItems.forEach(item => {
            const randomColor = getRandomColor();
            item.style.backgroundColor = randomColor;
        });
    });
</script>

</body>
</html>
<%
} catch (Exception e) {

}
%>
