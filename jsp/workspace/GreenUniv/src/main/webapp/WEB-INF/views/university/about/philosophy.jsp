<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 교육이념  </title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/style_phi.css">

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
        <a href="/" aria-label="그린대학교 홈"><img class="brand__logo" src="/images/header_logo.png" alt="그린대학교"></a>
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
                <li class="header-homeimg"><a href="#"><img src="/images/ico-home.png"></a></li>
                <li class="header-arrowimg"><img src="/images/bg-path-arrow.png"></li>
                <li>대학소개</li>
                <li class="header-arrowimg"><img src="/images/bg-path-arrow.png"></li>
                <li class="subnav-lasta">교육이념</li>
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
        <li><a href="./philosophy.html" aria-current="page">교육이념</a></li>
        <li><a href="./history.html">연혁</a></li>
        <li><a href="./organization.html">조직도</a></li>
        <li><a href="./directions.html">오시는길</a></li>
      </ul>
    </nav>
  </aside>

  <section class="edu-ideology">
  <h2 class="main-title">교육이념</h2>

  <!-- 교육철학 -->
  <div class="ideology-row">
    <div class="ideology-label label-blue">교육철학</div>
    <div class="ideology-card">
      <strong>Green Spirit, Smart Innovation</strong>
      <p>자연과 기술의 조화로 지속가능한 미래를 준비한다.</p>
    </div>
  </div>

  <!-- 교육이념 -->
  <div class="ideology-row">
    <div class="ideology-label label-blue">교육이념</div>
    <ul class="ideology-list bullets">
      <li>지속가능한 사회를 이끄는 책임 있는 시민 양성</li>
      <li>혁신적 IT로 환경·사회 문제 해결</li>
      <li>지역과 세계에 기여하는 열린 협력</li>
    </ul>
  </div>

  <!-- 교육목적 -->
  <div class="ideology-row">
    <div class="ideology-label label-cyan">교육목적</div>
    <ul class="ideology-list arrows two-col">
      <li>환경·IT 융합 기반의 창의적 탐구</li>
      <li>지속가능 산업 선도와 사회가치 창출</li>
      <li>데이터 기반 사고와 실천 역량 함양</li>
      <li>세계 시민으로서의 윤리와 봉사</li>
    </ul>
  </div>

  <!-- 교육목표 -->
  <div class="ideology-row">
    <div class="ideology-label label-navy">교육목표</div>
    <ol class="goals two-col">
      <li><span>인간·자연 존중의 가치관</span></li>
      <li><span>환경 감수성과 지속가능성 실천</span></li>
      <li><span>창의적 문제해결 및 창업 역량</span></li>
      <li><span>AI·데이터·보안 등 IT 전문성</span></li>
      <li><span>국제 소통과 협업 능력</span></li>
      <li><span>지역사회·산업과의 실천적 연계</span></li>
    </ol>
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
