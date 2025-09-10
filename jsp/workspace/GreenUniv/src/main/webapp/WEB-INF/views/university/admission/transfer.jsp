<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>그린대학교 | 편입학</title>
  <!-- 편입학 전용 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/admission/transfer.css">
</head>
<body>
  <div id="wrapper">
    
<%-- 헤더 부분 포함 --%>
<%@ include file="/WEB-INF/views/_header.jsp" %>

    <!-- breadcrumb -->
    <div class="background">
      <div class="container">
        <div class="sub-nav">
          <ul>
            <li><a href="/"><img src="${pageContext.request.contextPath}/images/ico-home.png" height="15" alt="홈"></a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li><a href="#">입학안내</a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li class="active"><a href="#">편입학</a></li>
          </ul>
        </div>
      </div>
    </div>

    <!-- 메인 -->
    <main>
      <div class="container">
        <!-- 사이드 메뉴 -->
        <aside class="side-nav">
          <h2>입학안내</h2>
          <ul>
            <li><a href="${pageContext.request.contextPath}/admission/notice.do">공지사항</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/early.do">수시모집</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/regular.do">정시모집</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/admission/transfer.do">편입학</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/counseling.do">입학상담</a></li>
          </ul>
        </aside>

        <!-- 본문 -->
        <section class="content">
          <h3>편입학</h3>
          <p>
            그린대학교 편입학 안내 페이지입니다.<br>
            모집요강, 지원 자격, 제출 서류 및 전형 방법을 확인할 수 있습니다.
          </p>
          <div class="transfer-box">
            <h4>📌 주요 안내</h4>
            <ul>
              <li>편입학 모집요강 PDF 다운로드</li>
              <li>지원 자격: 전문대 졸업(예정)자, 4년제 대학 2학년 이상 수료자</li>
              <li>원서 접수 일정: 2025년 11월 15일 ~ 11월 25일</li>
              <li>합격자 발표: 2026년 1월 예정</li>
            </ul>
          </div>
        </section>
      </div>
    </main>


<%-- 푸터 부분 포함 --%>
<%@ include file="/WEB-INF/views/_footer.jsp" %>
  </div>
</body>
</html>
