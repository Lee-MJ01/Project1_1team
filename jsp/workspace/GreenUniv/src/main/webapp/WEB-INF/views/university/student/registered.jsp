<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 수강신청내역</title>

<%-- 필요한 CSS 파일 링크 --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/student/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/student/style_reg2.css">

</head>
<body>
    <%@ include file="/WEB-INF/views/_header.jsp" %>
<main class="main-container">
  <aside>
    <p class="aside-title">학생지원</p>
    <nav aria-label="학생지원 사이드 메뉴">
      <ul>
        <li><a href="${pageContext.request.contextPath}/student/registration.do">수강신청</a></li>
        <li><a href="${pageContext.request.contextPath}/student/registered.do" aria-current="page">수강신청내역</a></li>
        <li><a href="${pageContext.request.contextPath}/student/curriculum.do">나의교육과정</a></li>
        <li><a href="${pageContext.request.contextPath}/student/grades.do">성적조회</a></li>
        <li><a href="${pageContext.request.contextPath}/student/records.do">학적</a></li>
      </ul>
    </nav>
  </aside>

  <section>
    <h2 class="main-title">수강신청내역</h2>
    
    <%-- ▼▼▼ [수정] 이 부분을 동적으로 변경합니다 ▼▼▼ --%>
    <div class="main-top">
      <div class="select-wrap">
        <%-- (이 부분은 추후 과거 년도/학기 조회 기능 구현 시 사용) --%>
        <select id="year" name="year"><option value="2025">2025</option></select><span>년</span>
        <select id="term" name="term"><option value="2">2</option></select><span>학기</span>
      </div>
      <div class="apply-info">
        신청과목 수 ${enrolledCourses.size()}과목, 총 신청학점 --학점
      </div>
    </div>

    <div class="main-wrapper">
      <table border="0" class="main-table">
        <thead>
            <tr>
                <th>과목코드</th>
                <th>과목명</th>
                <th>구분</th>
                <th>학점</th>
                <th>담당교수</th>
                <th>신청취소</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${empty enrolledCourses}">
                <tr>
                    <td colspan="6">수강신청 내역이 없습니다.</td>
                </tr>
            </c:if>
            <c:forEach var="course" items="${enrolledCourses}">
                <tr>
                    <td><c:out value="${course.crs_cd}"/></td>
                    <td><c:out value="${course.crs_name}"/></td>
                    <td><c:out value="${course.division}"/></td>
                    <td><c:out value="${course.credit}"/></td>
                    <td><c:out value="${course.professorName}"/></td>
                    <td><a href="#" class="btn-cancel">취소</a></td>
                </tr>
            </c:forEach>
        </tbody>
      </table>
      
    </div>
  </section>
</main>
    <%@ include file="/WEB-INF/views/_footer.jsp" %>
</body>
</html>