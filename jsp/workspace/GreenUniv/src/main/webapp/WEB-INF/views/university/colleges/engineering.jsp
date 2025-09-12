<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>그린대학교 | 공과대학</title>
  <!-- 전용 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/colleges/engineering.css">
</head>
<body>
  <div id="wrapper">
    <%-- 헤더 부분 포함 --%>
<%@ include file="/WEB-INF/views/_header.jsp" %>
    <!-- breadcrumb -->
    <div class="background">
      <div class="container breadcrumb">
        <ul>
          <li><a href="/"><img src="${pageContext.request.contextPath}/images/ico-home.png" height="15" alt="홈"></a></li>
          <li><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></li>
          <li><a href="#">대학·대학원</a></li>
          <li><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></li>
          <li class="active"><a href="#">공과대학</a></li>
        </ul>
      </div>
    </div>

    <!-- 메인 -->
    <main>
      <div class="container">
        <!-- 사이드 메뉴 -->
        <aside class="side-nav">
          <h2>대학·대학원</h2>
          <ul>
          	<li><a href="${pageContext.request.contextPath}/colleges/humanities.do">인문사회대학</a></li>
            <li><a href="${pageContext.request.contextPath}/colleges/science.do">자연과학대학</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/colleges/engineering.do">공과대학</a></li>
            <li><a href="${pageContext.request.contextPath}/colleges/education.do">사범대학</a></li>
            <li><a href="${pageContext.request.contextPath}/colleges/graduate.do">대학원</a></li>
          </ul>
        </aside>

        <!-- 본문 -->
        <section class="content">
          <h3>공과대학</h3>

          <div class="college-intro">
	        <img src="${pageContext.request.contextPath}/images/college-introduce-3.jpg"
	             alt="${college.college_name} 소개 이미지" class="intro-img">
	        <div class="intro-text">
	          <span class="eng-title">${college.college_name_en}</span>
	          <h4>${college.intro_title}</h4>
	          <p>${college.intro_body}</p>
	        </div>
          </div>

          <h4 class="dept-title">학부 및 학과</h4>
          <table class="board">
            <thead>
              <tr>
                <th>학과/전공</th>
                <th>학과장</th>
                <th>학과 사무실 번호</th>
                <th>비고</th>
              </tr>
            </thead>
            <tbody>
              <tr><td>기계공학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김기계</td><td>051-123-3001</td><td></td></tr>
              <tr><td>전자공학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김전자</td><td>051-123-3002</td><td></td></tr>
              <tr><td>전기공학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김전기</td><td>051-123-3003</td><td></td></tr>
              <tr><td>컴퓨터공학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김컴공</td><td>051-123-3004</td><td></td></tr>
              <tr><td>건축공학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김건축</td><td>051-123-3005</td><td></td></tr>
              <tr><td>재료공학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김재료</td><td>051-123-3006</td><td></td></tr>
              <tr><td>화학공학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김화학</td><td>051-123-3007</td><td></td></tr>
            </tbody>
          </table>
        </section>
      </div>
    </main>


<%-- 푸터 부분 포함 --%>
<%@ include file="/WEB-INF/views/_footer.jsp" %>
  </div>
</body>
</html>
