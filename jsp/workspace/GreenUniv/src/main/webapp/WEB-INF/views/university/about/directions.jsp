<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 오시는길  </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/style_dir.css">

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
        <li><a href="${pageContext.request.contextPath}/about/organization.do">조직도</a></li>
        <li><a href="${pageContext.request.contextPath}/about/directions.do" aria-current="page">오시는길</a></li>
      </ul>
    </nav>
  </aside>

  <section>
    <h2 class="main-title">오시는길</h2>
    
    <div class="dir-map">
        <iframe src="https://naver.me/G58bYBzg" width="100%" height="500px" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
    </div>
    
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
