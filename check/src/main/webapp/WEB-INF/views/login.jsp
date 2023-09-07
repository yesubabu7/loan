<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Form</title>
</head>
<body>
    <h2>Login Form</h2>
    
    <form method="post" action="check">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username"><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password"><br><br>
        
        <input type="submit" value="Login">
    </form>

    <%
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null && password != null) {
            if (username.equals("yesu") && password.equals("yesu")) {
                out.println("<p>Login successful!</p>");
            } else {
                out.println("<p>Try again. Invalid username or password.</p>");
            }
        }
    %>
</body>
</html>
