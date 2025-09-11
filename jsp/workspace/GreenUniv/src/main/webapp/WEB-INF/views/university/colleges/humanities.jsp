<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>그린대학교 | 인문사회대학</title>
  <!-- 전용 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/colleges/humanities.css">
</head>
<body>
  <div id="wrapper">
    <%-- 헤더 부분 포함 --%>
<%@ include file="/WEB-INF/views/_header.jsp" %>

    <!-- breadcrumb -->
    <div class="breadcrumb">
      <div class="container">
        <ul>
          <li><a href="/"><img src="/images/ico-home.png" alt="홈"></a></li>
          <li><img src="/images/bg-path-arrow.png" alt=">"></li>
          <li><a href="#">대학·대학원</a></li>
          <li><img src="/images/bg-path-arrow.png" alt=">"></li>
          <li class="active"><a href="#">인문사회대학</a></li>
        </ul>
      </div>
    </div>

    <!-- 메인 -->
    <main>
      <div class="container">
        <!-- 사이드 메뉴 -->
        <aside class="side-nav">
          <h2>대학 · 대학원</h2>
          <ul>
          	<li class="active"><a href="${pageContext.request.contextPath}/colleges/humanities.do">인문사회대학</a></li>
            <li><a href="${pageContext.request.contextPath}/colleges/science.do">자연과학대학</a></li>
            <li><a href="${pageContext.request.contextPath}/colleges/engineering.do">공과대학</a></li>
            <li><a href="${pageContext.request.contextPath}/colleges/education.do">사범대학</a></li>
            <li><a href="${pageContext.request.contextPath}/colleges/graduate.do">대학원</a></li>
          </ul>
        </aside>

        <!-- 본문 -->
        <section class="content">
          <h3>인문사회대학</h3>

          <div class="college-intro">
            <img src="${pageContext.request.contextPath}/images/college-introduce-1.jpg" alt="인문사회대학 소개 이미지" class="intro-img">
            <div class="intro-text">
              <span class="eng-title">Humanities And Social Sciences</span>
              <h4>인문, 사회분야의 다양하고 심화된 이론을 연구</h4>
              <p>
                인문사회과학대학은 인문의 문화적 유산과 전통을 창조적으로 계승·발전시킬 열린 민주시민,
                세계시민적 자질, 정보사회적 능력을 갖춘 인재 양성을 목표로 하고 있습니다.
                철학, 법, 정치 경제, 언론 등 우리사회의 중심을 이루는 영역에서 창의로운 사고력을
                기르고 합리적 비판정신을 육성하며, 디자인을 통한 문제 해결적 표현을 수행합니다.
              </p>
            </div>
          </div>

          <h4 class="table-title">학부 및 학과</h4>
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
              <tr>
                <td>국어국문학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td>
                <td>김국어</td>
                <td>051-123-1001</td>
                <td></td>
              </tr>
              <tr>
                <td>영어영문학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td>
                <td>김영어</td>
                <td>051-123-1002</td>
                <td></td>
              </tr>
              <tr>
                <td>일어일문학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td>
                <td>김일어</td>
                <td>051-123-1003</td>
                <td></td>
              </tr>
              <tr>
                <td>중어중문학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td>
                <td>김중어</td>
                <td>051-123-1004</td>
                <td></td>
              </tr>
              <tr>
                <td>역사학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td>
                <td>김역사</td>
                <td>051-123-1005</td>
                <td></td>
              </tr>
              <tr>
                <td>경제학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td>
                <td>김경제</td>
                <td>051-123-1006</td>
                <td></td>
              </tr>
              <tr>
                <td>경영학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td>
                <td>김경영</td>
                <td>051-123-1007</td>
                <td></td>
              </tr>
              <tr>
                <td>법학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td>
                <td>김법학</td>
                <td>051-123-1008</td>
                <td></td>
              </tr>
              <tr>
                <td>철학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td>
                <td>김철학</td>
                <td>051-123-1009</td>
                <td></td>
              </tr>
              <tr>
                <td>정치외교학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td>
                <td>김정치</td>
                <td>051-123-1010</td>
                <td></td>
              </tr>
              <tr>
                <td>행정학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td>
                <td>김행정</td>
                <td>051-123-1011</td>
                <td></td>
              </tr>
              <tr>
                <td>사회복지학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td>
                <td>김사회</td>
                <td>051-123-1012</td>
                <td></td>
              </tr>
              <tr>
                <td>유아교육학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td>
                <td>김유아</td>
                <td>051-123-1013</td>
                <td></td>
              </tr>
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
