<!DOCTYPE html>
<html>
<head>
    <title>Check Eligibility</title>
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
            background-color: #ffffff;
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
    <form action="check">
    	<button id="checkButton">Check Eligibility</a></button>
    </form>
    
   
    <div id="result" style="display: none;">
    </div>

    <script>
        // JavaScript code to handle button click
        document.getElementById("checkButton").addEventListener("click", function() {
            document.getElementById("result").style.display = "block";
        });
    </script>
</body>
</html>