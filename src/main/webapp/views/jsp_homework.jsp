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
		<div class="card" style="width: 30rem;">
			<div class="card-body">
				<h3 class="card-title text-center mb-4">Student Registration
					Form</h3>
				<form action="/submitform" method="POST">
					<!-- Student Name -->
					<div class="mb-3">
						<label for="studentName" class="form-label">Student Name</label> <input
							type="text" class="form-control" id="name" name="name"
							placeholder="Enter your name" required>
					</div>

					<!-- Mobile -->
					<div class="mb-3">
						<label for="mobile" class="form-label">Mobile</label> <input
							type="tel" class="form-control" id="mobile" name="mobile"
							placeholder="Enter your mobile number" required>
					</div>

					<!-- Email -->
					<div class="mb-3">
						<label for="email" class="form-label">Email</label> <input
							type="email" class="form-control" id="email" name="email"
							placeholder="Enter your email" required>
						<div id="emailHelp" class="form-text">We'll never share your
							email with anyone else.</div>
					</div>

					<!-- Address -->
					<div class="mb-3">
						<label for="address" class="form-label">Address</label>
						<textarea class="form-control" id="address" name="address"
							rows="2" placeholder="Enter your address" required></textarea>
					</div>

					<!-- Qualification -->
					<div class="mb-3">
						<label for="qualification" class="form-label">Qualification</label>
						<select class="form-select" id="qualification"
							name="qualification" required>
							<option value="" selected disabled>Select your
								qualification</option>
							<option value="High School">High School</option>
							<option value="Bachelor's Degree">Bachelor's Degree</option>
							<option value="Master's Degree">Master's Degree</option>
							<option value="Other">Other</option>
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
	


		<%if (request.getAttribute("message") != null) {%>
		Swal.fire({
		  icon: 'success',
		  title: 'Success!',
		  text: '<%=request.getAttribute("message")%>',
		  showConfirmButton: true,
		}).then((result) => {
		      if (result.isConfirmed) {
		          // Redirect to the student form page or any other URL
		          window.location.href = '/studentform';  // Replace with your desired URL
		        }
		      });
		<%}%>

</script>
</html>
<%
} catch (Exception e) {

}
%>