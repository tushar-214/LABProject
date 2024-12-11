<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.StudentInfo" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Responsive DataTable with Bootstrap</title>

    <!-- Include jQuery and Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- DataTables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/dataTables.bootstrap5.min.css">
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/dataTables.bootstrap5.min.js"></script>

    <!-- Custom CSS -->
    <style>
		   .custom-table-border {
		    border-collapse: collapse; /* Ensures borders are collapsed for uniformity */
		}
		
		.custom-table-border th, .custom-table-border td {
		    border: 1px solid #dee2e6; /* Light gray border for table headers and cells */
		    padding: 8px; /* Padding for better readability */
		}
		
		.custom-table-border th {
		    background-color: #f8f9fa; /* Light background color for headers */
		    text-align: left; /* Align text to the left in the headers */
		}
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 20px;
        }

        .card {
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            margin-top: 100px;
        }

        /* Ensuring the table is responsive and scrollable */
        .table-responsive {
            max-width: 100%;
            overflow-x: auto;
        }

        table {
            width: 100%;
            table-layout: fixed; /* Prevent columns from expanding */
        }

        th, td {
            text-align: left;
            word-wrap: break-word;
            white-space: normal; /* Ensure text wraps */
        }
    </style>
</head>
<body>
<jsp:include page="index.jsp" />
    <div class="container ">
        <div class="card">
            <div class="card-header bg-secondary text-white text-center fw-bold">
                <h5 class="mb-2 mt-3" style="font-size: 30px;">Student Registration Details</h5>
            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table id="example" class="table display responsive nowrap custom-table-border" style="width: 100%">
                    
                        <thead>
                            <tr>
                                <th style="width:20%;">Student Name</th>
                                <th style="width:15%;">Mobile NO</th>
                                <th style="width:20%;" >Email ID</th>
                                <th style="width:30%;">Address</th>
                                <th style="width:15%;">Qualification</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                // Retrieve the studentData list from the request
                                List<StudentInfo> studentData = (List<StudentInfo>) request.getAttribute("studentData");
                                if (studentData != null && !studentData.isEmpty()) {
                                    for (StudentInfo student : studentData) {
                            %>
                            <tr>
                                <td style="width:20%; word-wrap: break-word; white-space: normal; "><%= student.getName() %></td>
                                <td style="width:15%; word-wrap: break-word; white-space: normal; "><%= student.getMobile() %></td>
                                <td style="width:20%; word-wrap: break-word; white-space: normal; "><%= student.getEmail() %></td>
                                <td style="width:30%; word-wrap: break-word; white-space: normal; "><%= student.getAddress() %></td>
                                <td style="width:15%; word-wrap: break-word; white-space: normal; " ><%= student.getQualification() %></td>
                            </tr>
                            <%
                                    }
                                } else {
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
        </div>
    </div>

    <!-- DataTable Initialization -->
    <script>
        $(document).ready(function () {
            $('#example').DataTable({
                responsive: true,
                paging: true,
                searching: true,
                ordering: true,
                info: true
            });
        });
    </script>
</body>

</html>
