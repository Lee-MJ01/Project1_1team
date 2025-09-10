<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 학적  </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/student/style_rec.css">

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
        <li><a href="/university/student/grades.html">성적조회</a></li>
        <li><a href="/university/student/records.html"  aria-current="page">학적</a></li>
      </ul>
    </nav>
  </aside>

  <section>
    <h2 class="main-title">학적</h2>
    <div class="tablehead">
      <img src="/images/bullet-h4.png" >
      기본정보
    </div>
    <div class="subject-table info-table">
      <table>
        <tbody>
          <tr>
            <!-- 왼쪽 프로필 셀: 전체 4행 합침 -->
            <td class="avatar" rowspan="4">
              <img src="${pageContext.request.contextPath}/images/icon-avatar.png" alt="프로필 사진">
            </td>

            <th>학번</th>
            <td>202001230</td>
            <th>학과</th>
            <td>컴퓨터공학과</td>
          </tr>
          <tr>
            <th>이름</th>
            <td>홍길동</td>
            <th>주민번호</th>
            <td>900103-1234567</td>
          </tr>
          <tr>
            <th>휴대폰</th>
            <td>010-1234-1001</td>
            <th>EMAIL</th>
            <td>hong1001@naver.com</td>
          </tr>
          <tr>
            <th>학년/학기</th>
            <td>3학년 / 1학기</td>
            <th>상태</th>
            <td class="status-ok">재학중</td>
          </tr>
        </tbody>
      </table>
    </div>

    
    <div class="tablehead">
      <img src="${pageContext.request.contextPath}/images/bullet-h4.png" >
      취득학점현황
    </div>
    <div class="record-table">
        <table>
          <thead>
            <tr>
              <th>구분</th>
              <th>전공(7)</th>
              <th>교양(6)</th>
              <th>선택(1)</th>
              <th>사회봉사</th>
              <th>기타</th>
              <th>총취득학점</th>
              <th>졸업요건학점</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>취득학점</td>
              <td>21</td>
              <td>16</td>
              <td>3</td>
              <td>0</td>
              <td>0</td>
              <td>40</td>
              <td>130</td>
            </tr>

          </tbody>
        </table>
    </div>

    <div class="tablehead">
      <img src="${pageContext.request.contextPath}/images/bullet-h4.png" >
      년도/학기별 취득학점현황
    </div>
    <div class="record-table">
        <table>
          <thead>
            <tr>
              <th>년도</th>
              <th>학년</th>
              <th>학기</th>
              <th>신청학점</th>
              <th>전공학점</th>
              <th>선택학점</th>
              <th>기타학점</th>
              <th>총취득학점</th>
              <th>평점평균</th>
              <th>기타</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>2020</td>
              <td>1</td>
              <td>1</td>
              <td>18</td>
              <td>15</td>
              <td>3</td>
              <td>0</td>
              <td>18</td>
              <td>3.2</td>
              <td></td>
            </tr>
            <tr>
              <td>2020</td>
              <td>1</td>
              <td>1</td>
              <td>18</td>
              <td>15</td>
              <td>3</td>
              <td>0</td>
              <td>18</td>
              <td>3.2</td>
              <td></td>
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

</script>
</body>
</html>
