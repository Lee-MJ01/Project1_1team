<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 성적조회  </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/student/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/student/style_grd.css">

</head>
<body>
  <%-- 헤더 부분 포함 --%>
    <%@ include file="/WEB-INF/views/_header.jsp" %>

  <!-- 메인 -->
<main class="main-container">
  <aside>
    <p class="aside-title">학생지원</p>
    <nav aria-label="학생지원 사이드 메뉴">
      <ul>
      	<li><a href="${pageContext.request.contextPath}/student/registration.do" >수강신청</a></li>
        <li><a href="${pageContext.request.contextPath}/student/registered.do" >수강신청내역</a></li>
        <li><a href="${pageContext.request.contextPath}/student/curriculum.do">나의교육과정</a></li>
        <li><a href="${pageContext.request.contextPath}/student/grades.do"  aria-current="page">성적조회</a></li>
        <li><a href="${pageContext.request.contextPath}/student/records.do">학적</a></li>
      </ul>
    </nav>
  </aside>

  <section>
  <h2 class="main-title">성적조회</h2>

    <form action="RecordSearchServlet" method="post">
    과목명: <input type="text" name="crs_name" />
    <input type="submit" value="검색" />
	</form>	

  <div class="main-wrapper">
    <table border="1" class="main-table">
    <thead>
        <tr>
            <th>교과목코드</th>
            <th>과목명</th>
            <th>대상학년</th>
            <th>담당교수</th>
            <th>이수구분</th>
            <th>점수</th>
            <th>등급</th>
            <th>취득학점</th>
            <th>기타</th>
        </tr>
    </thead>
    <tbody>
        <!-- 리스트가 비어있을 경우 -->
        <c:if test="${empty gradeList}">
            <tr>
                <td colspan="9" style="text-align:center;">등록된 성적이 없습니다.</td>
            </tr>
        </c:if>

        <!-- 리스트 반복 출력 -->
        <c:forEach var="g" items="${gradeList}">
            <tr>
                <td><c:out value="${g.crsCd}" /></td>
                <td><c:out value="${g.crsName}" /></td>
                <td><c:out value="${g.year}" /></td>
                <td><c:out value="${g.advisor}" /></td>
                <td><c:out value="${g.division}" /></td>
                <td><c:out value="${g.grade}" /></td>
                 <td><c:out value="${g.alpa}" /></td>
                 <td><c:out value="${g.credit}" /></td>
               
               
                <td><a href="#">상세확인</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>

      <div class="pagination">
        <a href="#" class=""><img src="/images/btn-first-page.png" alt="이전이전"></a>
        <a href="#" class=""><img src="/images/btn-prev-page.png" alt="이전"></a>
        <a href="#" class="">1</a>
        <a href="#" class="">2</a>
        <a href="#" class="">3</a>
        <a href="#" class=""><img src="/images/btn-next-page.png" alt="다음"></a>
        <a href="#" class=""><img src="/images/btn-last-page.png" alt="다음다음"></a>
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
