<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Access Denied</title>
</head>
<body>
    <h2>Access Denied - You are not authorized to access this resource</h2>
    <hr>
    <p>Redirecting to the home page in <span id="countdown">3</span> seconds...</p>
    <a href="${pageContext.request.contextPath}/">Back to Home Page</a>
    
    <script>
        // 카운트다운을 시작하고 3초 뒤에 페이지를 리디렉션합니다.
        let countdown = 3;
        const countdownElement = document.getElementById('countdown');
        
        function updateCountdown() {
            countdown--;
            countdownElement.textContent = countdown;
            
            if (countdown === 0) {
                // 3초 후에 홈 페이지로 리디렉션
                console.log("Redirecting to Home Page");
                location.href = '/';
            } else {
                // 1초마다 업데이트
                setTimeout(updateCountdown, 1000);
            }
        }
        
        // 페이지 로딩 후 카운트다운 시작
        updateCountdown();
    </script>
</body>
</html>
