<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<!-- 09.11 천수빈 수정 --> 
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
             
						<!-- 아이디 + 상태 메세지 -->
						<div class="row">
							<div class="th">아이디<span class="req">*</span></div>
							<div class="td">
								<div class="input-with-btn">
									<input type="text" id="uid" name="user_id" minlength="4" maxlength="10" placeholder="아이디 입력" required>
									<button type="button" class="btn_sub" onclick="checkId()">중복확인</button>
								</div>
								<span id="idMsg" class="msg">영문·숫자 조합 4~10자 이내</span>
							</div>
						</div>
	              
						<!-- 비밀번호 + 상태 메세지 -->
						<div class="row">
							<div class="th">비밀번호<span class="req">*</span></div>
							<div class="td">
								<input type="password" id="pass1" name="pass" minlength="8" maxlength="16" placeholder="비밀번호 입력" required>
								<span id="pass1Msg" class="msg">비밀번호는 8~16자리 이내, 영문 · 숫자 · 특수문자 조합</span>
							</div>
						</div>
	              
						<!-- 비밀번호 확인 -->
						<div class="row">
							<div class="th">비밀번호 확인<span class="req">*</span></div>
							<div class="td">
								<input type="password" id="pass2" name="pass2" minlength="8" maxlength="16" placeholder="비밀번호 확인 입력" required>
								<span id="pass2Msg" class="msg"></span>
							</div>
						</div>
	              
						<!-- 이름 -->
						<div class="row">
							<div class="th">이름<span class="req">*</span></div>
							<div class="td"><input type="text" id="name" name="user_name" placeholder="이름 입력" required></div>
						</div>
	             
						<!-- 휴대폰 -->
						<div class="row">
							<div class="th">휴대폰<span class="req">*</span></div>
							<div class="td">
								<input type="text" id="phone" name="hp" inputmode="numeric" maxlength="13" placeholder="휴대폰 입력" required>
								<span id="hpMsg" class="msg"></span>
							</div>
						</div>
	              
						<!-- 이메일 + 인증번호 전송 버튼 -->
						<div class="row">
							<div class="th">이메일<span class="req">*</span></div>
							<div class="td">
								<div class="input-with-btn">
									<input type="email" id="email" name="email" placeholder="이메일 입력">
									<button type="button" class="btn_sub" id="sendBtn" onclick="sendCode()">인증번호 전송</button>
			          			</div>
								<div class="input-with-btn" id="authArea" style="display:none; margin-top:6px;">
									<input type="text" id="authCode" placeholder="인증번호 입력">
									<button type="button" class="btn_sub" onclick="checkCode()">확인</button>
								</div>
							</div>
						</div>
	              
						<!-- 우편번호 + 주소 검색 + 상세주소 입력 -->
						<div class="row">
							<div class="th">주소</div>
					        <div class="td">
								<div class="input-with-btn">
					            	<input type="text" id="zipcode" name="zipcode" readonly placeholder="우편번호">
					            	<button type="button" class="btn_sub" onclick="findZip()">우편번호 찾기</button>
								</div>
					      
								<input type="text" id="addr1" name="addr1" readonly placeholder="주소 검색">
								<input type="text" id="addr2" name="addr2" placeholder="상세주소 입력">
							</div>
						</div>
						
						<!-- 에러 메시지 표시 영역 -->
						<c:if test="${not empty errorCode}">
						  <div class="error-msg" style="color:red; margin:10px 0;">
						    <c:choose>
						      <c:when test="${errorCode == 'REGISTER_DUP_USER_ID'}">이미 사용 중인 아이디입니다.</c:when>
						      <c:when test="${errorCode == 'REGISTER_DUP_EMAIL'}">이미 등록된 이메일입니다.</c:when>
						      <c:when test="${errorCode == 'REGISTER_DUP_HP'}">이미 등록된 휴대폰 번호입니다.</c:when>
						      <c:when test="${errorCode == 'INVALID_INPUT'}">필수 입력값이 비어 있습니다.</c:when>
						      <c:otherwise>회원가입에 실패했습니다. 입력값을 확인하세요.</c:otherwise>
						    </c:choose>
						  </div>
						</c:if>
	              
						<!-- 하단 버튼 -->
						<div class="actions">
							<p class="form-note">* 필수 입력</p>
							<button type="button" class="btn" onclick="history.back()">취소</button>
							<button type="submit" class="btn primary">회원가입</button>
						</div>
					</form>
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
		const pw = document.getElementById('pass1').value.trim();
		const pw2 = document.getElementById('pass2').value.trim();
		
		if(id.length === 0 || pw.length === 0 || pw2.length === 0){
			e.preventDefault(); 
			alert('아이디와 비밀번호를 모두 입력하세요.');
		}
	});
	</script>

	<!-- 입력값 출력 검증 -->
	<script>
	
	// ID 검증
	const uid = document.getElementById('uid');
	const idMsg = document.getElementById('idMsg');
	
	uid.addEventListener('input', () => {
		const val = uid.value.trim();
	
		if(val.length === 0){
			idMsg.textContent = "영문·숫자 조합 4~10자 이내";
			idMsg.className = "msg info";
		
		} else if(!/^[a-zA-Z0-9]{4,10}$/.test(val)){
		  	idMsg.textContent = "아이디가 유효하지 않습니다.";
		  	idMsg.className = "msg error";
		
		} else {
			idMsg.textContent = "사용 가능한 아이디입니다.";
			idMsg.className = "msg success";
		}
	});
	  
	// Password 검증
	const pass1 = document.getElementById('pass1');
	const pass2 = document.getElementById('pass2');
	const passMsg = document.getElementById('pass1Msg');
	const pass2Msg = document.getElementById('pass2Msg');
	
	const pwRule = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*]).{8,16}$/;
	
	// 비밀번호1 입력 시 규칙 검증 + 일치 여부 확인
	pass1.addEventListener('input', () => {
		const val = pass1.value.trim();

		if(val.length === 0){
			passMsg.textContent = "비밀번호는 8~16자리 이내, 영문 · 숫자 · 특수문자 조합";
			passMsg.className = "msg info";
		} else if(!pwRule.test(val)){
		    passMsg.textContent = "조건에 맞지 않는 비밀번호입니다.";
		    passMsg.className = "msg error";
		} else {
		    passMsg.textContent = "사용 가능한 비밀번호입니다.";
		    passMsg.className = "msg success";
		}
	});
	
	// 비밀번호2 → 타이핑할 때도 체크
	pass2.addEventListener('input', checkPasswordMatch);
	
	// 비밀번호 일치 여부 확인 함수
	function checkPasswordMatch(){
		if(pass1.value.trim() !== pass2.value.trim()){
			pass2Msg.textContent = "비밀번호가 일치하지 않습니다.";
		    pass2Msg.className = "msg error";
		} else {
		    pass2Msg.textContent = "비밀번호가 일치합니다.";
		    pass2Msg.className = "msg success";
		}
	}
	</script>
  
	<!-- 이메일 인증번호 전송 -->
	<script>
	function sendCode() {
		const email = document.getElementById("email").value;
		if(!email) {
		  alert("이메일을 입력하세요.");
		  return;
		}
		
		fetch("${pageContext.request.contextPath}/member/email/sendCode.do", {
		  method: "POST",
		  headers: {"Content-Type": "application/x-www-form-urlencoded"},
		  body: "email=" + encodeURIComponent(email)
		})
		
		.then(res => res.text())
		.then(code => {
		  console.log("서버에서 발급한 인증코드:", code);
		  alert("인증코드가 이메일로 발송되었습니다.");
		  document.getElementById("sendBtn").innerText = "재전송";
		  document.getElementById("authArea").style.display = "flex";
		})
		.catch(err => {
		  console.error(err);
		  alert("메일 발송에 실패했습니다.");
		});
	}
	</script>

	<!-- 주소 API 연결 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	function findZip() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 선택한 우편번호, 주소를 input에 넣기
				document.getElementById("zipcode").value = data.zonecode;
				document.getElementById("addr1").value = data.address;
				document.getElementById("addr2").focus();
			}
		}).open();
	}
	</script>
	
	<script>
	function checkId() {
		  const userId = document.getElementById("uid").value;
		  const idMsg = document.getElementById("idMsg");

		  if (!userId) {
		    idMsg.textContent = "아이디를 입력하세요.";
		    idMsg.className = "msg error";
		    return;
		  }

		  fetch("${pageContext.request.contextPath}/member/checkId.do?user_id=" + encodeURIComponent(userId))
		    .then(res => res.text())
		    .then(result => {
		      if (result.includes("이미")) {
		        idMsg.textContent = result;
		        idMsg.className = "msg error";
		      } else {
		        idMsg.textContent = result;
		        idMsg.className = "msg success";
		      }
		    })
		    .catch(err => {
		      console.error(err);
		      idMsg.textContent = "서버 오류가 발생했습니다.";
		      idMsg.className = "msg error";
		    });
		}
	
	function checkCode() {
		  const code = document.getElementById("authCode").value;
		  if (!code) {
		    alert("인증코드를 입력하세요.");
		    return;
		  }

		  fetch("${pageContext.request.contextPath}/member/email/verifyCode.do?code=" + encodeURIComponent(code))
		    .then(res => res.text())
		    .then(result => alert(result))  // "인증 성공" 또는 "인증 실패"
		    .catch(err => console.error(err));
		}
	</script>

	<!-- terms 페이지 연결 -->
	<%
		String agree = request.getParameter("agree");
		if(agree == null || !"Y".equals(agree)){
			response.sendRedirect("terms.do"); // 약관 미동의 시 다시 terms 페이지
	       	return;
	   	}
	%>
</body>
</html>
