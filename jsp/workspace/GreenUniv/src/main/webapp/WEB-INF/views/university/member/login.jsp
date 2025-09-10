<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>그린대학교 | 로그인</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;600;700&display=swap" rel="stylesheet">
  <!-- 공통 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/member/common.css">
  <!-- 로그인 전용 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/member/login.css">
</head>
<body>
  <div id="wrapper">
    <!-- 헤더 -->
    <header>
      <div class="topbar">
        <div class="container topbar__nav" role="navigation" aria-label="상단 빠른 메뉴">
          <ul class="topbar__list">
            <li class="topbar__item"><a href="#">HOME</a></li>
            <li class="topbar__item"><a href="#">사이트맵</a></li>
            <li class="topbar__item"><a href="#">로그인</a></li>
            <li class="topbar__item"><a href="#">학사지원</a></li>
          </ul>
        </div>
      </div>
      <nav class="gnb" role="navigation" aria-label="주 메뉴">
        <div class="container gnb__inner">
          <a href="/" aria-label="그린대학교 홈"><img class="brand__logo" src="${pageContext.request.contextPath}/images/header_logo.png" alt="그린대학교"></a>
          <ul class="menu__list">
            <li><a class="menu__link" href="#">대학소개</a></li>
            <li><a class="menu__link" href="#">입학안내</a></li>
            <li><a class="menu__link" href="#">대학·대학원</a></li>
            <li><a class="menu__link" href="#">학사안내</a></li>
            <li><a class="menu__link" href="#">대학생활</a></li>
            <li><a class="menu__link" href="#">커뮤니티</a></li>
          </ul>
        </div>
      </nav>
    </header>

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

        <form class="login-form" id="loginForm" novalidate>
          <!-- 구분 -->
          <div class="role">
            <label><input type="radio" name="role" value="student" checked> 학부생</label>
            <label><input type="radio" name="role" value="staff"> 교직원</label>
            <label><input type="radio" name="role" value="outsider"> 일반인</label>
          </div>

          <!-- 25.09.09 수정 전
          아이디/비밀번호
          <input type="text" id="uid" placeholder="아이디" required>
          <input type="password" id="pw" placeholder="비밀번호" required>

          로그인 버튼
          <button type="submit" class="btn-login">로그인</button>
          -->
          
          <!-- 폼 제출로 로그인 (25.09.09 천수빈 수정) -->
          <form method="post" action="${pageContext.request.contextPath}/university/member/login.do">
	          <input type="text" 	 id="user_id" name="user_id"  placeholder="아이디" required />
	          <input type="password" id="pass" 	  name="pass"  placeholder="비밀번호" required />
	          <button type="submit"  class="btn-login">로그인</button>
		  </form>
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

    <!-- 푸터 -->
    <footer class="footer">
      <div class="footer__top">
        <div class="container footer__nav">
          <ul class="footer__list">
            <li class="footer__item"><a class="footer__link" href="#">개인정보처리방침</a></li>
            <li class="footer__item"><a class="footer__link" href="#">통합정보시스템</a></li>
            <li class="footer__item"><a class="footer__link" href="#">학사일정</a></li>
            <li class="footer__item"><a class="footer__link" href="#">주요인원 연락처</a></li>
            <li class="footer__item"><a class="footer__link" href="#">교내공지사항</a></li>
          </ul>
        </div>
      </div>
      <div class="footer__body">
        <div class="container footer__inner">
          <img class="footer__logo" src="${pageContext.request.contextPath}/images/footer_logo.png" alt="그린대학교 로고">
          <div>
            <ul class="footer__info">
              <li><strong>그린대학교</strong></li>
              <li>[12345] 부산광역시 부산진구 부전대로 123 / 대표전화 : 051-123-1000</li>
              <li>입학안내 : 051-123-1302 · 팩스 : 051-123-3333</li>
            </ul>
            <div class="footer__copy">copyright © Green University. All rights reserved.</div>
          </div>
          <div class="footer__select">
            <label for="sites" class="sr-only" style="position:absolute;left:-9999px">주요사이트</label>
            <select id="sites" class="select" name="sites">
              <option value="">주요사이트</option>
              <option value="https://www.busanbank.co.kr/ib20/mnu/BHP00001">BNK부산은행</option>
              <option value="/academic/index.html">학사관리시스템</option>
            </select>
          </div>
        </div>
      </div>
    </footer>
  </div>

  <script>
    // 주요사이트 이동
    document.getElementById('sites').addEventListener('change', function(){
      if(this.value){ window.open(this.value, '_blank'); this.selectedIndex = 0; }
    });
  </script>
</body>
</html>
