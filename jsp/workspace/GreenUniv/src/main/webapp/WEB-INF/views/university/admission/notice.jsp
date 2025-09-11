<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>그린대학교 | 공지사항</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/admission/notice.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/admission/common.css">
    <%-- 헤더, 푸터 등에 필요한 공통 CSS가 있다면 여기에 추가 --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<body>
<%@ include file="/WEB-INF/views/_header.jsp" %>
    <div class="background">
      <div class="container">
        <div class="sub-nav">
          <ul>
            <li><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/images/ico-home.png" height="15" alt="홈"></a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li><a href="#">입학안내</a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/university/admission/notice.do">공지사항</a></li>
          </ul>
        </div>
      </div>
    </div>

    <main>
      <div class="container">
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

        <section class="content">
          <h3>공지사항</h3>

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

          	<div class="pagination">
			    <%-- 이전 페이지 버튼 (페이지 그룹의 시작이 1보다 클 때) --%>
			    <c:if test="${pageGroupStart > 1}">
			        <a href="?pg=${pageGroupStart - 1}"><img src="${pageContext.request.contextPath}/images/btn-prev-page.png" alt="이전"></a>
			    </c:if>
			
			    <%-- 페이지 번호 링크 --%>
			    <c:forEach var="pageNum" begin="${pageGroupStart}" end="${pageGroupEnd}">
			        <a href="?pg=${pageNum}" class="${pageNum == currentPage ? 'active' : ''}">${pageNum}</a>
			    </c:forEach>
			
			    <%-- 다음 페이지 버튼 (페이지 그룹의 끝이 마지막 페이지보다 작을 때) --%>
			    <c:if test="${pageGroupEnd < lastPageNum}">
			        <a href="?pg=${pageGroupEnd + 1}"><img src="${pageContext.request.contextPath}/images/btn-next-page.png" alt="다음"></a>
			    </c:if>
			</div>
          
			<c:url var="writeUrl" value="/board/write.do">
			  <c:param name="parent_cd" value="0002"/>  <!-- 입학안내 -->
			  <c:param name="comm_cd"   value="2001"/>  <!-- 공지사항 -->
			</c:url>
			
			<a href="${writeUrl}" class="btn btnWrite">글쓰기</a>

        </section>
      </div>
    </main>

<%@ include file = "/WEB-INF/views/_footer.jsp" %>
</body>
</html>