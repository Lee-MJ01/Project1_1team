<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 수강신청내역  </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/student/style_reg2.css">

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
        <li><a href="/university/student/registered.html"  aria-current="page">수강신청내역</a></li>
        <li><a href="/university/student/curriculum.html">나의교육과정</a></li>
        <li><a href="/university/student/grades.html">성적조회</a></li>
        <li><a href="/university/student/records.html">학적</a></li>
      </ul>
    </nav>
  </aside>

  <section>
  <h2 class="main-title">수강신청내역</h2>

  <div class="main-top">
    <div class="select-wrap">
      <select id="year" name="year">
        <option value="">선택</option>
        <option value="2025">2025</option>
        <option value="2024">2024</option>
        <option value="2023">2023</option>
      </select>
      <span>년</span>

      <select id="term" name="term">
        <option value="1">1</option>
        <option value="2">2</option>
      </select>
      <span>학기</span>
    </div>

    <div class="apply-info">
      신청과목 수 6과목, 총 신청학점 18학점
    </div>
  </div>

  <div class="main-wrapper">
      <table border="0" class="main-table">
        <tr>
          <th>교과목코드</th>
          <th>과목명</th>
          <th>대상학년</th>
          <th>담당교수</th>
          <th>학점</th>
          <th>이수구분</th>
          <th>강의시간</th>
          <th>강의장</th>
          <th>관리</th>
        </tr>

        <tr>
          <td>830003</td>
          <td>자바 프로그래밍</td>
          <td>2학년</td>
          <td>김자바</td>
          <td>3</td>
          <td>전공</td>
          <td>화 1,2,3</td>
          <td>컴퓨터실</td>
          <td>
            <a href="#">취소</a>
          </td>
        </tr>

        <tr>
          <td>830003</td>
          <td>자바 프로그래밍</td>
          <td>2학년</td>
          <td>김자바</td>
          <td>3</td>
          <td>전공</td>
          <td>화 1,2,3</td>
          <td>컴퓨터실</td>
          <td>
            <a href="#">취소</a>
          </td>
        </tr>

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
