<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1>Admin Login</h1>
        <!-- Your admin login form goes here -->
        <form action="adminLogin" method="post">
            <!-- Add your input fields for admin username and password here -->
            <div class="form-group">
                <label for="adminUsername">Admin Username:</label>
                <input type="text" class="form-control" id="adminUsername" name="username" required>
            </div>
            <div class="form-group">
                <label for="adminPassword">Admin Password:</label>
                <input type="password" class="form-control" id="adminPassword" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
    </div>

    <!-- Include Bootstrap JavaScript and jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>