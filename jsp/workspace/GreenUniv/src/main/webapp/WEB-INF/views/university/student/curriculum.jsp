<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 교과과정  </title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/student/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/student/css/style_cur.css">

</head>
<body>
  <!-- 헤더 -->
  <header>
    <div class="topbar">
      <div class="container topbar__nav" role="navigation" aria-label="상단 빠른 메뉴">
        <ul class="topbar__list">
          <li class="topbar__item"><a href="/university/index.html">HOME</a></li>
          <li class="topbar__item"><a href="#">사이트맵</a></li>
          <li class="topbar__item"><a href="/university/member/login.html">로그인</a></li>
          <li class="topbar__item"><a href="/university/student/registration.html">학생지원</a></li>
        </ul>
      </div>
    </div>
    <nav class="gnb" role="navigation" aria-label="주 메뉴">
      <div class="container gnb__inner">
        <a href="/" aria-label="그린대학교 홈"><img class="brand__logo" src="/images/header_logo.png" alt="그린대학교"></a>
        <ul class="menu__list">
          <li><a class="menu__link" href="/university/about/president.html">대학소개</a></li>
          <li><a class="menu__link" href="/university/admission/notice.html">입학안내</a></li>
          <li><a class="menu__link" href="/university/colleges/humanities.html">대학·대학원</a></li>
          <li><a class="menu__link" href="/university/academics/notice.html">학사안내</a></li>
          <li><a class="menu__link" href="/university/campuslife/student-union.html">대학생활</a></li>
          <li><a class="menu__link" href="/university/community/notice.html">커뮤니티</a></li>
        </ul>
      </div>
    </nav>

    <div class="header-subnav">
        <div class="container">
            <ul>
                <li class="header-homeimg"><a href="#"><img src="/images/ico-home.png"></a></li>
                <li class="header-arrowimg"><img src="/images/bg-path-arrow.png"></li>
                <li>학생지원</li>
                <li class="header-arrowimg"><img src="/images/bg-path-arrow.png"></li>
                <li class="subnav-lasta">교과과정</li>
            </ul>
        </div>    
    </div>
  </header>

  <!-- 메인 -->
<main class="main-container">
  <aside>
    <p class="aside-title">학생지원</p>
    <nav aria-label="학생지원 사이드 메뉴">
      <ul>
        <li><a href="/university/student/registration.html">수강신청</a></li>
        <li><a href="/university/student/registered.html" >수강신청내역</a></li>
        <li><a href="/university/student/curriculum.html" aria-current="page">나의교육과정</a></li>
        <li><a href="/university/student/grades.html">성적조회</a></li>
        <li><a href="/university/student/records.html">학적</a></li>
      </ul>
    </nav>
  </aside>

  <section>
    <h2 class="main-title">교과과정</h2>
    <div class="tablehead">
      <img src="${pageContext.request.contextPath}/images/bullet-h4.png">
      공통과목(전공)
    </div>
      <div class="subject-table">
        <table>
          <tr>
            <th>학번</th>
            <th>코드번호</th>
            <th>이수구분</th>
            <th>교과목명</th>
            <th>학점</th>
          </tr>

          <tr>
            <td>1</td>
            <td>G01940</td>
            <td>공통</td>
            <td>드로잉</td>
            <td>3</td>
          </tr>
          <tr>
            <td>1</td>
            <td>G01940</td>
            <td>공통</td>
            <td>프로그래밍언어</td>
            <td>3</td>
          </tr>
          <tr>
            <td>1</td>
            <td>G01940</td>
            <td>공통</td>
            <td>컴퓨터구조개론</td>
            <td>3</td>
          </tr>

          <tr>
            <td>2</td><td>G02940</td><td>선택</td><td>자료구조</td><td>3</td>
          </tr>
          <tr>
            <td>2</td><td>G02941</td><td>선택</td><td>운영체제</td><td>3</td>
          </tr>



        </table>


      </div>

    <!-- 선택과목(교양) -->
    <div class="tablehead">
      <img src="${pageContext.request.contextPath}/images/bullet-h4.png" >
      선택과목(교양)
    </div>
      <div class="subject-table">
        <table>
          <thead>
            <tr>
              <th>수준</th>
              <th>코드번호</th>
              <th>이수구분</th>
              <th>교과목명</th>
              <th>학점</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>G01940</td>
              <td>공통</td>
              <td>대학영어</td>
              <td>3</td>
            </tr>
            <tr>
              <td>1</td>
              <td>G01940</td>
              <td>공통</td>
              <td>사회학개론</td>
              <td>3</td>
            </tr>
          </tbody>
        </table>
      </div>


  
  </section>

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
        <img class="footer__logo" src="/images/footer_logo.png" alt="그린대학교 로고">
        <div>
          <ul class="footer__info">
            <li>그린대학교</li>
            <li>[12345] 부산광역시 부산진구 부전대로 123 그린대학교 / 대표전화 : 051-123-1000</li>
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

  document.addEventListener("DOMContentLoaded", () => {
  const tables = document.querySelectorAll(".subject-table table");

  tables.forEach(table => {
    const rows = table.querySelectorAll("tbody tr");
    let prevValue = null;
    let spanCell = null;
    let spanCount = 1;

    rows.forEach(row => {
      const cell = row.cells[0]; // 첫 번째 열 (학번 or 수준)
      if (!cell) return;
      const value = cell.textContent.trim();

      if (value === prevValue) {
        // 이전 값과 같으면 현재 셀 제거, rowspan 증가
        cell.remove();
        spanCount++;
        spanCell.rowSpan = spanCount;
      } else {
        // 새 그룹 시작
        prevValue = value;
        spanCell = cell;
        spanCount = 1;
      }
    });
  });
});


</script>
</body>
</html>
