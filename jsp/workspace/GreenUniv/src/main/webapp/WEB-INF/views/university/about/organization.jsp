<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 조직도  </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/style_org.css">

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
        <li><a href="${pageContext.request.contextPath}/about/philosophy.do">교육이념</a></li>
        <li><a href="${pageContext.request.contextPath}/about/history.do">연혁</a></li>
        <li><a href="${pageContext.request.contextPath}/about/organization.do" aria-current="page">조직도</a></li>
        <li><a href="${pageContext.request.contextPath}/about/directions.do" >오시는길</a></li>
      </ul>
    </nav>
  </aside>

  <section>
    <h2 class="main-title">조직도</h2>

    <div class="org-top">
      <div class="node node--primary">총장</div>
    </div>

    <div class="org-advisory">
      <div class="node node--outline">교무위원회</div>
      <div class="node node--outline">대학평의원회</div>
      <div class="node node--outline">정책특별보좌관</div>
    </div>

    <div class="org-vps">
      <div class="node node--accent">학무부총장</div>
      <div class="node node--accent">대외부총장</div>
    </div>

    <!-- 하단: 깔끔한 세로 정렬 -->
    <div class="org-grid">
      <div class="org-col">
        <h3>대학본부</h3>
        <ul>
          <li>교무처 (교무과, 학사관리과)</li>
          <li>학생처 (학생복지과)</li>
        </ul>
      </div>

      <div class="org-col">
        <h3>대학</h3>
        <ul>
          <li>인문사회과학대학</li>
          <li>자연과학대학</li>
          <li>경영대학</li>
          <li>공과대학</li>
          <li>환경·해양대학</li>
          <li>AI·데이터융합대학</li>
        </ul>
      </div>

      <div class="org-col">
        <h3>대학원</h3>
        <ul>
          <li>일반대학원</li>
          <li>전문대학원 (기술경영전문대학원)</li>
          <li>특수대학원 (산업대학원)</li>
        </ul>
      </div>

      <div class="org-col">
        <h3>부속·지원시설</h3>
        <ul>
          <li>도서관</li>
          <li>정보전산원</li>
          <li>학생생활관</li>
        </ul>
      </div>
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
