<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 수강신청  </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/student/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/student/style_reg.css">

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
        <li><a href="${pageContext.request.contextPath}/student/registration.do"  aria-current="page">수강신청</a></li>
        <li><a href="${pageContext.request.contextPath}/student/registered.do">수강신청내역</a></li>
        <li><a href="${pageContext.request.contextPath}/student/curriculum.do">나의교육과정</a></li>
        <li><a href="${pageContext.request.contextPath}/student/grades.do">성적조회</a></li>
        <li><a href="${pageContext.request.contextPath}/student/records.do">학적</a></li>
      </ul>
    </nav>
  </aside>

  <section>
    <h2 class="main-title">수강신청</h2>

    <div class="search">
        <form action="#">
            <select name="searchType">
                <option value="#">선택</option>
                <option value="#">개설학과</option>
                <option value="#">구분</option>
                <option value="#">학년</option>
                <option value="#">코드</option>
                <option value="#">과목명</option>
                <option value="#">학점</option>
                <option value="#">담당교수</option>
            </select>
            <input type="text" name="keyword" placeholder="검색어를 입력하세요">
            <input type="submit" value="검색">
        </form>
    </div>

    <div class="main-wrapper">
        <table border="0" class="main-table">
          <thead>
            <tr>
              <th>개설학과</th>
              <th>구분</th>
              <th>학년</th>
              <th>코드</th>
              <th>과목명</th>
              <th>학점</th>
              <th>담당교수</th>
              <th>수강인원</th>
              <th>비고</th>
              <th>신청</th>
            </tr>
          </thead>
          <tbody>
            <c:if test="${empty courseList}">
              <tr>
                <td colspan="10">개설된 강좌가 없습니다.</td>
              </tr>
            </c:if>
            <c:forEach var="course" items="${courseList}">
              <tr>
                <td><c:out value="${course.dept_name}"/></td>
                <td><c:out value="${course.division}"/></td>
                <td><c:out value="${course.year}"/></td>
                <td><c:out value="${course.crs_cd}"/></td>
                <td><c:out value="${course.crs_name}"/></td>
                <td><c:out value="${course.credit}"/></td>
                <td><c:out value="${course.professorName}"/></td>
                <td>${course.enrolledCount} / ${course.capacity}</td>
                <td></td>
                <td>
                  <form action="${pageContext.request.contextPath}/student/registration.do" method="post" style="margin:0;">
                    <input type="hidden" name="crs_cd" value="${course.crs_cd}">
                    <input type="submit" value="신청" class="btn-apply">
                  </form>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>

        <div class="pagination">
            <c:if test="${pagenationDTO.pageGroupStart > 1}">
                <a href="?pg=${pagenationDTO.pageGroupStart - 1}"><img src="${pageContext.request.contextPath}/images/btn-prev-page.png" alt="이전"></a>
            </c:if>

            <c:forEach var="pageNum" begin="${pagenationDTO.pageGroupStart}" end="${pagenationDTO.pageGroupEnd}">
                <a href="?pg=${pageNum}" class="${pageNum == pagenationDTO.currentPage ? 'active' : ''}">${pageNum}</a>
            </c:forEach>

            <c:if test="${pagenationDTO.pageGroupEnd < pagenationDTO.lastPageNum}">
                <a href="?pg=${pagenationDTO.pageGroupEnd + 1}"><img src="${pageContext.request.contextPath}/images/btn-next-page.png" alt="다음"></a>
            </c:if>
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