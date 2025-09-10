<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 성적조회  </title>
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
        <li><a href="/university/student/registration.html">수강신청</a></li>
        <li><a href="/university/student/registered.html" >수강신청내역</a></li>
        <li><a href="/university/student/curriculum.html">나의교육과정</a></li>
        <li><a href="/university/student/grades.html" aria-current="page">성적조회</a></li>
        <li><a href="/university/student/records.html">학적</a></li>
      </ul>
    </nav>
  </aside>

  <section>
  <h2 class="main-title">성적조회</h2>

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
      이수과목수 5과목, 총 신청학점 <span>15</span>학점
    </div>
  </div>

  <div class="main-wrapper">
      <table border="0" class="main-table">
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

        <tr>
          <td>830003</td>
          <td>자바 프로그래밍</td>
          <td>2학년</td>
          <td>김자바</td>
          <td>전공</td>
          <td>99.0</td>
          <td>A+</td>
          <td>3</td>
          <td>
            <a href="#">상세확인</a>
          </td>
        </tr>

        <tr>
          <td>830003</td>
          <td>자바 프로그래밍</td>
          <td>2학년</td>
          <td>김자바</td>
          <td>전공</td>
          <td>99.0</td>
          <td>A+</td>
          <td>3</td>
          <td>
            <a href="#">상세확인</a>
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
