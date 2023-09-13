<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer List</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Define styles for even and odd rows */
        .even {
            background-color: #f2f2f2;
        }
        .odd {
            background-color: #ffffff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Customer List</h1>
        <a href="EMIEligibilityCheck.jsp" class="btn btn-success">Check Eligibility</a>
        <br>
        <br>
        
        <a href="input.jsp" class="btn btn-primary">Apply for Loan</a>
        
         <br>
        <br>
        
        <button id="viewListButton" class="btn btn-primary">View Loans</button>
        
        <div id="customerData" style="display: none;">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Date of Birth</th>
                        <th>PAN No</th>
                        <th>Mobile</th>
                        <th>Address</th>
                        <th>Last User</th>
                        <th>Guardian Name</th>
                        <th>Last Updated Date</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
    <c:forEach items="${CustomerLists}" var="customer" varStatus="status">
        <tr >
            <td>${customer.id}</td>
            <td>${customer.firstName}</td>
            <td>${customer.lastName}</td>
            <td>${customer.dob}</td>
            <td>${customer.pan}</td>
            <td>${customer.mobile}</td>
            <td>${customer.address}</td>
            <td>${customer.custLUser}</td>
            <td>${customer.guardianName}</td>
            <td>${customer.lastUpdatedDate}</td>
            <td>
    <c:set var="loanStatus" value="Not Available" />
    <c:forEach items="${loanApplicants}" var="loan">
        <c:if test="${loan.customerId == customer.id}">
            <!-- Update loanStatus variable when a matching loan is found -->
            <c:set var="loanStatus" value="${loan.status}" />
        </c:if>
        
        
        
        
    </c:forEach>
    <!-- Display the loan status here, outside the inner loop -->
    ${loanStatus}
</td>



		<td>
            <!-- Check if the status is "Accepted" -->
            <c:if test="${loanStatus == 'accepted'}">
                <form action="emiSchedule">
                    <input type="hidden" name="customerId" value="${customer.id}">
                    <button class="btn btn-info btn-sm" type="submit">View EMI</button>
                </form>
            </c:if>
        </td>


        </tr>
    </c:forEach>
</tbody>

            </table>
        </div>
    </div>

    <!-- Include Bootstrap JavaScript and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // Add a click event listener to the "View Loans" button
        $(document).ready(function() {
            $("#viewListButton").click(function() {
                // Toggle the display of the customer data section
                $("#customerData").toggle();
            });
        });
        
        
         
   

    </script>
</body>
</html>