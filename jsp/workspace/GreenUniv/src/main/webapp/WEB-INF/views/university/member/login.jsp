<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>그린대학교 | 로그인</title>
  <!-- 로그인 전용 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/member/login.css">
</head>
<body>
  <div id="wrapper">
    <%@ include file="/WEB-INF/views/_header.jsp" %>

    <!-- breadcrumb -->
    <div class="background">
      <div class="container">
        <div class="sub-nav">
          <ul>
            <li><a href="/"><img src="${pageContext.request.contextPath}/images/ico-home.png" height="15" alt="홈"></a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li><a href="#">회원</a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/university/member/login.do">로그인</a></li>
          </ul>
        </div>
      </div>
    </div>

    <!-- 메인: 로그인 -->
    <main>
      <div class="login-wrap">
        <h2 class="login-title">LOGIN</h2>
        <p class="login-desc">로그인을 하시면 더 다양한 서비스를 받을 수 있습니다.</p>

        <form class="login-form" id="loginForm" method="post" action="${pageContext.request.contextPath}/member/login.do" novalidate>
          <!-- 구분 -->
          <div class="role">
            <label><input type="radio" name="role" value="student" checked> 학부생</label>
            <label><input type="radio" name="role" value="staff"> 교직원</label>
            <label><input type="radio" name="role" value="outsider"> 일반인</label>
          </div>

          <!-- 아이디/비밀번호 -->
          <input type="text" id="uid" name="user_id" placeholder="아이디" required>
          <input type="password" id="pw" name="pass" placeholder="비밀번호" required>

          <!-- 로그인 버튼 -->
          <button type="submit" class="btn-login">로그인</button>
          
          <!-- 링크 -->
          <div class="login-links">
            <a href="#">아이디/비밀번호 찾기</a>
            <a href="./signup.do">회원가입</a>
          </div>
        </form>

        <!-- 안내 -->
        <div class="login-help">
          <strong>| 아이디, 비밀번호 안내</strong>
          · 대학 구성원(학부, 교직원)은 회원가입 없이 교번/학번 계정으로 로그인 가능합니다.<br>
          · 비밀번호 분실 시 학생지원팀에 방문하여 초기화 가능합니다.<br>
          · 재학, 휴학, 졸업 유예인 경우 사용이 가능하며, 매년 학적변동 시 상태가 변경됩니다.<br>
          · 문의사항은 담당자(055-123-4567)에게 연락 바랍니다.
        </div>
      </div>
    </main>

    <%-- 푸터 부분 포함 --%>
    <%@ include file="/WEB-INF/views/_footer.jsp" %>

  <script>
    // 주요사이트 이동
    document.getElementById('sites').addEventListener('change', function(){
      if(this.value){ window.open(this.value, '_blank'); this.selectedIndex = 0; }
    });
  </script>
  	
	<!-- ResultCode 출력 -->
	<%
		String code = request.getParameter("code");
		
		if(code != null) {
			int resultCode = Integer.parseInt(code);
	
			if(resultCode == 101){ // LOGIN_FAIL
	%>
			<script>alert("로그인에 실패하였습니다. 아이디/비밀번호를 확인해 주십시오.");</script>
	<%
			} else if(resultCode == 200) { // REGISTER_SUCCESS
	%>
			<script>alert("회원가입이 완료되었습니다.");</script>
	<%
        }
    }
	%>
</body>
</html>
