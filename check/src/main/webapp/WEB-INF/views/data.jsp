<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.16.8/xlsx.full.min.js"></script>

<%@ page import="yesu.models.*" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Details</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h2 class="mt-5">Customer Details</h2>
        
        <c:set var="loanApplicationForm" value="${requestScope.loanApplicationForm}" />
        <c:set var="loanList" value="${requestScope.loanList}" />
        
        <div class="mt-3">
            <label for="emiRangeFilter">Filter by EMI Range:</label>
            <input type="text" id="emiRangeFilter" class="form-control" placeholder="Enter EMI Range" onkeyup="filterTable()">
        </div>

        <div class="mt-3">
            <label for="amountFilter">Filter by Loan Amount:</label>
            <input type="text" id="amountFilter" class="form-control" placeholder="Enter Loan Amount" onkeyup="filterAmount()">
        </div>
        
        

        <h5 class="mt-5">Loan Applicants</h5>
        <table class="table table-bordered mt-3">
            <thead class="thead-dark">
                <tr>
                    <th>Applicant ID</th>
                    <th>Amount</th>
                    <th>EMI Range</th>
                    <th>no Of MOnths</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${loanList}" var="loanApplicant">
                    <tr>
                        <td>${loanApplicant.id}</td>
                        <td>${loanApplicant.amount}</td>
                        <td>${loanApplicant.emiRangeFrom} - ${loanApplicant.emiRangeTo}</td>
                        <td>${loanApplicant.nominatedAmount}</td>
                        <td>
                            <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#details-${loanApplicant.id}">
                                View Details
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="5" class="collapse" id="details-${loanApplicant.id}">
                            <!-- Details content here -->
                            <p><strong>Applicant ID:</strong> ${loanApplicant.id}</p>
                            <p><strong>Amount:</strong> ${loanApplicant.amount}</p>
                            <p><strong>No Of Months:</strong> ${loanApplicant.noOfMonths}</p>
                            <p><strong>Emi-Range:</strong> ${loanApplicant.emiRangeFrom} - ${loanApplicant.emiRangeTo}</p>
                            <p><strong>Nominated Amount:</strong> ${loanApplicant.nominatedAmount}</p>
                            <p><strong>Processed ID:</strong> ${loanApplicant.processedUserId}</p>
                            <p><strong>Status:</strong>${loanApplicant.status}</p>
                            <form action="acceptOrReject" method="post">
                                <input type="hidden" name="applicantId" value="${loanApplicant.id}">
                                <input type="hidden" name="customerId" value="${loanApplicant.customerId}">
                                <button type="submit" name="action" value="Accept" class="btn btn-success">Accept</button>
                                <button type="submit" name="action" value="Reject" class="btn btn-danger">Reject</button>
                            	<button id="downloadExcel" class="btn btn-primary">Download as Excel</button>
                            	
                            </form>
                            
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Include Bootstrap JavaScript and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <script>
    // Filter the table based on EMI range input
    
    
    
    // Function to download table data as Excel
function downloadTableAsExcel() {
    // Select the table element
    var table = document.querySelector(".table");
    
    // Create a new workbook
    var wb = XLSX.utils.table_to_book(table, { sheet: "Sheet1" });
    
    // Generate a blob object containing the Excel data
    var blob = XLSX.write(wb, { bookType: "xlsx", type: "blob" });
    
    // Create a temporary download link
    var url = URL.createObjectURL(blob);
    var a = document.createElement("a");
    a.href = url;
    a.download = "table_data.xlsx";
    
    // Trigger the download
    document.body.appendChild(a);
    a.click();
    
    // Clean up
    window.URL.revokeObjectURL(url);
    document.body.removeChild(a);
}

// Attach the downloadTableAsExcel function to the button click event
document.getElementById("downloadExcel").addEventListener("click", downloadTableAsExcel);



    function filterTable() {
        var emiInput, filterEmi, table, tr, tdEmi, i, txtValueEmi;
        emiInput = document.getElementById("emiRangeFilter");
        filterEmi = emiInput.value.toUpperCase();
        table = document.querySelector(".table");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows
        for (i = 1; i < tr.length; i += 2) { // Skip details rows
            tdEmi = tr[i].getElementsByTagName("td")[2]; // Assuming EMI range is in the third column

            if (tdEmi) {
                txtValueEmi = tdEmi.textContent || tdEmi.innerText;

                // Check if the EMI range includes the filter text
                if (txtValueEmi.toUpperCase().indexOf(filterEmi) > -1) {
                    tr[i - 1].style.display = ""; // Show corresponding details row
                    tr[i].style.display = ""; // Show data row
                } else {
                    tr[i - 1].style.display = "none"; // Hide corresponding details row
                    tr[i].style.display = "none"; // Hide data row
                }
            }
        }
    }

    // Filter the table based on loan amount input
    function filterAmount() {
        var amountInput, filterAmount, table, tr, tdAmount, i, txtValueAmount;
        amountInput = document.getElementById("amountFilter");
        filterAmount = parseFloat(amountInput.value); // Parse the entered amount as a float
        table = document.querySelector(".table");
        tr = table.getElementsByTagName("tr");

        // Loop through all table rows
        for (i = 1; i < tr.length; i += 2) { // Skip details rows
            tdAmount = tr[i].getElementsByTagName("td")[1]; // Assuming Loan Amount is in the second column

            if (tdAmount) {
                txtValueAmount = parseFloat(tdAmount.textContent || tdAmount.innerText);

                // Check if the loan amount is greater or equal to the filter amount
                if (!filterAmount || txtValueAmount >= filterAmount) {
                    tr[i - 1].style.display = ""; // Show corresponding details row
                    tr[i].style.display = ""; // Show data row
                } else {
                    tr[i - 1].style.display = "none"; // Hide corresponding details row
                    tr[i].style.display = "none"; // Hide data row
                }
            }
        }
    }
    </script>
</body>
</html>
