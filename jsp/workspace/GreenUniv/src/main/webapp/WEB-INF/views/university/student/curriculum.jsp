<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 교과과정  </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/student/css/style_cur.css">

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
        <li><a href="/university/student/registration.html">수강신청</a></li>
        <li><a href="/university/student/registered.html" >수강신청내역</a></li>
        <li><a href="/university/student/curriculum.html" aria-current="page">나의교육과정</a></li>
        <li><a href="/university/student/grades.html">성적조회</a></li>
        <li><a href="/university/student/records.html">학적</a></li>
      </ul>
    </nav>
  </aside>

  <section>
    <h2 class="main-title">교과과정</h2>
    <div class="tablehead">
      <img src="${pageContext.request.contextPath}/images/bullet-h4.png">
      공통과목(전공)
    </div>
      <div class="subject-table">
        <table>
          <tr>
            <th>학번</th>
            <th>코드번호</th>
            <th>이수구분</th>
            <th>교과목명</th>
            <th>학점</th>
          </tr>

          <tr>
            <td>1</td>
            <td>G01940</td>
            <td>공통</td>
            <td>드로잉</td>
            <td>3</td>
          </tr>
          <tr>
            <td>1</td>
            <td>G01940</td>
            <td>공통</td>
            <td>프로그래밍언어</td>
            <td>3</td>
          </tr>
          <tr>
            <td>1</td>
            <td>G01940</td>
            <td>공통</td>
            <td>컴퓨터구조개론</td>
            <td>3</td>
          </tr>

          <tr>
            <td>2</td><td>G02940</td><td>선택</td><td>자료구조</td><td>3</td>
          </tr>
          <tr>
            <td>2</td><td>G02941</td><td>선택</td><td>운영체제</td><td>3</td>
          </tr>



        </table>


      </div>

    <!-- 선택과목(교양) -->
    <div class="tablehead">
      <img src="${pageContext.request.contextPath}/images/bullet-h4.png" >
      선택과목(교양)
    </div>
      <div class="subject-table">
        <table>
          <thead>
            <tr>
              <th>수준</th>
              <th>코드번호</th>
              <th>이수구분</th>
              <th>교과목명</th>
              <th>학점</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>G01940</td>
              <td>공통</td>
              <td>대학영어</td>
              <td>3</td>
            </tr>
            <tr>
              <td>1</td>
              <td>G01940</td>
              <td>공통</td>
              <td>사회학개론</td>
              <td>3</td>
            </tr>
          </tbody>
        </table>
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

  document.addEventListener("DOMContentLoaded", () => {
  const tables = document.querySelectorAll(".subject-table table");

  tables.forEach(table => {
    const rows = table.querySelectorAll("tbody tr");
    let prevValue = null;
    let spanCell = null;
    let spanCount = 1;

    rows.forEach(row => {
      const cell = row.cells[0]; // 첫 번째 열 (학번 or 수준)
      if (!cell) return;
      const value = cell.textContent.trim();

      if (value === prevValue) {
        // 이전 값과 같으면 현재 셀 제거, rowspan 증가
        cell.remove();
        spanCount++;
        spanCell.rowSpan = spanCount;
      } else {
        // 새 그룹 시작
        prevValue = value;
        spanCell = cell;
        spanCount = 1;
      }
    });
  });
});


</script>
</body>
</html>
