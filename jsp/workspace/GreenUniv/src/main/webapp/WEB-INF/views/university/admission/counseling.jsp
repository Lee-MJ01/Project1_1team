<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>그린대학교 | 입학상담</title>
  <!-- 입학상담 전용 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/admission/counseling.css">
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
            <li class="active"><a href="#">입학상담</a></li>
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
            <li><a href="${pageContext.request.contextPath}/admission/transfer.do">편입학</a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/admission/counseling.do">입학상담</a></li>
          </ul>
        </aside>

        <!-- 본문 -->
        <section class="content">
          <h3>입학상담</h3>

          <div class="search-bar">
            <select>
              <option>전체</option>
              <option>제목</option>
              <option>작성자</option>
            </select>
            <div class="search-box">
              <input type="text" placeholder="검색어를 입력해 주세요">
              <button>검색</button>
            </div>
          </div>

          <table class="board">
            <thead>
              <tr>
                <th>번호</th>
                <th>구분</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>상태</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>3</td>
                <td>정시</td>
                <td>정시모집 관련해 문의드립니다.</td>
                <td>홍길동</td>
                <td>24.04.09</td>
                <td><span class="status done">답변완료</span></td>
              </tr>
              <tr>
                <td>2</td>
                <td>정시</td>
                <td>
                  <img src="${pageContext.request.contextPath}/images/ico-lock.png" alt="잠금" class="icon-lock">
                  정시모집 관련해 문의드립니다.
                </td>
                <td>홍길동</td>
                <td>24.04.09</td>
                <td><span class="status done">답변완료</span></td>
              </tr>
              <tr>
                <td>1</td>
                <td>정시</td>
                <td>
                  <img src="${pageContext.request.contextPath}/images/ico-lock.png" alt="잠금" class="icon-lock">
                  정시모집 관련해 문의드립니다.
                </td>
                <td>홍길동</td>
                <td>24.04.09</td>
                <td><span class="status done">답변완료</span></td>
              </tr>
            </tbody>
          </table>

          <div class="pagination">
            <a href="#" class="first"><img src="${pageContext.request.contextPath}/images/btn-first-page.png" alt="처음"></a>
            <a href="#" class="prev"><img src="${pageContext.request.contextPath}/images/btn-prev-page.png" alt="이전"></a>
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#" class="next"><img src="${pageContext.request.contextPath}/images/btn-next-page.png" alt="다음"></a>
            <a href="#" class="last"><img src="${pageContext.request.contextPath}/images/btn-last-page.png" alt="끝"></a>
          </div>

          <div class="actions">
            <button class="btn primary">문의하기</button>
          </div>
        </section>
      </div>
    </main>

<%-- 푸터 부분 포함 --%>
<%@ include file="/WEB-INF/views/_footer.jsp" %>
  </div>
</body>
</html>
