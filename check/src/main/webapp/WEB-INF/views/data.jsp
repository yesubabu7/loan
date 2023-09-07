<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Details</title>
</head>
<body>
    <div>
        <h2>Customer Details</h2>
        
        <p><strong>First Name:</strong> ${customerName}</p>
        <p><strong>Last Name:</strong> ${lastName}</p>
        <p><strong>PAN Number:</strong> ${panNumber}</p>
        <p><strong>Nominee Relation:</strong> ${nomineeRelation}</p>
        <p><strong>CIBIL Score:</strong> ${cibilScore}</p>
        <p><strong>Status:</strong> ${status}</p>
        
        <!-- You can add more fields here as needed -->
    </div>
</body>
</html>
