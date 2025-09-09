<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 수강신청내역  </title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/student/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/student/style_reg2.css">

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
                <li class="subnav-lasta">수강신청내역</li>
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
        <li><a href="/university/student/registered.html"  aria-current="page">수강신청내역</a></li>
        <li><a href="/university/student/curriculum.html">나의교육과정</a></li>
        <li><a href="/university/student/grades.html">성적조회</a></li>
        <li><a href="/university/student/records.html">학적</a></li>
      </ul>
    </nav>
  </aside>

  <section>
  <h2 class="main-title">수강신청내역</h2>

  <div class="main-top">
    <div class="select-wrap">
      <select id="year" name="year">
        <option value="">선택</option>
        <option value="2025">2025</option>
        <option value="2024">2024</option>
        <option value="2023">2023</option>
      </select>
      <span>년</span>

      <select id="term" name="term">
        <option value="1">1</option>
        <option value="2">2</option>
      </select>
      <span>학기</span>
    </div>

    <div class="apply-info">
      신청과목 수 6과목, 총 신청학점 18학점
    </div>
  </div>

  <div class="main-wrapper">
      <table border="0" class="main-table">
        <tr>
          <th>교과목코드</th>
          <th>과목명</th>
          <th>대상학년</th>
          <th>담당교수</th>
          <th>학점</th>
          <th>이수구분</th>
          <th>강의시간</th>
          <th>강의장</th>
          <th>관리</th>
        </tr>

        <tr>
          <td>830003</td>
          <td>자바 프로그래밍</td>
          <td>2학년</td>
          <td>김자바</td>
          <td>3</td>
          <td>전공</td>
          <td>화 1,2,3</td>
          <td>컴퓨터실</td>
          <td>
            <a href="#">취소</a>
          </td>
        </tr>

        <tr>
          <td>830003</td>
          <td>자바 프로그래밍</td>
          <td>2학년</td>
          <td>김자바</td>
          <td>3</td>
          <td>전공</td>
          <td>화 1,2,3</td>
          <td>컴퓨터실</td>
          <td>
            <a href="#">취소</a>
          </td>
        </tr>

      </table>

      <div class="pagination">
        <a href="#" class=""><img src="/images/btn-first-page.png" alt="이전이전"></a>
        <a href="#" class=""><img src="/images/btn-prev-page.png" alt="이전"></a>
        <a href="#" class="">1</a>
        <a href="#" class="">2</a>
        <a href="#" class="">3</a>
        <a href="#" class=""><img src="/images/btn-next-page.png" alt="다음"></a>
        <a href="#" class=""><img src="/images/btn-last-page.png" alt="다음다음"></a>
      </div>

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

</script>
</body>
</html>
