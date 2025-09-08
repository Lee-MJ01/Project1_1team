<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>그린대학교 학사관리시스템 - 운영현황 메인</title>

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
.sidebar {
  flex: 0 0 270px;
  min-height: 840px;
  border-right: 1px solid var(--line);
  background: var(--sidebar-bg);
}
.sidebar-menu {
  padding: 20px 16px;
  font-size: 14px;
  color: var(--muted);
}

/* 대분류 제목 */
.sidebar-menu h3 {
  display: flex;
  align-items: center;
  gap: 8px;
  margin: 20px 0 10px;
  font-size: 16px;
  font-weight: 700;
  color: #111;
}
.menu-icon { width: 18px; height: 18px; flex: 0 0 18px; }

/* 소분류 목록 */
.sidebar-menu .menu-group > ul {
  list-style: none;
  margin: 0 0 18px 0;
  padding: 0;
  margin-left: var(--sb-indent);
}

/* 소분류 항목 */
.sidebar-menu li {
  display: flex;
  align-items: center;
  gap: 10px;
  margin: 8px 0;
  line-height: 1.7;
}
.sidebar-menu li::before {
  content: "·";
  font-size: 20px;
  line-height: 1;
  color: #7f8790;
}

/* 링크/텍스트 공통 */
.sidebar-menu a,
.sidebar-menu span {
  text-decoration: none;
  color: #333;
  font-weight: 500;
  cursor: pointer;
}

/* hover 효과 */
.sidebar-menu a:hover,
.sidebar-menu span:hover {
  color: var(--brand-blue);
}

/* 본문 카드 */
.main-area{flex:1}
.page{background:var(--card);border:1px solid var(--line)}
.page__body{padding:16px}

/* 페이지 헤더 */
.page__header{height:46px;border-bottom:1px solid #cfd6df;padding:0 16px;display:flex;align-items:center;justify-content:space-between}
.page__title{font-size:16px;font-weight:700;color:#222}
.page__path{font-size:12px;display:flex;align-items:center;gap:6px}
.page__path .crumb{color:#666}
.page__path .page__sep{color:#a8b0ba;margin:0 2px}
.page__path .crumb-link{color:#145074;font-weight:500;text-decoration:none}
.page__path .crumb-link:hover{text-decoration:underline}

/* 블록(섹션) */
.block{border:0;background:transparent;box-shadow:none}
.block+.block{margin-top:14px}
.block__head{padding:0 0 8px}
.block__title{display:flex;align-items:center;gap:6px;font-size:16px;font-weight:600;color:#145074;margin:0}
.block__title::before{content:"";width:6px;height:20px;background:var(--accent);border-radius:1px}

/* 표 공통 */
.table{width:100%;border-collapse:separate;border-spacing:0;font-size:13px;border-top:1px solid #cfd6df;border-bottom:1px solid #e9edf3}
.table thead th{height:45.5px;background:var(--thead);color:#5a6475;font-weight:600;text-align:center;border:0;border-bottom:1px solid #cfd6df}
.table tbody td{height:45.5px;background:#fff;border:0;border-bottom:1px solid #e1e6ee}
.table tfoot td{height:45.5px;background:#fff;border-top:1px solid #e1e6ee;font-weight:700}
.table .center{text-align:center}
.table .num{text-align:right;padding-right:10px}

/* 열 폭 */
.table--univ col{width:136.25px}  /* 8열 동일 */

.table--edu col:nth-child(1){width:120px}
.table--edu col:nth-child(2){width:100px}
.table--edu col:nth-child(3){width:160px}
.table--edu col:nth-child(4){width:80px}
.table--edu col:nth-child(5){width:100px}
.table--edu col:nth-child(6){width:80px}
.table--edu col:nth-child(7){width:60px}
.table--edu col:nth-child(8){width:120px}
.table--edu col:nth-child(9){width:100px}
.table--edu col:nth-child(10){width:80px}

/* 2열 유틸 그리드 */
.grid-2{
  display:grid;
  grid-template-columns:repeat(2, minmax(0,1fr));
  gap:12px;
  align-items:start;
}
.grid-2 > .block{margin:0}

/* 반응형 */
@media (max-width:1024px){
  .grid-2{grid-template-columns:1fr}
}

/* 학생 현황(학년별/학과별): 내용 중앙정렬 */
.table--bygrade td,
.table--bygrade tfoot td,
.table--bymajor td,
.table--bymajor tfoot td{
  text-align:center !important;
  vertical-align:middle;
}

.spacer{height:14px}
a.link{color:#145074;text-decoration:none}
a.link:hover{text-decoration:underline}
.status{font-weight:700}
.status--done{color:#2e9f55}
.status--warn{color:#d64835}
</style>
</head>
<body>

<!-- 상단 -->
<div class="top-menu">
  <nav class="top-menu__inner">
    <a class="top-menu__link" href="#">HOME</a>
    <a class="top-menu__link" href="#">사이트맵</a>
    <a class="top-menu__link" href="#">로그아웃</a>
  </nav>
</div>

<header class="brand-bar">
  <a href="index.html">
    <img class="brand-logo" src="../../images/admin_logo.png" alt="그린대학교 학사관리시스템 로고">
  </a>
</header>

<div class="layout">
  <!-- 좌측 사이드 -->
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

    <!-- 학사운영  -->
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
        <li><a href="academinc/personnel/students.html">학생 목록</a></li>
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

    <!-- 게시판관리(파일 없음 → 임시 비활성) -->
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
        <h3 class="page__title">운영현황 메인</h3>
        <div class="page__path">
          <span class="crumb">HOME</span><span class="page__sep">›</span>
          <a href="#" class="crumb-link">운영현황 메인</a>
        </div>
      </div>

      <div class="page__body">
        <!-- 1) 대학 운영 현황 -->
        <article class="block">
          <header class="block__head"><h4 class="block__title">대학 운영 현황</h4></header>
          <div class="block__body">
            <table class="table table--univ">
              <colgroup><col><col><col><col><col><col><col><col></colgroup>
              <thead>
                <tr>
                  <th class="center">개설학과</th>
                  <th class="center">개설강좌</th>
                  <th class="center">전체교수</th>
                  <th class="center">임직원</th>
                  <th class="center">학생</th>
                  <th class="center">휴학생</th>
                  <th class="center">대학원생</th>
                  <th class="center">졸업생</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="center">53</td>
                  <td class="center">214</td>
                  <td class="center">64</td>
                  <td class="center">24</td>
                  <td class="center">2047</td>
                  <td class="center">127</td>
                  <td class="center">364</td>
                  <td class="center">5680</td>
                </tr>
              </tbody>
            </table>
          </div>
        </article>

        <div class="spacer"></div>

        <!-- 2) 교육 운영 현황 -->
        <article class="block">
          <header class="block__head"><h4 class="block__title">교육 운영 현황</h4></header>
          <div class="block__body">
            <table class="table table--edu">
              <colgroup><col><col><col><col><col><col><col><col><col><col></colgroup>
              <thead>
                <tr>
                  <th class="center">학과</th>
                  <th class="center">과목코드</th>
                  <th class="center">과목명</th>
                  <th class="center">학년</th>
                  <th class="center">담당교수</th>
                  <th class="center">구분</th>
                  <th class="center">학점</th>
                  <th class="center">강의장</th>
                  <th class="center">수강인원</th>
                  <th class="center">수강률</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="center">국어국문학과</td>
                  <td class="center">120001</td>
                  <td class="center">고전소설Ⅰ</td>
                  <td class="center">2학년</td>
                  <td class="center">김국어</td>
                  <td class="center">전공</td>
                  <td class="center">3</td>
                  <td class="center">인문관101</td>
                  <td class="center">32/46</td>
                  <td class="center">70%</td>
                </tr>
                <tr>
                  <td class="center">컴퓨터과학과</td>
                  <td class="center">830003</td>
                  <td class="center">자바프로그래밍</td>
                  <td class="center">2학년</td>
                  <td class="center">김자바</td>
                  <td class="center">전공</td>
                  <td class="center">3</td>
                  <td class="center">컴퓨터실</td>
                  <td class="center">32/46</td>
                  <td class="center">70%</td>
                </tr>
                <tr>
                  <td class="center">컴퓨터과학과</td>
                  <td class="center">830001</td>
                  <td class="center">프로그래밍의 이해</td>
                  <td class="center">1학년</td>
                  <td class="center">김코딩</td>
                  <td class="center">전공</td>
                  <td class="center">3</td>
                  <td class="center">공학관101</td>
                  <td class="center">32/46</td>
                  <td class="center">70%</td>
                </tr>
              </tbody>
            </table>
          </div>
        </article>

        <!-- 3) 2열: 학년별 / 학과별 학생 현황 -->
        <div class="grid-2" style="margin-top:14px;">
          <!-- 학년별 -->
          <article class="block" id="by-grade">
            <header class="block__head"><h4 class="block__title">학년별 학생 현황</h4></header>
            <div class="block__body">
              <table class="table table--bygrade">
                <thead>
                  <tr><th class="center">학년</th><th class="center">재학생</th><th class="center">휴학생</th><th class="center">전체</th></tr>
                </thead>
                <tbody>
                  <tr><td class="center">1학년</td><td>460</td><td>32</td><td>492</td></tr>
                  <tr><td class="center">2학년</td><td>460</td><td>32</td><td>492</td></tr>
                  <tr><td class="center">3학년</td><td>460</td><td>32</td><td>492</td></tr>
                  <tr><td class="center">4학년</td><td>460</td><td>32</td><td>492</td></tr>
                </tbody>
                <tfoot>
                  <tr><td class="center"><strong>총합</strong></td><td><strong>1840</strong></td><td><strong>128</strong></td><td><strong>1968</strong></td></tr>
                </tfoot>
              </table>
            </div>
          </article>

          <!-- 학과별 -->
          <article class="block" id="by-major">
            <header class="block__head"><h4 class="block__title">학과별 학생 현황</h4></header>
            <div class="block__body">
              <table class="table table--bymajor">
                <thead>
                  <tr><th class="center">학과</th><th class="center">재학생</th><th class="center">휴학생</th><th class="center">전체</th></tr>
                </thead>
                <tbody>
                  <tr><td class="center">국어국문학과</td><td>120</td><td>2</td><td>122</td></tr>
                  <tr><td class="center">영어영문학과</td><td>87</td><td>2</td><td>89</td></tr>
                  <tr><td class="center">컴퓨터공학과</td><td>163</td><td>27</td><td>190</td></tr>
                  <tr><td class="center">경영학과</td><td>460</td><td>32</td><td>546</td></tr>
                </tbody>
                <tfoot>
                  <tr><td class="center"><strong>총합</strong></td><td><strong>1840</strong></td><td><strong>128</strong></td><td><strong>1968</strong></td></tr>
                </tfoot>
              </table>
            </div>
          </article>
        </div>

        <!-- 4) 2열: 학사안내 공지 / 입학상담 -->
        <div class="grid-2" style="margin-top:14px;">
          <!-- 공지 -->
          <article class="block">
            <header class="block__head"><h4 class="block__title">학사안내 공지사항</h4></header>
            <div class="block__body">
              <table class="table">
                <thead>
                  <tr><th class="center" style="width:70px">번호</th><th>제목</th><th class="center" style="width:90px">작성자</th><th class="center" style="width:90px">작성일</th></tr>
                </thead>
                <tbody>
                  <tr><td class="center">12</td><td><a class="link" href="#">2025학년도 신입생 추가모집 안내</a></td><td class="center">담당자</td><td class="center">24.04.09</td></tr>
                  <tr><td class="center">11</td><td><a class="link" href="#">2025학년도 신입생 추가모집 공고</a></td><td class="center">담당자</td><td class="center">24.04.09</td></tr>
                  <tr><td class="center">10</td><td><a class="link" href="#">장학금 지급 일정 안내</a></td><td class="center">담당자</td><td class="center">24.04.09</td></tr>
                </tbody>
              </table>
            </div>
          </article>

          <!-- 상담 -->
          <article class="block">
            <header class="block__head"><h4 class="block__title">입학상담</h4></header>
            <div class="block__body">
              <table class="table">
                <thead>
                  <tr><th class="center" style="width:70px">번호</th><th>제목</th><th class="center" style="width:90px">작성일</th><th class="center" style="width:80px">상태</th></tr>
                </thead>
                <tbody>
                  <tr><td class="center">5</td><td><a class="link" href="#">[문의] 전시시간 관련해 문의드립니다…</a></td><td class="center">24.06.24</td><td class="center"><span class="status status--warn">답변대기</span></td></tr>
                  <tr><td class="center">3</td><td><a class="link" href="#">2025학년도 신입학 추가모집 문의</a></td><td class="center">24.06.24</td><td class="center"><span class="status status--done">답변완료</span></td></tr>
                  <tr><td class="center">1</td><td><a class="link" href="#">전형료 환불 규정이 궁금합니다</a></td><td class="center">24.06.24</td><td class="center"><span class="status status--done">답변완료</span></td></tr>
                </tbody>
              </table>
            </div>
          </article>
        </div>

      </div>
    </section>
  </main>
</div>

<footer class="site-footer" role="contentinfo" style="background:#19202D;color:#cfd3db;height:60px;display:flex;align-items:center;">
  <div class="footer-inner" style="width:min(1400px,96vw);margin:0 auto;padding:0 20px;font-size:12px;letter-spacing:.02em;">
    Copyright &copy; Green University All rights reserved. ADMINISTRATOR Version 1.4.1
  </div>
</footer>
</body>
</html>
