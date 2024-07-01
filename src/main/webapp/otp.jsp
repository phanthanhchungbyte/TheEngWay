<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="icon" href="imgs/favicon/favicon.ico">
    <title>OTP Verification</title>
</head>
<body>
<h2>OTP Verification</h2>
<form action="${pageContext.request.contextPath}/verify-otp" method="post">
    <label for="verificationCode">Enter OTP:</label>
    <input type="text" id="verificationCode" name="verificationCode" required>
    <button type="submit">Verify</button>
</form>
<p>${message}</p>
</body>
</html>