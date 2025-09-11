<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>학사관리시스템_학사운영_강의 등록</title>

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<style>
/* ===== Design tokens (전 페이지 공통) ===== */
:root {
	--brand-blue: #00518C;
	--brand-dark: #1F2838;
	--text: #222;
	--muted: #333;
	--sidebar-bg: #F5F6F7;
	--card: #FFF;
	--line: #C0C0C0;
	--thead: #F6F8FB;
	--row: #E9EDF3;
	--accent: #1F5E95;
	--sb-icon: 18px;
	--sb-gap: 8px;
	--sb-indent: calc(var(--sb-icon)+ var(--sb-gap));
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box
}

body {
	font-family: 'Noto Sans KR', Arial, system-ui, sans-serif;
	color: var(--text);
	background: #f9f9f9;
	min-height: 100vh;
	display: flex;
	flex-direction: column
}

/* 상단 바 */
.top-menu {
	background: var(--brand-blue);
	height: 30px;
	display: flex;
	align-items: center
}

.top-menu__inner {
	width: 100%;
	display: flex;
	justify-content: flex-end;
	align-items: center;
	padding: 0 40px
}

.top-menu__link {
	color: #fff;
	font-size: 12px;
	line-height: 20px;
	text-decoration: none;
	position: relative;
	padding: 0 10px
}

.top-menu__link+.top-menu__link::before {
	content: "";
	position: absolute;
	left: 0;
	top: 4px;
	width: 1px;
	height: 11px;
	background: rgba(255, 255, 255, .3)
}

/* 브랜드 바 */
.brand-bar {
	background: var(--brand-dark);
	height: 90px;
	border-bottom: 1px solid #dcdcdc;
	position: relative
}

.brand-logo {
	position: absolute;
	left: 260px;
	top: 16px;
	width: 352px;
	height: 52px;
	display: block;
	object-fit: contain
}

@media ( max-width :1200px) {
	.brand-logo {
		left: 24px
	}
}

/* 레이아웃 */
.layout {
	display: flex;
	align-items: flex-start;
	width: min(1400px, 96vw);
	margin: 22px auto 56px;
	gap: 20px;
	flex: 1
}

/* 사이드바 (공통) */
.sidebar {
	flex: 0 0 270px;
	min-height: 840px;
	border-right: 1px solid var(--line);
	background: var(--sidebar-bg)
}

.sidebar-menu {
	padding: 20px 16px;
	font-size: 14px;
	color: var(--muted)
}

.sidebar-menu h3 {
	display: flex;
	align-items: center;
	gap: 8px;
	margin: 20px 0 10px;
	font-size: 16px;
	font-weight: 700;
	color: #111
}

.menu-icon {
	width: 18px;
	height: 18px;
	flex: 0 0 18px
}

.sidebar-menu .menu-group>ul {
	list-style: none;
	margin: 0 0 18px 0;
	padding: 0;
	margin-left: var(--sb-indent)
}

.sidebar-menu li {
	display: flex;
	align-items: center;
	gap: 10px;
	margin: 8px 0;
	line-height: 1.7
}

.sidebar-menu li::before {
	content: "·";
	font-size: 20px;
	line-height: 1;
	color: #7f8790
}

.sidebar-menu a, .sidebar-menu span {
	text-decoration: none;
	color: #333;
	font-weight: 500;
	cursor: pointer
}

.sidebar-menu a:hover, .sidebar-menu span:hover {
	color: var(--brand-blue)
}

/* 본문 카드 */
.main-area {
	flex: 1
}

.page {
	background: var(--card);
	border: 1px solid var(--line)
}

.page__body {
	padding: 16px
}

/* 페이지 헤더(공통 크기/색상) */
.page__header {
	height: 46px;
	border-bottom: 1px solid var(--line);
	padding: 0 16px;
	display: flex;
	align-items: center;
	justify-content: space-between
}

.page__title {
	font-size: 16px;
	font-weight: 700;
	color: #222
}

.page__path {
	font-size: 12px;
	display: flex;
	align-items: center;
	gap: 6px;
	white-space: nowrap
}

.page__path .path__dim {
	color: #666
}

.page__path strong {
	color: #145074;
	font-weight: 500
}

.page__path .path__sep svg {
	width: 12px;
	height: 6px;
	display: block
}

.page__path .path__sep path {
	stroke: #145074
}

/* 섹션 타이틀 */
.section-title {
	display: flex;
	align-items: center;
	gap: 8px;
	font-size: 16px;
	font-weight: 600;
	color: #145074;
	margin: 0 0 10px 0
}

.section-title::before {
	content: "";
	width: 6px;
	height: 20px;
	background: var(--accent);
	border-radius: 1px
}

.page__body {
	padding: 20px;
	margin-top: 4px
}

/* 폼 테이블 */
.form-grid {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0;
	table-layout: fixed;
	font-size: 14px;
	color: #333;
	border-top: 1px solid #D8DEE8
}

.form-grid th, .form-grid td {
	height: 44px;
	background: #fff;
	border-bottom: 1px solid #E1E6EE;
	border-right: 1px solid #E1E6EE;
	padding: 8px 12px;
	vertical-align: middle
}

.form-grid tr>*:first-child {
	border-left: 1px solid #D8DEE8
}

.form-grid th {
	width: 150px;
	background: #FAFBFD;
	text-align: center !important;
	font-weight: 400
}

/* 입력 UI */
.inp, .sel, .ta {
	width: 100%;
	height: 36px;
	padding: 0 10px;
	font-size: 14px;
	color: #333;
	border: 1px solid #cfd6df;
	background: #fff;
	outline: none
}

.inp:focus, .sel:focus, .ta:focus {
	border-color: #A5B4C5
}

.ta {
	height: 120px;
	padding: 10px;
	resize: vertical
}

.sel {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	background-image: linear-gradient(45deg, transparent 50%, #666 50%),
		linear-gradient(135deg, #666 50%, transparent 50%);
	background-position: calc(100% - 16px) 16px, calc(100% - 10px) 16px;
	background-size: 6px 6px, 6px 6px;
	background-repeat: no-repeat
}

/* 유틸 */
.hstack {
	display: flex;
	align-items: center;
	gap: 8px
}

.tilde {
	padding: 0 10px;
	color: #69707c
}

.w120 {
	width: 120px !important;
	max-width: 120px !important
}

.w140 {
	width: 140px !important;
	max-width: 140px !important
}

.w180 {
	width: 180px !important;
	max-width: 180px !important
}

/* 학점 & 담당교수 동일 폭 강제 */
.equal-width .inp, .equal-width .sel {
	width: 180px !important;
	max-width: 180px !important;
}

/* 평가방식/교재 동일 크기 */
.w450 {
	width: 450px !important;
	max-width: 450px !important;
	height: 33px !important;
	line-height: 33px !important
}

.dow {
	display: flex;
	align-items: center;
	gap: 12px;
	margin-left: 12px
}

.dow label {
	display: inline-flex;
	align-items: center;
	gap: 6px;
	font-size: 14px;
	color: #555
}

.dow input[type="checkbox"] {
	width: 14px;
	height: 14px
}

.help {
	font-size: 12px;
	color: #C3482B
}

.section-actions {
	display: flex;
	justify-content: flex-end;
	margin-top: 12px
}

.btn-primary {
	height: 36px;
	padding: 0 22px;
	border: 0;
	cursor: pointer;
	background: #2d5078;
	color: #fff;
	font-size: 14px
}

/* 강의명/설명 고정폭 */
.form-grid tr._row-title>td[colspan] input[type="text"] {
	width: 426.09px !important;
	max-width: 426.09px !important;
	height: 33px !important;
	line-height: 33px !important
}

.form-grid tr._row-desc>td[colspan] textarea {
	width: 426.09px !important;
	max-width: 426.09px !important;
	height: 126px !important;
	min-height: 126px !important
}

/* Footer */
.site-footer {
	background: #19202D;
	color: #cfd3db;
	height: 60px;
	display: flex;
	align-items: center
}

.site-footer .footer-inner {
	width: min(1400px, 96vw);
	margin: 0 auto;
	padding: 0 20px;
	font-size: 12px;
	letter-spacing: .02em
}
</style>
</head>
<body>

	<!-- 상단 파란 메뉴 바 -->
	<div class="top-menu">
		<nav class="top-menu__inner">
			<a class="top-menu__link" href="/index.html">HOME</a> <a
				class="top-menu__link" href="#">사이트맵</a> <a class="top-menu__link"
				href="#">로그아웃</a>
		</nav>
	</div>

	<!-- 다크 로고 바 -->
	<header class="brand-bar">
		<a href="../index.html"> <img class="brand-logo"
			src="../../images/admin_logo.png" alt="그린대학교 학사관리시스템 로고">
		</a>
	</header>

	<div class="layout">
		<!-- 좌측 사이드  -->
		<aside class="sidebar">
			<nav class="sidebar-menu">
				<div class="menu-group">
					<h3>
						<img src="../../images/ico-admin-setting.png" alt=""
							class="menu-icon">환경설정
					</h3>
					<ul>
						<li><span>기본환경정보</span></li>
						<li><span>약관관리</span></li>
					</ul>
				</div>

				<div class="menu-group">
					<h3>
						<img src="../../images/ico-admin-academic.png" alt=""
							class="menu-icon">학사운영
					</h3>
					<ul>
						<li><a href="/academic/operation/overview.html">교육 운영 현황</a></li>
						<li><a href="/academic/operation/overview.html#by-grade">학년별
								학생 현황</a></li>
						<li><a href="/academic/operation/overview.html#by-major">학과별
								학생 현황</a></li>
						<li><a href="/academic/operation/lecture-list.html">강의 목록</a></li>
						<li><a href="/academic/operation/lecture-register.html">강의
								등록</a></li>
						<li><a href="/academic/operation/enrollment.html">수강 현황</a></li>
					</ul>
				</div>

				<div class="menu-group">
					<h3>
						<img src="../../images/ico-admin-persons.png" alt=""
							class="menu-icon">인사관리
					</h3>
					<ul>
						<li><a href="/personnel/students.html">학생 목록</a></li>
						<li><a href="/personnel/student-register.html">학생 등록</a></li>
						<li><a href="/personnel/professors.html">교수 목록</a></li>
						<li><a href="/personnel/professor-register.html">교수 등록</a></li>
						<li><span>임직원 목록 및 등록</span></li>
					</ul>
				</div>

				<div class="menu-group">
					<h3>
						<img src="../../images/ico-admin-college.png" alt=""
							class="menu-icon">대학 및 학과
					</h3>
					<ul>
						<li><a href="/academic/departments/department-list.html">대학
								및 학과 목록</a></li>
						<li><a href="/academic/departments/department-register.html">대학
								및 학과 등록</a></li>
					</ul>
				</div>

				<div class="menu-group">
					<h3>
						<img src="../../images/ico-admin-board.png" alt=""
							class="menu-icon">게시판관리
					</h3>
					<ul>
						<li><span>입학안내 공지사항</span></li>
						<li><span>학사안내 공지사항</span></li>
						<li><span>커뮤니티 공지사항</span></li>
						<li><span>입학상담</span></li>
						<li><span>질문 및 답변</span></li>
						<li><span>식단안내</span></li>
						<li><span>자료실</span></li>
					</ul>
				</div>
			</nav>
		</aside>

		<!-- 본문 -->
		<main class="main-area">
			<section class="page">
				<div class="page__header">
					<h3 class="page__title">강의 등록</h3>
					<div class="page__path">
						<span class="path__dim">학사운영</span> <span class="path__sep">
							<svg viewBox="0 0 12 6" xmlns="http://www.w3.org/2000/svg"
								aria-hidden="true">
                <path d="M1 1l5 4 5-4" fill="none" stroke="#145074"
									stroke-width="1.2" stroke-linecap="round"
									stroke-linejoin="round" />
              </svg>
						</span> <strong>강의 등록</strong>
					</div>
				</div>

				<div class="page__body">
					<form method="post"
						action="${pageContext.request.contextPath}/academic/operation/lecture-register.do">

						<table class="form-grid">
							<tbody>
								<tr>
									<th scope="row">과목코드</th>
									<td><div class="help">학과 코드 + 연도 + 학기 + 순번 조합 자동생성</div></td>
									<th scope="row">개설학과</th>
									<td>
										<div style="display: flex; gap: 8px">
											<select class="sel" id="college" name="college">
											  <option value="">단과대학 선택</option>
											  <option value="인문사회대학">인문사회대학</option>
											  <option value="자연과학대학">자연과학대학</option>
											  <option value="공과대학">공과대학</option>
											</select>
											
											<select class="sel" id="department" name="department">
											  <option value="">학과 선택</option>
											</select>
											
											<script>
											  const departments = {
											    "인문사회대학": ["국어국문학과", "영어영문학과", "사회학과"],
											    "자연과학대학": ["수학과", "물리학과", "화학과"],
											    "공과대학": ["컴퓨터공학과", "기계공학과", "전자공학과"]
											  };
											
											  document.getElementById("college").addEventListener("change", function() {
											    const college = this.value;
											    const deptSelect = document.getElementById("department");
											    deptSelect.innerHTML = "<option value=''>학과 선택</option>";
											
											    if (departments[college]) {
											      departments[college].forEach(dept => {
											        const option = document.createElement("option");
											        option.value = dept;
											        option.textContent = dept;
											        deptSelect.appendChild(option);
											      });
											    }
											  });
											</script>
										</div>
									</td>
								</tr>

								<tr>
									<th scope="row">개설학년</th>
									<td>
										<div style="display: flex; gap: 8px; max-width: 380px;">
											<select class="sel" name="year">
												<option value="1">1 학년</option>
												<option value="2">2 학년</option>
												<option value="3">3 학년</option>
												<option value="4">4 학년</option>
											</select> <select class="sel" name="semester">
												<option value="1">1 학기</option>
												<option value="2">2 학기</option>
											</select>
										</div>
									</td>
									<th scope="row">학점</th>
									<td><select class="sel" name="credit">
											<option value="1">1 학점</option>
											<option value="2">2 학점</option>
											<option value="3" selected>3 학점</option>
									</select></td>
								</tr>


								<tr>
									<th scope="row">이수구분</th>
									<td><select class="sel" name="division">
											<option value="선택">전공 선택</option>
											<option value="필수">전공 필수</option>
											<option value="교양">교양</option>
									</select></td>
									<th scope="row">담당교수</th>
									<td><input class="inp" type="text" name="prof_name"
										placeholder="교수 이름 입력"></td>
								</tr>

								<tr>
									<th scope="row">강의명</th>
									<td colspan="3"><input class="inp" type="text"
										name="crs_name" placeholder="강좌명 입력"></td>
								</tr>
								<tr>
									<th scope="row">강의 설명</th>
									<td colspan="3"><textarea class="ta" name="crs_desc"
											placeholder="강의 개요 및 목표, 학습 내용 등"></textarea></td>
								</tr>
							</tbody>
						</table>

						<!-- 수업정보 입력 -->
						<h4 class="section-title">수업정보 입력</h4>
						<table class="form-grid">
							<tbody>
		                	<!-- 수업기간 -->
				                <tr>
				                  	<th scope="row">수업 기간</th>
				                  	<td colspan="3">
				                    	<div style="display:flex; gap:12px;">
				                      		<input class="inp w180" type="date" name="period_start" required>
				                      		<span class="tilde">~</span>
				                      		<input class="inp w180" type="date" name="period_end" required>
				                    	</div>
				                    	<div class="help">※ 개설연도는 시작일(period_start) 기준으로 자동 산출됩니다.</div>
				                  </td>
				                </tr>
								<tr>
									<th scope="row">수업 시간</th>
									<td colspan="3">
										<div style="display: flex; align-items: center; gap: 12px;">
											<input class="inp w140" type="time" name="time_start"
												value="10:00"> <span class="tilde">~</span> <input
												class="inp w140" type="time" name="time_end" value="12:00">

											<!-- 요일 체크박스들 -->
											<div
												style="display: flex; align-items: center; gap: 12px; margin-left: 12px;">
										        <label><input type="checkbox" name="days" value="월"> 월</label>
										        <label><input type="checkbox" name="days" value="화"> 화</label>
										        <label><input type="checkbox" name="days" value="수"> 수</label>
										        <label><input type="checkbox" name="days" value="목"> 목</label>
										        <label><input type="checkbox" name="days" value="금"> 금</label>
											</div>
										</div>
									</td>
								</tr>


								<tr>
									<th scope="row">평가방식</th>
									<td colspan="3"><input class="inp w450" type="text"
										name="eval_method" placeholder="출석 10%, 과제 30%, 시험 60%"></td>
								</tr>
								<tr>
									<th scope="row">교재</th>
									<td colspan="3"><input class="inp w450" type="text"
										name="textbook" placeholder="출판사 - 도서명 - 저자 입력"></td>
								</tr>

								<tr>
									<th scope="row">강의실</th>
									<td><input class="inp" type="text" name="crs_room"
										placeholder="인문관 301호"></td>
									<th scope="row">최대 수강인원</th>
									<td><input class="inp w140" type="number" name="capacity"
										min="1" step="1"></td>
								</tr>
							</tbody>
						</table>

						<div class="section-actions">
							<button type="submit" class="btn-primary">등록</button>
						</div>
					</form>
				</div>
			</section>
		</main>
	</div>

	<footer class="site-footer" role="contentinfo">
		<div class="footer-inner">Copyright &copy; Green University All
			rights reserved. ADMINISTRATOR Version 1.4.1</div>
	</footer>
</body>
</html>
