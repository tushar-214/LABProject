<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="java.io.BufferedReader,java.io.InputStreamReader,java.net.HttpURLConnection,java.net.URL"%>
	<%@ page import="java.util.List" %>
<%@ page import="com.example.model.StudentSeatBooking" %>
<%
try {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bootstrap Table Example</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    
    <!-- Custom CSS for Styling -->
    
    <style>
        .table-container {
            margin-top: 50px;
        }
        .table th, .table td {
            vertical-align: middle;
        }
  
    </style>
</head>
<body>
    <div class="container table-container">
        <h4 class="text-center mb-4">Admission Student Data</h4>
        
        <div class="mb-5"> <a href="/seatBooking" class="btn btn-outline-primary" role="button">New Admission</a> </div>
        
        <div class="table-responsive">
            <table class="table  table-hover table-bordered align-middle" id="exampleTable">
                <thead class="table-dark">
                    <tr>
                        <th>Student Name</th>
                        <th>Mobile</th>
                        <th>Seat No</th>
                        <th>Date</th>
                        <th>Seat Type</th>
                        <th class="">Status</th>
                        <th class="text-center">Action</th>          
                    </tr>
                </thead>
                <tbody >
                
               <%      

               
               // Retrieve the studentData list from the request
               List<StudentSeatBooking> bookDetails = (List<StudentSeatBooking>) request.getAttribute("seating");
               if (bookDetails != null && !bookDetails.isEmpty()) {
                   for (StudentSeatBooking student : bookDetails) {
           %>
               
                    <tr>
                        <td><%=student.getName() %></td>
                        <td><%=student.getMobile() %></td>
                        <td style="color:red;"><b><%=student.getSeatId() %></b></td>           
                        <td><%=student.getDate() %></td>
                        <td><%=student.getSeattype()%></td>
                        <td><span class="badge bg-success">Active</span></td>    
                        <td class="text-center">
					        <!-- Edit Icon -->
					        <a href="#" class="text-primary me-3" title="Edit">
					            <i class="bi bi-pencil-square"></i>
						        </a>
						        <!-- Delete Icon -->
					         <a href="#" class="text-danger" id="deleteButton_<%=student.getSeatId()%>" title="Delete" 
							       onclick="deleteSeat('<%=student.getSeatId()%>')">
							        <i class="bi bi-trash-fill"></i>
	    </a>
					        </a>
					    </td>
                    </tr>     
                    
                    <%
                   } 
               }
                   else {
                       %>
                       <tr>
                           <td colspan="5" class="text-center text-danger">No student data available</td>
                       </tr>
                       <%
                           }
                       %>  
                </tbody>
            </table>
        </div>
    </div>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#exampleTable').DataTable({
                paging: true, // Enable paging
                ordering: true, // Enable ordering
                info: true, // Show table info
                searching: true, // Enable search
                lengthMenu: [5, 10, 15], // Define page lengths
                pageLength: 5 // Default page length
            });
        });
        
        function deleteSeat(seatId) {
            if (confirm("Are you sure you want to delete this seat?")) {
                fetch('/seatdelete/' + seatId, {
                    method: 'DELETE', // Use the DELETE HTTP method
                    headers: {
                        'Content-Type': 'application/json'
                    }
                })
                .then(response => response.json())  // Parse the response as JSON
                .then(data => {
                    if (data.message === "Student Deleted successfully!") {
                        alert('Seat deleted successfully!');
                        window.location.reload(); // Reload the page after successful deletion
                    } else {
                        alert('Seat NOT deleted successfully!');
                    }
                })
                .catch(error => console.error('Error:', error));
            }
        }

        
    </script>
</body>
</html>
<%
} catch (Exception e) {

}
%>
