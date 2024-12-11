<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Basic Footer</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
	<style>
	/* Basic CSS for the footer */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
}

footer {
    background-color: #333;
    color: white;
    padding: 20px;
    text-align: center;
    position: fixed;
    bottom: 0;
    width: 100%;
}

.footer-content {
    max-width: 1200px;
    margin: 0 auto;
}

.footer-links a {
    color: #f1f1f1;
    text-decoration: none;
    margin: 0 10px;
}

.footer-links a:hover {
    text-decoration: underline;
}

.social-icons {
    margin-top: 10px;
}

.social-icons .social-icon {
    color: #f1f1f1;
    text-decoration: none;
    margin: 0 10px;
}

.social-icons .social-icon:hover {
    color: #007bff; /* Change color on hover */
}

	
	
	
	
	
	
	</style>
</head>
<body>
    <!-- Content of the page -->

    <!-- Footer Section -->
    <footer>
        <div class="footer-content">
            <p>&copy; 2024 Your Company. All rights reserved.</p>
            <div class="footer-links">
                <a href="#">Privacy Policy</a> |
                <a href="#">Terms of Service</a> |
                <a href="#">Contact Us</a>
            </div>
            <div class="social-icons">
                <a href="#" class="social-icon">Facebook</a>
                <a href="#" class="social-icon">Twitter</a>
                <a href="#" class="social-icon">LinkedIn</a>
            </div>
        </div>
    </footer>
</body>
</html>
