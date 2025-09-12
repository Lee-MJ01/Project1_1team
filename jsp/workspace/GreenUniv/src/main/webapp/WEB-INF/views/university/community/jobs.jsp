<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>jobs</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/community/style_job.css">
</head>

<body>
    <div id="wrapper">
       <%-- 헤더 부분 포함 --%>
<%@ include file="/WEB-INF/views/_header.jsp" %>

        <div class=background>
            <div class="container">
                <div class="sub-nav">
                    <ul>
                        <li><a href="#">
                            <img src="${pageContext.request.contextPath}/images/ico-home.png" height="15"></a></li>
                        <li><a href="#">
                            <img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10"></a></li>
                        <li><a href="#">커뮤니티</a></li>
                        <li><a href="#">
                            <img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10"></a></li>
                        <li class="active"><a href="#">취업정보</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <main>
            <div class="container">
                <aside class="side-nav">
                    <h2>커뮤니티</h2>
                    <ul>
                    	<li><a href="${pageContext.request.contextPath}/community/notice.do">공지사항</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/news.do">뉴스 및 칼럼</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath}/community/jobs.do">취업정보</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/board.do">자유게시판</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/qna.do">질문과 답변</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/resources.do">자료실</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>취업정보</h3>

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
                        <colgroup>
                            <col style="width: 8%;">
                            <col style="width: 10%;">
                            <col style="width: 15%;">
                            <col style="width: 42%;">
                            <col style="width: 15%">
                            <col style="width: 10%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>상태</th>
                                <th>업체</th>
                                <th>채용정보</th>
                                <th>마감일</th>
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
					        <td class="num">${row.number}</td>
					        <td>
					          <c:set var="badgeClass" value="${
					              row.stat_2 == '모집중' ? 'badge--open' :
					              (row.stat_2 == '보류' ? 'badge--hold' : 'badge--close')
					          }"/>
					          <span class="badge ${badgeClass}">${row.stat_2}</span>
					        </td>
					        <td class="company">${row.company}</td>
					        <td class="title">
					          <a href="${pageContext.request.contextPath}/jobs/noticeview.do?no=${row.number}">
					            <c:out value="${row.title}" />
					          </a>
					        </td>
					        <td>${row.deadline}</td>
					        <td>${row.view_count}</td>
					      </tr>
					    </c:forEach>
					  </tbody>
                    </table>
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
                </section>
            </div>
        </main>
        <%-- 푸터 부분 포함 --%>
		<%@ include file="/WEB-INF/views/_footer.jsp" %>
    </div>
</body>
</html>