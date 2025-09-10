<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 연혁  </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/style_his.css">

</head>
<body><%-- 헤더 부분 포함 --%>
<%@ include file="/WEB-INF/views/_header.jsp" %>

  <!-- 메인 -->
<main class="main-container">
 <aside>
    <p class="aside-title">대학소개</p>
    <nav aria-label="대학소개 사이드 메뉴">
      <ul>
        <li><a href="${pageContext.request.contextPath}/about/president.do">총장 인사말</a></li>
        <li><a href="${pageContext.request.contextPath}/about/philosophy.do">교육이념</a></li>
        <li><a href="${pageContext.request.contextPath}/about/history.do" aria-current="page">연혁</a></li>
        <li><a href="${pageContext.request.contextPath}/about/organization.do">조직도</a></li>
        <li><a href="${pageContext.request.contextPath}/about/directions.do" >오시는길</a></li>
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


<%-- 푸터 부분 포함 --%>
<%@ include file="/WEB-INF/views/_footer.jsp" %>
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
