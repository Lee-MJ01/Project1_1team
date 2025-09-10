<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 수강신청  </title>
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
        <li><a href="/university/student/registration.html" aria-current="page">수강신청</a></li>
        <li><a href="/university/student/registered.html" >수강신청내역</a></li>
        <li><a href="/university/student/curriculum.html">나의교육과정</a></li>
        <li><a href="/university/student/grades.html">성적조회</a></li>
        <li><a href="/university/student/records.html">학적</a></li>
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

          <tr>
            <td>컴퓨터공학</td>
            <td>전공</td>
            <td>1</td>
            <td>830001</td>
            <td>컴퓨터과학개론</td>
            <td>3</td>
            <td>김컴공</td>
            <td>12/30</td>
            <td></td>
            <td>
              <a href="#">신청</a>
            </td>
          </tr>

          <tr>
            <td>컴퓨터공학</td>
            <td>전공</td>
            <td>1</td>
            <td>830001</td>
            <td>컴퓨터과학개론</td>
            <td>3</td>
            <td>김컴공</td>
            <td>12/30</td>
            <td></td>
          <td>
            <a href="#">신청</a>
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
