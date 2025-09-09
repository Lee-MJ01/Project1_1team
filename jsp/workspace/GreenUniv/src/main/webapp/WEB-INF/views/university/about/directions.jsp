<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 오시는길  </title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/style_dir.css">

</head>
<body>
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

    <div class="header-subnav">
        <div class="container">
            <ul>
                <li class="header-homeimg"><a href="#"><img src="${pageContext.request.contextPath}/images/ico-home.png"></a></li>
                <li class="header-arrowimg"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png"></li>
                <li>대학소개</li>
                <li class="header-arrowimg"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png"></li>
                <li class="subnav-lasta">오시는길</li>
            </ul>
        </div>    
    </div>
  </header>

  <!-- 메인 -->
<main class="main-container">
  <aside>
    <p class="aside-title">대학소개</p>
    <nav aria-label="대학소개 사이드 메뉴">
      <ul>
        <li><a href="./president.html">총장 인사말</a></li>
        <li><a href="./philosophy.html">교육이념</a></li>
        <li><a href="./history.html">연혁</a></li>
        <li><a href="./organization.html">조직도</a></li>
        <li><a href="./directions.html" aria-current="page">오시는길</a></li>
      </ul>
    </nav>
  </aside>

  <section>
    <h2 class="main-title">오시는길</h2>
    <!-- 필요하면 지도로 대체 -->
    <div class="dir-map"><img src="${pageContext.request.contextPath}/images/direction.png" alt="캠퍼스 지도"></div>

    <div class="directions">
      <div class="dir-block">
        <h3 class="dir-title"><span class="dir-tag">주소</span></h3>
        <ul class="dir-list">
          <li><strong>부산 부산진구 중앙대로 749</strong> <br>
            지하철 서면역 15번출구 앞에 위치하고 있습니다. <br>
            파란 간판 찾아주세요(부전시장 가기 전, 범향빌딩 4층)</li>
        </ul>
      </div>
      <div class="dir-block">
        <h3 class="dir-title"><span class="dir-tag">지하철 이용</span></h3>
        <ul class="dir-list">
          <li><strong>서면역</strong> 하차 → 지하철 <strong>15번 출구</strong> <br>
            나와서 파란 간판 찾아주세요 (부전시장 가기 전, 범향빌딩 4층)</li>
        </ul>
      </div>
      <div class="dir-block">
        <h3 class="dir-title"><span class="dir-tag">버스 이용</span></h3>
        <ul class="dir-list">
          <li><strong>23, 52,81,83,86,99,138,167,1004 <br>
            부전시장</strong> 하차 <br>
            나와서 파란 간판 찾아주세요 (부전시장 가기 전, 범향빌딩 4층)</li>
        </ul>
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
        <img class="footer__logo" src="${pageContext.request.contextPath}/images/footer_logo.png" alt="그린대학교 로고">
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
