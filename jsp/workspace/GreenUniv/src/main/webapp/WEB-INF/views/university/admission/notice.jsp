<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<<<<<<< HEAD

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- 입학안내 공지사항 -->
	
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/admission/notice.css">
<%@ include file = "/WEB-INF/views/_header.jsp" %>
=======
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>그린대학교 | 입학안내 - 공지사항</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;600;700&display=swap" rel="stylesheet">
  <!-- 공통 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/admission/common.css">
  <!-- 공지사항 전용 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/admission/notice.css">
</head>
<body>
  <div id="wrapper">
    <!-- ===== 헤더 ===== -->
    <header>
      <div class="topbar">
        <div class="container topbar__nav" role="navigation" aria-label="상단 빠른 메뉴">
          <ul class="topbar__list">
            <li class="topbar__item"><a href="#">HOME</a></li>
            <li class="topbar__item"><a href="#">사이트맵</a></li>
            <li class="topbar__item"><a href="#">로그인</a></li>
            <li class="topbar__item"><a href="#">학사지원</a></li>
          </ul>
        </div>
      </div>
      <nav class="gnb" role="navigation" aria-label="주 메뉴">
        <div class="container gnb__inner">
          <a href="/" aria-label="그린대학교 홈"><img class="brand__logo" src="/images/header_logo.png" alt="그린대학교"></a>
          <ul class="menu__list">
            <li><a class="menu__link" href="#">대학소개</a></li>
            <li><a class="menu__link" href="#">입학안내</a></li>
            <li><a class="menu__link" href="#">대학·대학원</a></li>
            <li><a class="menu__link" href="#">학사안내</a></li>
            <li><a class="menu__link" href="#">대학생활</a></li>
            <li><a class="menu__link" href="#">커뮤니티</a></li>
          </ul>
        </div>
      </nav>
    </header>

>>>>>>> f6337c0d2124f43b093d4f56a2e5113224c4ec0f
    <!-- ===== breadcrumb ===== -->
    <div class="background">
      <div class="container">
        <div class="sub-nav">
          <ul>
            <li><a href="/"><img src="${pageContext.request.contextPath}/images/ico-home.png" height="15" alt="홈"></a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li><a href="#">입학안내</a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li class="active"><a href="#">공지사항</a></li>
          </ul>
        </div>
      </div>
    </div>

    <!-- ===== 메인 ===== -->
    <main>
      <div class="container">
        <!-- 좌측 사이드 메뉴 -->
        <aside class="side-nav">
          <h2>입학안내</h2>
          <ul>
<<<<<<< HEAD
          	<li class="active"><a href="${pageContext.request.contextPath}/admission/notice.do">공지사항</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/early.do">수시모집</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/regular.do">정시모집</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/transfer.do">편입학</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/counseling.do">입학상담</a></li>
=======
            <li class="active"><a href="#">공지사항</a></li>
            <li><a href="#">수시모집</a></li>
            <li><a href="#">정시모집</a></li>
            <li><a href="#">편입학</a></li>
            <li><a href="#">입학상담</a></li>
>>>>>>> f6337c0d2124f43b093d4f56a2e5113224c4ec0f
          </ul>
        </aside>

        <!-- 본문 -->
        <section class="content">
          <h3>공지사항</h3>

          <!-- 검색 -->
<<<<<<< HEAD
          <form action="">
	          <div class="search-bar">
	            <select>
	              <option>전체</option>
	              <option value="title">제목</option>
	              <option value="content">내용</option>
	              <option value="writer">작성자</option>
	            </select>
	            <div class="search-box">
	              <input type="text" name="keyword" placeholder="검색어를 입력해 주세요">
	              <input type="submit" value="검색">
	            </div>
	          </div>
          </form>
=======
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
>>>>>>> f6337c0d2124f43b093d4f56a2e5113224c4ec0f

          <!-- 게시판 -->
          <table class="board">
            <thead>
              <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회</th>
              </tr>
            </thead>
<<<<<<< HEAD
	            <tbody>
				  <c:if test="${empty dtoList}">
				    <tr>
				      <td colspan="5" style="text-align:center">등록된 게시글이 없습니다.</td>
				    </tr>
				  </c:if>
				
				  <c:forEach var="row" items="${dtoList}">
				    <tr>
				      <td>${row.number}</td>
				      <td class="title">
				        <a href="${pageContext.request.contextPath}/admission/noticeview.do?no=${row.number}">
				          <c:out value="${row.title}"/>
				        </a>
				      </td>
				      <td><c:out value="${row.writer}"/></td>
				      <td>${row.w_date}</td>
				      <td>${row.view_count}</td>
				    </tr>
				  </c:forEach>
				</tbody>
=======
            <tbody>
              <tr>
                <td>3</td>
                <td><img src="${pageContext.request.contextPath}/images/ico-new01.gif" alt="N"> 2025학년도 신입학 3차 추가모집 모집요강 및 모집인원 공지</td>
                <td>담당자</td>
                <td>24.04.09</td>
                <td>160</td>
              </tr>
              <tr>
                <td>2</td>
                <td><img src="${pageContext.request.contextPath}/images/ico-new01.gif" alt="N"> 2025학년도 신입학 2차 추가모집 모집요강 및 모집인원 공지</td>
                <td>담당자</td>
                <td>24.04.09</td>
                <td>160</td>
              </tr>
              <tr>
                <td>1</td>
                <td>2025학년도 신입학 추가모집 모집요강 및 모집인원 공지</td>
                <td>담당자</td>
                <td>24.04.09</td>
                <td>160</td>
              </tr>
            </tbody>
>>>>>>> f6337c0d2124f43b093d4f56a2e5113224c4ec0f
          </table>

          <!-- 페이지네이션 -->
          <div class="pagination">
            <a href="#"><img src="${pageContext.request.contextPath}/images/btn-first-page.png" alt="처음"></a>
            <a href="#"><img src="${pageContext.request.contextPath}/images/btn-prev-page.png" alt="이전"></a>
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#"><img src="${pageContext.request.contextPath}/images/btn-next-page.png" alt="다음"></a>
            <a href="#"><img src="${pageContext.request.contextPath}/images/btn-last-page.png" alt="끝"></a>
          </div>
<<<<<<< HEAD
          
  		<!--<c:if test="${role != 'admin'}">   -->     
          <div class="actions">
            <a href="#" class="btn primary">글쓰기</a>
          </div>
         </c:if>
=======
>>>>>>> f6337c0d2124f43b093d4f56a2e5113224c4ec0f
        </section>
      </div>
    </main>

<<<<<<< HEAD
<%@ include file = "/WEB-INF/views/_footer.jsp" %>

=======
    <!-- ===== 푸터 ===== -->
    <footer class="footer">
      <div class="footer__top">
        <div class="container footer__nav">
          <ul class="footer__list">
            <li class="footer__item"><a href="#">개인정보처리방침</a></li>
            <li class="footer__item"><a href="#">통합정보시스템</a></li>
            <li class="footer__item"><a href="#">학사일정</a></li>
            <li class="footer__item"><a href="#">주요민원 연락처</a></li>
            <li class="footer__item"><a href="#">교내공지사항</a></li>
          </ul>
        </div>
      </div>
      <div class="footer__body">
        <div class="container footer__inner">
          <img class="footer__logo" src="/images/footer_logo.png" alt="그린대학교 로고">
          <div>
            <ul class="footer__info">
              <li><strong>그린대학교</strong></li>
              <li>[12345] 부산광역시 부산진구 부전대로 123 / 대표전화 : 051-123-1000</li>
              <li>입학안내 : 051-123-1302 · 팩스 : 051-123-3333</li>
            </ul>
            <div class="footer__copy">copyright © Green University. All rights reserved.</div>
          </div>
          <div class="footer__select">
            <label for="sites" class="sr-only">주요사이트</label>
            <select id="sites" class="select">
              <option>주요사이트</option>
              <option>도서관</option>
              <option>포털</option>
            </select>
          </div>
        </div>
      </div>
    </footer>
  </div>
</body>
</html>
>>>>>>> f6337c0d2124f43b093d4f56a2e5113224c4ec0f
