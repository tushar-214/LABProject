<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.io.BufferedReader,java.io.InputStreamReader,java.net.HttpURLConnection,java.net.URL"%>
<%
try {
%>
<!DOCTYPE html>
<html>
<head>

<style>
.center-container {
    margin-top:100px;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 60vh; /* Full height of the viewport */
	background-color: #f8f9fa; /* Optional: Background color */
}.small-alert {
    max-width: 300px !important; /* Restrict width */
    padding: 10px !important;    /* Adjust padding */
    font-size: 14px;             /* Reduce text size */
}

.small-alert .swal2-title {
    font-size: 16px;             /* Smaller title font size */
}

.small-alert .swal2-content {
    font-size: 14px;             /* Smaller text size */
}

.small-alert .swal2-actions {
    margin-top: 10px;            /* Adjust button spacing */
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

<meta charset="ISO-8859-1">

<!-- SweetAlert2 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.20/dist/sweetalert2.min.css"
	rel="stylesheet">

<!-- SweetAlert2 JS -->
<script
	src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.20/dist/sweetalert2.all.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<body>
<jsp:include page="index.jsp" />


	<div class="center-container">
		<div class="card" style="width: 25rem;">
			<div class="card-body justify-center">
				<h3 class="card-title text-center mb-4">Seat Booking</h3>
				<form action="/seatbooked" method="POST">
					<!-- Student Name -->
					<div class="mb-3 ">
						<label for="studentName" class="form-label">Student Name <span class="text-danger">*</span> </label> <input
							type="text" class="form-control" id="name" name="name"
							placeholder="Enter your name" required>
					</div>

					<!-- Mobile -->
					<div class="mb-3">
						<label for="mobile" class="form-label">Mobile <span class="text-danger">*</span></label> <input
							type="tel" class="form-control" id="mobile" name="mobile"
							placeholder="Enter your mobile number" required>
					</div>

					<!-- Address -->
					<div class="mb-3">
						<label for="seatno" class="form-label">Seat No <span class="text-danger">*</span></label>
						<input type="text" class="form-control" id="seatId" name="seatId"
							rows="2" placeholder="Enter seat no" required>
					</div>
					
					<div class="mb-3">
						<label for="date" class="form-label">Date <span class="text-danger">*</span></label>
						<input type="date" class="form-control" id="date" name="date"
							rows="2" placeholder="Enter date" required>
					</div>

					<!-- Qualification -->
					<div class="mb-3">
						<label for="qualification" class="form-label">Seat Type <span class="text-danger">*</span></label>
						<select class="form-select" id="seattype"
							name="seattype" required>
							
							<option value="" selected disabled>Select your
								seat</option>
							<option value="Reserve">Reserve</option>
							<option value="Non Reserve">Non Reserve</option>
							<option value="Ac Reserve">AC reserve</option>
						</select>
					</div>

					<!-- Submit Button -->
					<div class="d-flex justify-content-center gap-3 mt-3">
						<button type="submit" class="btn btn-primary btn-lg">Submit</button>
						<button type="reset" class="btn btn-secondary btn-lg">Reset</button>
					</div>


				</form>
			</div>
		</div>
	</div>

</body>

<script>
$(document).ready(function(){
	
	
		  });
	// alert
	document.getElementById('seatId').addEventListener('input', function () {
    const currentInput = this.value;
    if (currentInput) {
        Swal.fire({
            title: 'Seat Info',
            text: 'Reserve (1-10) Ac Reserve (11-20): ' + currentInput,
            icon: 'info',
            confirmButtonText: 'OK',
            customClass: {
                popup: 'small-alert'
            }
        });
    }
});


		<%if (request.getAttribute("message") != null) {%>
		Swal.fire({
		  icon: 'success',
		  title: 'Success!',
		  text: '<%=request.getAttribute("message")%>',
		  showConfirmButton: true,
		}).then((result) => {
		      if (result.isConfirmed) {
		          // Redirect to the student form page or any other URL
		          window.location.href = '/seatBooking';  // Replace with your desired URL
		        }
		      });
		<%}%>

</script>
</html>
<%
} catch (Exception e) {

}
%>