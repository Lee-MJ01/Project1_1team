<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 연혁  </title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/style_his.css">

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
                <li class="subnav-lasta">연혁</li>
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
        <li><a href="./history.html" aria-current="page">연혁</a></li>
        <li><a href="./organization.html">조직도</a></li>
        <li><a href="./directions.html">오시는길</a></li>
      </ul>
    </nav>
  </aside>
  
  <section>
    <h2 class="main-title">연혁</h2>
    <div class="history-head">
      <div class="headline">
        <p class="kicker"><strong>그린</strong>은</p>
        <h3 class="title">1995년 설립 이래 IT 교육업계의 대표기관으로 성장했습니다.</h3>
      </div>
      <div class="year-badge">
        <div class="year">2025</div>
        <div class="label">HISTORY</div>
      </div>
    </div>

    <nav class="year-tabs" aria-label="연혁 연도">
      <button class="tab is-active" data-target="y2025">2025</button>
      <button class="tab" data-target="y2024">2024</button>
      <button class="tab" data-target="y2023">2023</button>
      <button class="tab" data-target="y2022">2022</button>
      <button class="tab" data-target="y2021">2021</button>
      <button class="tab" data-target="y2020">2020</button>
    </nav>

    <!-- 2025 -->
    <ul id="y2025" class="timeline is-active">
      <li>
        <span class="line"></span>
        <span class="num">01</span>
        <p class="desc">한국산업인력공단 주관 2025년 시행 과정평가형 국가기술자격 종목별 훈련과정 지정 – 총 22개 기관, 84개 과정</p>
      </li>
      <li>
        <span class="line"></span>
        <span class="num">02</span>
        <p class="desc">부산정보산업진흥원, BNK부산은행과 디지털 실무인재 양성을 위한 디지털 트레이닝 공동 협력 협약 체결</p>
      </li>
      <li>
        <span class="line"></span>
        <span class="num">03</span>
        <p class="desc">지속가능한 IT 혁신 캠퍼스 비전 선포</p>
      </li>
      <li>
        <span class="line"></span>
        <span class="num">04</span>
        <p class="desc">AI 기반 탄소중립 데이터 플랫폼 구축 착수</p>
      </li>
    <li>
    </ul>

    <!-- 2024 -->
    <ul id="y2024" class="timeline">
      <li>
        <span class="line"></span>
        <span class="num">01</span>
        <p class="desc">AI 융합대학 신설 및 데이터사이언스 학부 개편</p>
      </li>
    </ul>

  <!-- 2023 -->
  <ul id="y2023" class="timeline">
    <li>
      <span class="line"></span>
      <span class="num">01</span>
      <p class="desc">그린대학교, 스마트팜 융합연구센터 설립</p>
    </li>
    <li>
      <span class="line"></span>
      <span class="num">02</span>
      <p class="desc">AI 기반 탄소중립 데이터 플랫폼 구축 착수</p>
    </li>
    <li>
      <span class="line"></span>
      <span class="num">03</span>
      <p class="desc">해외 대학과 공동 융합학위 과정 운영 개시</p>
    </li>
  </ul>

  <!-- 2022 -->
  <ul id="y2022" class="timeline">
    <li>
      <span class="line"></span>
      <span class="num">01</span>
      <p class="desc">지속가능한 IT 혁신 캠퍼스 비전 선포</p>
    </li>
    <li>
      <span class="line"></span>
      <span class="num">02</span>
      <p class="desc">데이터사이언스학부 및 친환경공학부 신설</p>
    </li>
    <li>
      <span class="line"></span>
      <span class="num">03</span>
      <p class="desc">국내 최초 ‘그린 IT 융합연구소’ 설립</p>
    </li>
  </ul>
  <!-- 2021 -->
  <ul id="y2021" class="timeline">
    <li>
      <span class="line"></span>
      <span class="num">01</span>
      <p class="desc">스마트 에너지 관리 시스템 캠퍼스 전역 도입</p>
    </li>
    <li>
      <span class="line"></span>
      <span class="num">02</span>
      <p class="desc">그린대학교 AI윤리연구센터 개소</p>
    </li>
    <li>
      <span class="line"></span>
      <span class="num">03</span>
      <p class="desc">글로벌 파트너십 확대: 미국·유럽 대학과 공동 연구 협정 체결</p>
    </li>
  </ul>

  <!-- 2020 -->
  <ul id="y2020" class="timeline">
    <li>
      <span class="line"></span>
      <span class="num">01</span>
      <p class="desc">코로나19 대응 온라인 학습 플랫폼 전격 도입</p>
    </li>
    <li>
      <span class="line"></span>
      <span class="num">02</span>
      <p class="desc">친환경·스마트 교통 인프라 캠퍼스 내 구축</p>
    </li>
    <li>
      <span class="line"></span>
      <span class="num">03</span>
      <p class="desc">‘그린융합대학원’ 신설, 환경+IT 융합 석사 과정 개시</p>
    </li>
  </ul>


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

  document.querySelectorAll('.year-tabs .tab').forEach(btn=>{
    btn.addEventListener('click', ()=>{
      document.querySelectorAll('.year-tabs .tab').forEach(b=>b.classList.remove('is-active'));
      document.querySelectorAll('.timeline').forEach(t=>t.classList.remove('is-active'));
      btn.classList.add('is-active');
      document.getElementById(btn.dataset.target).classList.add('is-active');
      const y = btn.textContent.trim().slice(0,4);
      const badge = document.querySelector('.year-badge .year');
      if(badge && /^\d{4}$/.test(y)) badge.textContent = y;
    });
  });

</script>
</body>
</html>
