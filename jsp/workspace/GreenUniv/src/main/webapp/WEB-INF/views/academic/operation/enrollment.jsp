<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>학사관리시스템_학사운영_수강 현황</title>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">

<style>
:root{
  --brand-blue:#00518C; --brand-dark:#1F2838;
  --text:#222; --muted:#333;
  --sidebar-bg:#F5F6F7; --card:#FFF;
  --line:#C0C0C0; --thead:#F6F8FB; --accent:#1F5E95;
  --sb-icon:18px; --sb-gap:8px; --sb-indent:calc(var(--sb-icon) + var(--sb-gap));
}
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Noto Sans KR', Arial, system-ui, sans-serif;color:var(--text);background:#f9f9f9;min-height:100vh;display:flex;flex-direction:column}

/* 상단 바 */
.top-menu{background:var(--brand-blue);height:30px;display:flex;align-items:center}
.top-menu__inner{width:100%;display:flex;justify-content:flex-end;align-items:center;padding:0 40px}
.top-menu__link{color:#fff;font-size:12px;line-height:20px;text-decoration:none;position:relative;padding:0 10px}
.top-menu__link + .top-menu__link::before{content:"";position:absolute;left:0;top:4px;width:1px;height:11px;background:rgba(255,255,255,.3)}

/* 브랜드 바 */
.brand-bar{background:var(--brand-dark);height:90px;border-bottom:1px solid #dcdcdc;position:relative}
.brand-logo{position:absolute;left:260px;top:16px;width:352px;height:52px;display:block;object-fit:contain}
@media (max-width:1200px){.brand-logo{left:24px}}

/* 레이아웃 */
.layout{display:flex;align-items:flex-start;width:min(1400px,96vw);margin:22px auto 56px;gap:20px;flex:1}

/* 사이드바 */
.sidebar{flex:0 0 270px;min-height:840px;border-right:1px solid var(--line);background:var(--sidebar-bg)}
.sidebar-menu{padding:20px 16px;font-size:14px;color:var(--muted)}
.sidebar-menu h3{display:flex;align-items:center;gap:8px;margin:20px 0 10px;font-size:16px;font-weight:700;color:#111}
.menu-icon{width:18px;height:18px;flex:0 0 18px}
.sidebar-menu .menu-group>ul{list-style:none;margin:0 0 18px 0;padding:0;margin-left:var(--sb-indent)}
.sidebar-menu li{display:flex;align-items:center;gap:10px;margin:8px 0;line-height:1.7}
.sidebar-menu li::before{content:"·";font-size:20px;line-height:1;color:#7f8790}
.sidebar-menu a,.sidebar-menu span{text-decoration:none;color:#333;font-weight:500;cursor:pointer}
.sidebar-menu a:hover,.sidebar-menu span:hover{color:var(--brand-blue)}

/* 본문 카드 */
.main-area{flex:1}
.page{background:var(--card);border:1px solid var(--line)}
.page__body{padding:16px}

/* 페이지 헤더 */
.page__header{height:46px;border-bottom:1px solid #cfd6df;padding:0 16px;display:flex;align-items:center;justify-content:space-between}
.page__title{font-size:16px;font-weight:700;color:#222}
.page__path{font-size:12px;display:flex;align-items:center;gap:6px;white-space:nowrap}
.page__path .path__dim{color:#666}
.page__path strong{color:#145074;font-weight:500}
.page__path .path__sep svg{width:12px;height:6px;display:block}
.page__path .path__sep path{stroke:#145074}

/* ===== 내부 구조 유지 + 크기 보정 ===== */
.page__body{padding:20px;margin-top:4px}

/* 검색줄 */
.search-bar {
  display: flex;
  align-items: center;
  gap: 8px;
  justify-content: flex-end;   /* 오른쪽 끝 정렬 */
  width: 100%;
  margin-bottom: 14px;
}

/* 라벨 */
.search-label {
  height: 35px;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 100px;                 /* 고정 너비 */
  border: 1px solid #959595;
  background: #fff;
  font-size: 13px;
  color: #333;
}

/* 입력창 */
.search-input {
  height: 35px;
  width: 200px;                 /* 고정 너비 */
  padding: 0 12px;
  border: 1px solid #959595;
  outline: none;
  font-size: 13px;
}

/* 버튼 */
.search-btn {
  height: 35px;
  width: 60px;
  padding: 0 18px;
  border: none;
  cursor: pointer;
  background: #1A528E;
  color: #fff;
  font-size: 13px;
}
/* 테이블 카드 & 테이블  */
.table-card{border:1px solid var(--line);border-top:2px solid #8798A3;background:#fff}
.gu-table{width:100%;border-collapse:separate;border-spacing:0;table-layout:fixed;font-size:13px;color:#333}
.gu-table thead th{height:45.5px;background:var(--thead);border-bottom:1px solid #e1e6ee;padding:0 14px;font-weight:500;text-align:center;border-left:0;border-right:0}
.gu-table tbody td{height:45.5px;padding:0 14px;background:#fff;border-bottom:1px solid #e9edf3;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;text-align:center;border-left:0;border-right:0}
.gu-table tbody td:nth-child(8){text-align:left !important}
.gu-table,.gu-table th,.gu-table td{border-left:0 !important;border-right:0 !important}

/* 페이지네이션 */
.gu-paging{display:flex;justify-content:center;gap:6px;padding:12px 0 16px}
.gu-page-btn{width:28px;height:28px;border:1px solid #d6d9df;background:#fff;font-size:13px;color:#3c4150}
.gu-page-btn--square{width:22px;height:22px;font-size:12px}
.gu-page-btn:hover{background:#f4f6f9}
.gu-page-btn.is-active{background:#1f5e95;color:#fff;border-color:#1f5e95}

/* 접근성 숨김 */
.sr-only{position:absolute;width:1px;height:1px;margin:-1px;border:0;padding:0;clip-path:inset(50%);clip:rect(0 0 0 0);overflow:hidden;white-space:nowrap}

/* 푸터 */
.site-footer{background:#19202D;color:#cfd3db;height:60px;display:flex;align-items:center}
.site-footer .footer-inner{width:min(1400px,96vw);margin:0 auto;padding:0 20px;font-size:12px;letter-spacing:.02em}
</style>
</head>
<body>

  <!-- 상단 바 -->
  <div class="top-menu">
    <nav class="top-menu__inner">
      <a class="top-menu__link" href="../../index.html">HOME</a>
      <a class="top-menu__link" href="#">사이트맵</a>
      <a class="top-menu__link" href="#">로그아웃</a>
    </nav>
  </div>

  <!-- 브랜드 바 -->
  <header class="brand-bar">
    <a href="../index.html">
      <img class="brand-logo" src="../../images/admin_logo.png" alt="그린대학교 학사관리시스템 로고">
    </a>
  </header>

  <div class="layout">
    <!-- 사이드바 -->
    <aside class="sidebar">
      <nav class="sidebar-menu">
        <div class="menu-group">
          <h3><img src="../../images/ico-admin-setting.png" alt="" class="menu-icon">환경설정</h3>
          <ul>
            <li><span>기본환경정보</span></li>
            <li><span>약관관리</span></li>
          </ul>
        </div>

        <div class="menu-group">
          <h3><img src="../../images/ico-admin-academic.png" alt="" class="menu-icon">학사운영</h3>
          <ul>
            <li><a href="/academic/operation/overview.html">교육 운영 현황</a></li>
            <li><a href="/academic/operation/overview.html#by-grade">학년별 학생 현황</a></li>
            <li><a href="/academic/operation/overview.html#by-major">학과별 학생 현황</a></li>
            <li><a href="/academic/operation/lecture-list.html">강의 목록</a></li>
            <li><a href="/academic/operation/lecture-register.html">강의 등록</a></li>
            <li><a href="/academic/operation/enrollment.html">수강 현황</a></li>
          </ul>
        </div>

        <div class="menu-group">
          <h3><img src="../../images/ico-admin-persons.png" alt="" class="menu-icon">인사관리</h3>
            <ul>
              <li><a href="/personnel/students.html">학생 목록</a></li>
              <li><a href="/personnel/student-register.html">학생 등록</a></li>
              <li><a href="/personnel/professors.html">교수 목록</a></li>
              <li><a href="/personnel/professor-register.html">교수 등록</a></li>
              <li><span>임직원 목록 및 등록</span></li>
            </ul>
        </div>

        <div class="menu-group">
          <h3><img src="../../images/ico-admin-college.png" alt="" class="menu-icon">대학 및 학과</h3>
          <ul>
            <li><a href="/academic/departments/department-list.html">대학 및 학과 목록</a></li>
            <li><a href="/academic/departments/department-register.html">대학 및 학과 등록</a></li>
          </ul>
        </div>

        <div class="menu-group">
          <h3><img src="../../images/ico-admin-board.png" alt="" class="menu-icon">게시판관리</h3>
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
          <h3 class="page__title">수강 현황</h3>
          <div class="page__path">
            <span class="path__dim">학사운영</span>
            <span class="path__sep">
              <svg viewBox="0 0 12 6" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                <path d="M1 1l5 4 5-4" fill="none" stroke="#145074" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </span>
            <strong>수강 현황</strong>
          </div>
        </div>

        <div class="page__body">
          <!-- 검색 바 -->
          <form class="search-bar" onsubmit="return false;">
            <span class="search-label">검색조건</span>
            <label class="sr-only" for="q">키워드 입력</label>
            <input id="q" class="search-input" type="text" placeholder="키워드 입력" />
            <button class="search-btn" type="submit">검색</button>
          </form>

          <!-- 테이블 카드 -->
          <div class="table-card">
            <table class="gu-table">
              <colgroup>
                <col style="width:6%"><col style="width:6%"><col style="width:8%"><col style="width:8%">
                <col style="width:6%"><col style="width:10%"><col style="width:10%"><col style="width:16%">
                <col style="width:8%"><col style="width:8%"><col style="width:6%"><col style="width:8%">
              </colgroup>
              <thead>
                <tr>
                  <th>년도</th><th>학기</th><th>학번</th><th>이름</th><th>학년</th><th>학과</th>
                  <th>과목코드</th><th>과목명</th><th>구분</th><th>교수</th><th>학점</th><th>수강 신청일</th>
                </tr>
              </thead>
<tbody>
  <!-- 2025학년도 2학기 -->
  <tr><td>2025</td><td>2</td><td>20230001</td><td>김가온</td><td>1</td><td>컴퓨터과학과</td><td>3025112</td><td>프로그래밍 개론</td><td>전공선택</td><td>김민정</td><td>3</td><td>2025-08-28</td></tr>
  <tr><td>2025</td><td>2</td><td>20220012</td><td>박하린</td><td>2</td><td>컴퓨터과학과</td><td>3025113</td><td>자료구조</td><td>전공필수</td><td>김철수</td><td>3</td><td>2025-08-28</td></tr>
  <tr><td>2025</td><td>2</td><td>20210007</td><td>이준호</td><td>3</td><td>컴퓨터과학과</td><td>3025201</td><td>데이터베이스</td><td>전공필수</td><td>한지수</td><td>3</td><td>2025-08-29</td></tr>
  <tr><td>2025</td><td>2</td><td>20210033</td><td>최유나</td><td>3</td><td>컴퓨터과학과</td><td>3025304</td><td>운영체제</td><td>전공필수</td><td>정도현</td><td>3</td><td>2025-08-29</td></tr>
  <tr><td>2025</td><td>2</td><td>20220045</td><td>문채원</td><td>2</td><td>컴퓨터과학과</td><td>3025402</td><td>알고리즘</td><td>전공선택</td><td>김상혁</td><td>3</td><td>2025-08-30</td></tr>
  <tr><td>2025</td><td>2</td><td>20230024</td><td>정시우</td><td>1</td><td>컴퓨터과학과</td><td>3025105</td><td>웹프로그래밍</td><td>전공선택</td><td>박민아</td><td>3</td><td>2025-08-31</td></tr>
  <tr><td>2025</td><td>2</td><td>20220078</td><td>강다연</td><td>2</td><td>컴퓨터과학과</td><td>3025503</td><td>컴퓨터네트워크</td><td>전공선택</td><td>오지훈</td><td>3</td><td>2025-08-31</td></tr>

  <!-- 타 학과 혼합: 동일 테이블 컬럼 유지 -->
  <tr><td>2025</td><td>2</td><td>20210088</td><td>배유진</td><td>3</td><td>경영학과</td><td>5012101</td><td>재무관리</td><td>전공필수</td><td>서미정</td><td>3</td><td>2025-08-28</td></tr>
  <tr><td>2025</td><td>2</td><td>20210112</td><td>오세진</td><td>3</td><td>경영학과</td><td>5012302</td><td>마케팅원론</td><td>전공선택</td><td>이태경</td><td>3</td><td>2025-08-29</td></tr>
  <tr><td>2025</td><td>2</td><td>20230045</td><td>김소은</td><td>1</td><td>영어영문학과</td><td>2101105</td><td>영문법</td><td>전공선택</td><td>최은주</td><td>2</td><td>2025-08-30</td></tr>
  <tr><td>2025</td><td>2</td><td>20220091</td><td>장민규</td><td>2</td><td>영어영문학과</td><td>2101301</td><td>영미소설</td><td>전공선택</td><td>류성진</td><td>3</td><td>2025-08-31</td></tr>
  <tr><td>2025</td><td>2</td><td>20210021</td><td>유가영</td><td>3</td><td>국어국문학과</td><td>120001</td><td>고전소설Ⅰ</td><td>전공선택</td><td>김국어</td><td>3</td><td>2025-08-29</td></tr>
  <tr><td>2025</td><td>2</td><td>20230077</td><td>신현우</td><td>1</td><td>디자인학과</td><td>6402104</td><td>타이포그래피</td><td>전공선택</td><td>박도윤</td><td>3</td><td>2025-08-28</td></tr>
  <tr><td>2025</td><td>2</td><td>20210145</td><td>하나린</td><td>3</td><td>기계공학과</td><td>7303201</td><td>열역학</td><td>전공필수</td><td>정하람</td><td>3</td><td>2025-08-30</td></tr>

  <!-- 교양 과목 예시 -->
  <tr><td>2025</td><td>2</td><td>20230012</td><td>서도현</td><td>1</td><td>컴퓨터과학과</td><td>9001001</td><td>대학영어</td><td>교양필수</td><td>박연주</td><td>2</td><td>2025-08-28</td></tr>
  <tr><td>2025</td><td>2</td><td>20220018</td><td>임소민</td><td>2</td><td>경영학과</td><td>9002002</td><td>글쓰기</td><td>교양필수</td><td>김시온</td><td>2</td><td>2025-08-29</td></tr>
  <tr><td>2025</td><td>2</td><td>20210058</td><td>노서준</td><td>3</td><td>영어영문학과</td><td>9003103</td><td>현대사회와윤리</td><td>교양선택</td><td>이소담</td><td>2</td><td>2025-08-31</td></tr>

  <!-- 2025학년도 1학기(혼합) -->
  <tr><td>2025</td><td>1</td><td>20230088</td><td>정은비</td><td>1</td><td>컴퓨터과학과</td><td>3025101</td><td>파이썬프로그래밍</td><td>전공선택</td><td>박지현</td><td>3</td><td>2025-03-05</td></tr>
  <tr><td>2025</td><td>1</td><td>20220002</td><td>김태오</td><td>2</td><td>경영학과</td><td>5012405</td><td>경영정보시스템</td><td>전공선택</td><td>한서윤</td><td>3</td><td>2025-03-06</td></tr>
  <tr><td>2025</td><td>1</td><td>20210005</td><td>이서하</td><td>3</td><td>국어국문학과</td><td>1202102</td><td>현대시강독</td><td>전공선택</td><td>박현우</td><td>3</td><td>2025-03-06</td></tr>
</tbody>

            </table>

            <nav class="gu-paging" aria-label="페이지 이동">
              <button class="gu-page-btn gu-page-btn--square" title="처음">«</button>
              <button class="gu-page-btn gu-page-btn--square" title="이전">‹</button>
              <button class="gu-page-btn is-active" aria-current="page">1</button>
              <button class="gu-page-btn">2</button>
              <button class="gu-page-btn">3</button>
              <button class="gu-page-btn gu-page-btn--square" title="다음">›</button>
              <button class="gu-page-btn gu-page-btn--square" title="마지막">»</button>
            </nav>
          </div>
        </div>
      </section>
    </main>
  </div>

  <!-- Footer -->
  <footer class="site-footer" role="contentinfo">
    <div class="footer-inner">
      Copyright &copy; Green University All rights reserved. ADMINISTRATOR Version 1.4.1
    </div>
  </footer>

</body>
</html>
