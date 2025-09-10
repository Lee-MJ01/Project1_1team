<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- 입학안내 공지사항 -->
	
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/admission/notice.css">
<%@ include file = "/WEB-INF/views/_header.jsp" %>
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
          	<li class="active"><a href="${pageContext.request.contextPath}/admission/notice.do">공지사항</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/early.do">수시모집</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/regular.do">정시모집</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/transfer.do">편입학</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/counseling.do">입학상담</a></li>
          </ul>
        </aside>

        <!-- 본문 -->
        <section class="content">
          <h3>공지사항</h3>

          <!-- 검색 -->
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
          
  		<!--<c:if test="${role != 'admin'}">   -->     
          <div class="actions">
            <a href="#" class="btn primary">글쓰기</a>
          </div>
         </c:if>
        </section>
      </div>
    </main>

<%@ include file = "/WEB-INF/views/_footer.jsp" %>

