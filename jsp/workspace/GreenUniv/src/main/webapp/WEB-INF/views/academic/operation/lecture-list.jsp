<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>학사관리시스템_학사운영_강의 목록</title>

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

/* 페이지 헤더 (index와 동일) */
.page__header{height:46px;border-bottom:1px solid #cfd6df;padding:0 16px;display:flex;align-items:center;justify-content:space-between}
.page__title{font-size:16px;font-weight:700;color:#222}
.page__path{font-size:12px;display:flex;align-items:center;gap:6px;white-space:nowrap}
.page__path .path__dim{color:#666}
.page__path strong{color:#145074;font-weight:500}
.page__path .path__sep svg{width:12px;height:6px;display:block}
.page__path .path__sep path{stroke:#145074}

/* 본문 여백 */
.page__body{padding:20px;margin-top:4px}

/* 검색바 */
.search-bar{display:flex;align-items:center;gap:8px;justify-content:flex-end;width:100%;margin-bottom:14px}
.search-label{
  height:35px;display:inline-flex;align-items:center;justify-content:center;
  width:100px;border:1px solid #959595;background:#fff;font-size:13px;color:#333
}
.search-input{
  height:35px;width:200px;padding:0 12px;border:1px solid #959595;outline:none;font-size:13px
}
.search-btn{height:35px;padding:0 18px;border:none;cursor:pointer;background:#1f5e95;color:#fff;font-size:13px}

/* 테이블 카드 & 테이블 */
.table-card{border:1px solid var(--line);border-top:2px solid #8798A3;background:#fff}
.gu-table{width:100%;border-collapse:separate;border-spacing:0;table-layout:fixed;font-size:13px;color:#333}
.gu-table thead th{height:45.5px;background:var(--thead);border-bottom:1px solid #e1e6ee;padding:0 12px;text-align:center;font-weight:600;border-left:0;border-right:0}
.gu-table tbody td{height:45.5px;padding:0 12px;background:#fff;border-bottom:1px solid #e9edf3;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;text-align:center;border-left:0;border-right:0}
.gu-table,.gu-table th,.gu-table td{border-left:0 !important;border-right:0 !important}

/* 페이지네이션 */
.gu-paging{display:flex;justify-content:center;gap:6px;padding:12px 0 16px}
.gu-page-btn{width:28px;height:28px;display:inline-flex;align-items:center;justify-content:center;border:1px solid #d6d9df;background:#fff;font-size:13px;color:#3c4150;cursor:pointer}
.gu-page-btn:hover{background:#f4f6f9}
.gu-page-btn.is-active{background:#1f5e95;color:#fff;border-color:#1f5e95}
.gu-page-btn.is-disabled{opacity:.45;cursor:not-allowed;background:#fff}
.gu-page-btn--square{width:22px;height:22px;font-size:12px}

/* 접근성 숨김 */
.sr-only{position:absolute;width:1px;height:1px;margin:-1px;border:0;padding:0;clip-path:inset(50%);clip:rect(0 0 0 0);overflow:hidden;white-space:nowrap}

/* Footer */
.site-footer{background:#19202D;color:#cfd3db;height:60px;display:flex;align-items:center}
.site-footer .footer-inner{width:min(1400px,96vw);margin:0 auto;padding:0 20px;font-size:12px;letter-spacing:.02em}
</style>
</head>
<body>

  <!-- 상단 파란 메뉴 바 -->
  <div class="top-menu">
    <nav class="top-menu__inner">
      <a class="top-menu__link" href="../../index.html">HOME</a>
      <a class="top-menu__link" href="#">사이트맵</a>
      <a class="top-menu__link" href="#">로그아웃</a>
    </nav>
  </div>

  <!-- 다크 로고 바 -->
  <header class="brand-bar">
    <a href="../index.html">
      <img class="brand-logo" src="../../images/admin_logo.png" alt="그린대학교 학사관리시스템 로고">
    </a>
  </header>

  <!-- 레이아웃 -->
  <div class="layout">
    <!-- 좌측 사이드 메뉴  -->
    <aside class="sidebar">
      <nav class="sidebar-menu">

        <!-- 환경설정 -->
        <div class="menu-group">
          <h3><img src="../../images/ico-admin-setting.png" alt="" class="menu-icon">환경설정</h3>
          <ul>
            <li><span>기본환경정보</span></li>
            <li><span>약관관리</span></li>
          </ul>
        </div>

        <!-- 학사운영 -->
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

        <!-- 인사관리 -->
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

        <!-- 대학 및 학과 -->
        <div class="menu-group">
          <h3><img src="../../images/ico-admin-college.png" alt="" class="menu-icon">대학 및 학과</h3>
          <ul>
            <li><a href="/academic/departments/department-list.html">대학 및 학과 목록</a></li>
            <li><a href="/academic/departments/department-register.html">대학 및 학과 등록</a></li>
          </ul>
        </div>

        <!-- 게시판관리 (파일 없음 → 클릭 불가) -->
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

    <!-- 우측 본문: 강의 목록 -->
    <main class="main-area">
      <section class="page">
        <div class="page__header">
          <h3 class="page__title">강의 목록</h3>
          <div class="page__path">
            <span class="path__dim">학사운영</span>
            <span class="path__sep">
              <svg viewBox="0 0 12 6" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                <path d="M1 1l5 4 5-4" fill="none" stroke="#145074" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </span>
            <strong>강의 목록</strong>
          </div>
        </div>

        <div class="page__body">
          <!-- 검색 바 -->
          <form class="search-bar" onsubmit="return false;">
            <span class="search-label">검색조건</span>
            <input class="search-input" type="text" placeholder="키워드 입력" />
            <button class="search-btn" type="submit">검색</button>
          </form>

          <!-- 테이블 카드 -->
          <div class="table-card">
            <table class="gu-table">
              <colgroup>
                <!-- 과목코드, 학과, 학년, 구분, 과목명, 교수, 학점, 수업시간, 강의실, 최대 수강 인원 -->
                <col style="width:10%"><col style="width:12%"><col style="width:6%"><col style="width:8%">
                <col style="width:18%"><col style="width:10%"><col style="width:6%"><col style="width:16%"><col style="width:8%"><col style="width:6%">
              </colgroup>
              <thead>
                <tr>
                  <th>과목코드</th>
                  <th>학과</th>
                  <th>학년</th>
                  <th>구분</th>
                  <th>과목명</th>
                  <th>교수</th>
                  <th>학점</th>
                  <th>수업시간</th>
                  <th>강의실</th>
                  <th>최대 수강 인원</th>
                </tr>
              </thead>
              <tbody>
                <!-- 서버 바인딩 자리 -->

                <!-- 샘플 데이터 -->
                <tr><td>3025112</td><td>컴퓨터과학과</td><td>1</td><td>전공선택</td><td>프로그래밍 개론</td><td>김민정</td><td>3</td><td>월,수 10:00~12:00</td><td>컴퓨터실</td><td>30</td></tr>
                <tr><td>3025113</td><td>컴퓨터과학과</td><td>2</td><td>전공필수</td><td>자료구조</td><td>김철수</td><td>3</td><td>화,목 13:00~15:00</td><td>공학관201</td><td>40</td></tr>
                <tr><td>3025114</td><td>컴퓨터과학과</td><td>3</td><td>전공선택</td><td>운영체제</td><td>박지영</td><td>3</td><td>수 15:00~18:00</td><td>공학관305</td><td>35</td></tr>
                <tr><td>3025115</td><td>컴퓨터과학과</td><td>4</td><td>전공선택</td><td>웹프로그래밍</td><td>이도윤</td><td>3</td><td>금 09:00~12:00</td><td>컴퓨터실</td><td>30</td></tr>
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
