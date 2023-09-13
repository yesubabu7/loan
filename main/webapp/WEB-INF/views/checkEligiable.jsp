<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Check Eligibility</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            background-color: #333;
            color: #eee;
            padding: 20px;
            margin: 0;
        }

        button {
            background-color: #333;
            color: #eee;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        #container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        #result {
            display: none;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Welcome to Eligibility Checker</h1>
    <br> <br> <br>
    <div class="container">
        <button id="checkButton" class="btn btn-primary"><a href="EMIEligibilityCheck.jsp" style="color: #fff;">Check Eligibility</a></button>
        <div id="result" style="display: none;">
        </div>
    </div>

    <!-- Include Bootstrap JavaScript and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        // JavaScript code to handle button click
        document.getElementById("checkButton").addEventListener("click", function() {
            document.getElementById("result").style.display = "block";
        });
    </script>
</body>
</html>
