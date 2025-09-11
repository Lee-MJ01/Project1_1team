<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>그린대학교 | 회원가입</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;600;700&display=swap" rel="stylesheet">
  <!-- 공통 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/member/common.css">
  <!-- signup 전용 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/member/signup.css">
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
            <li class="active"><a href="#">회원가입</a></li>
          </ul>
        </div>
      </div>
    </div>

	<!-- 메인: 회원가입 -->
	<main>
	<div class="join-wrap">
	<div class="container">
		<div class="card">
			<div class="card__head">
				<h2 class="card__title">회원가입</h2>
			</div>
			<p class="card__desc">
				반갑습니다 그린대학교 입니다. 회원가입 후 학번 정보를 이용하세요.<br>
				대학구성원(학생, 교직원)은 학번/교번 없이 학번, 교사(사번) 아이디를 사용하여 로그인할 수 있습니다.
			</p>
			<div class="divider"></div>

			<form class="form-table" id="joinForm" method="post" action="${pageContext.request.contextPath}/member/signup.do" novalidate>
             
			<!-- 아이디 -->
			<div class="row">
				<div class="th-1">아이디<span class="req">*</span></div>
				<div class="td">
					<div class="input-with-btn">
						<input type="text" id="uid" name="user_id" minlength="4" maxlength="10" placeholder="아이디 입력" required>
						<button type="button" class="btn_sub" onclick="checkId()">중복확인</button>
					</div>
					<span id="idMsg" class="msg">영문·숫자 조합 4~10자 이내</span>
				</div>
			</div>
              
			<!-- 비밀번호 -->
			<div class="row">
				<div class="th-1">비밀번호<span class="req">*</span></div>
				<div class="td">
					<input type="password" id="pw" name="pass" minlength="8" maxlength="16" placeholder="비밀번호 입력" required>
					<span id="passMsg" class="msg">비밀번호는 8~16자리 이내, 영문 · 숫자 · 특수문자 조합</span>
				</div>
			</div>
              
			<!-- 비밀번호 확인 -->
			<div class="row">
				<div class="th-2">비밀번호 확인<span class="req">*</span></div>
				<div class="td">
					<input type="password" id="pw2" name="pass2" minlength="8" maxlength="16" placeholder="비밀번호 확인 입력" required>
					<span id="passMsg" class="msg"></span>
				</div>
			</div>
              
			<!-- 이름 -->
			<div class="row">
				<div class="th-2">이름<span class="req">*</span></div>
				<div class="td"><input type="text" id="name" name="user_name" placeholder="이름 입력" required></div>
			</div>
             
			<!-- 휴대폰 -->
			<div class="row">
				<div class="th-2">휴대폰<span class="req">*</span></div>
				<div class="td">
					<input type="text" id="phone" name="hp" inputmode="numeric" maxlength="13" placeholder="휴대폰 입력" required>
					<span id="hpMsg" class="msg"></span>
				</div>
			</div>
              
			<!-- 이메일 -->
			<div class="row">
				<div class="th-2">이메일<span class="req">*</span></div>
				<div class="td">
					<div class="input-with-btn">
						<input type="email" id="email" name="email" placeholder="이메일 입력" required>
						<button type="button" class="btn_sub" onclick="sendAuth()">인증번호 받기</button>
              		</div>
              		<span id="emailMsg" class="msg"></span>
				</div>
			</div>
              
			<!-- 주소 -->
			<div class="row">
				<div class="th-3">주소</div>
                <div class="td">
                	<div class="input-with-btn">
						<input type="text" id="zipcode" name="zipcode" readonly placeholder="우편번호">
						<button type="button" class="btn_sub" onclick="findZip()">우편번호 찾기</button>
					</div>
					
					<input type="text" id="addr1" name="addr1" readonly="readonly" placeholder="주소 검색">
					<input type="text" id="addr2" name="addr2" placeholder="상세주소 입력">
				</div>
			</div>
              
			<!-- 버튼 -->
			<div class="actions">
				<p class="form-note">* 필수 입력</p>
				<button type="button" class="btn" onclick="history.back()">취소</button>
				<button type="submit" class="btn primary">회원가입</button>
			</div>
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
    
    // 휴대폰 자동 하이픈
    const phone = document.getElementById('phone');
    phone.addEventListener('input', (e)=>{
      let v = e.target.value.replace(/[^0-9]/g,'').slice(0,11);
      if(v.length > 3 && v.length <= 7) v = v.replace(/(\d{3})(\d+)/, '$1-$2');
      else if(v.length > 7) v = v.replace(/(\d{3})(\d{4})(\d+)/, '$1-$2-$3');
      e.target.value = v;
    });
    
    // 간단 검증
    document.getElementById('joinForm').addEventListener('submit', (e)=>{
      const id = document.getElementById('uid').value.trim();
      const pw = document.getElementById('pw').value;
      const pw2 = document.getElementById('pw2').value;
      if(!/^[a-zA-Z0-9]{4,10}$/.test(id)){
        e.preventDefault(); alert('아이디는 영문/숫자 4~10자입니다.');
      } else if(pw !== pw2){
        e.preventDefault(); alert('비밀번호가 일치하지 않습니다.');
      }
    });
    
    // ID 입력값 출력 검증
    const uid = document.getElementById('uid');
    const idMsg = document.getElementById('idMsg');

    uid.addEventListener('input', () => {
      const val = uid.value.trim();

      if(val.length === 0){
        idMsg.textContent = "영문·숫자 조합 4~10자 이내";
        idMsg.className = "msg info";
      }
      else if(!/^[a-zA-Z0-9]{4,10}$/.test(val)){
        idMsg.textContent = "아이디가 유효하지 않습니다.";
        idMsg.className = "msg error";
      }
      else {
        idMsg.textContent = "사용 가능한 아이디입니다.";
        idMsg.className = "msg success";
      }
    });
    
 	// 입력값 출력 검증
    const uid = document.getElementById('uid');
    const idMsg = document.getElementById('idMsg');

    uid.addEventListener('input', () => {
      const val = uid.value.trim();

      if(val.length === 0){
        idMsg.textContent = "영문·숫자 조합 4~10자 이내";
        idMsg.className = "msg info";
      }
      else if(!/^[a-zA-Z0-9]{4,10}$/.test(val)){
        idMsg.textContent = "아이디가 유효하지 않습니다.";
        idMsg.className = "msg error";
      }
      else {
        idMsg.textContent = "사용 가능한 아이디입니다.";
        idMsg.className = "msg success";
      }
    });
    
    // 입력값 출력 검증
    const uid = document.getElementById('uid');
    const idMsg = document.getElementById('idMsg');

    uid.addEventListener('input', () => {
      const val = uid.value.trim();

      if(val.length === 0){
        idMsg.textContent = "영문·숫자 조합 4~10자 이내";
        idMsg.className = "msg info";
      }
      else if(!/^[a-zA-Z0-9]{4,10}$/.test(val)){
        idMsg.textContent = "아이디가 유효하지 않습니다.";
        idMsg.className = "msg error";
      }
      else {
        idMsg.textContent = "사용 가능한 아이디입니다.";
        idMsg.className = "msg success";
      }
    });

  </script>
  
	<%
		String agree = request.getParameter("agree");
		if(agree == null || !"Y".equals(agree)){
			response.sendRedirect("terms.do"); // 약관 미동의 시 다시 terms 페이지
        	return;
    	}
	%>
</body>
</html>
