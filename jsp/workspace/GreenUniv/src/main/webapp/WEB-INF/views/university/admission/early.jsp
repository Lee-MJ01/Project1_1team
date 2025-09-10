<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>그린대학교 | 입학안내 - 수시모집</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/admission/early.css">
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
            <li class="active"><a href="#">수시모집</a></li>
          </ul>
        </div>
      </div>
    </div>

    <!-- 메인 -->
    <main>
      <div class="container">
        <!-- 좌측 네비 -->
        <aside class="side-nav">
          <h2>입학안내</h2>
          <ul>
          	<li><a href="${pageContext.request.contextPath}/admission/notice.do">공지사항</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/admission/early.do">수시모집</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/regular.do">정시모집</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/transfer.do">편입학</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/counseling.do">입학상담</a></li>
          </ul>
        </aside>

        <!-- 본문 -->
        <section class="content">
          <h3>수시모집</h3>
          <p>
            여기에 수시모집 관련 내용을 입력하세요.<br>
            (예: 모집 요강 PDF 링크, 주요 일정, 지원 자격 안내 등)
          </p>
        </section>
      </div>
    </main>
<%-- 푸터 부분 포함 --%>
<%@ include file="/WEB-INF/views/_footer.jsp" %>
  </div>
</body>
</html>
