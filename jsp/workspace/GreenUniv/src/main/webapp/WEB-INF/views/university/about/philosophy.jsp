<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 교육이념  </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/style_phi.css">

</head>
<body>
  <%-- 헤더 부분 포함 --%>
<%@ include file="/WEB-INF/views/_header.jsp" %>
  <!-- 메인 -->
<main class="main-container">
<aside>
    <p class="aside-title">대학소개</p>
    <nav aria-label="대학소개 사이드 메뉴">
      <ul>
        <li><a href="${pageContext.request.contextPath}/about/president.do">총장 인사말</a></li>
        <li><a href="${pageContext.request.contextPath}/about/philosophy.do" aria-current="page">교육이념</a></li>
        <li><a href="${pageContext.request.contextPath}/about/history.do">연혁</a></li>
        <li><a href="${pageContext.request.contextPath}/about/organization.do">조직도</a></li>
        <li><a href="${pageContext.request.contextPath}/about/directions.do">오시는길</a></li>
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

<%-- 푸터 부분 포함 --%>
<%@ include file="/WEB-INF/views/_footer.jsp" %>

<script>
  // 주요사이트 이동
  document.getElementById('sites').addEventListener('change', function(){
    if(this.value){ window.open(this.value, '_blank'); this.selectedIndex = 0; }
  });

</script>
</body>
</html>
