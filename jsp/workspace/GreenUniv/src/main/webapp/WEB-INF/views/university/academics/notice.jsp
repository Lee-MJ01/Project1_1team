<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/academics/style_not.css">
<%@ include file = "/WEB-INF/views/_header.jsp" %>

        <div class=background>
            <div class="container">
                <div class="sub-nav">
                    <ul>
                        <li><a href="#">
                            <img src="${pageContext.request.contextPath}/images/ico-home.png" height="15"></a></li>
                        <li><a href="#">
                            <img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10"></a></li>
                        <li><a href="#">학사안내</a></li>
                        <li><a href="#">
                            <img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10"></a></li>
                        <li class="active"><a href="#">공지사항</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <main>
            <div class="container">
                <aside class="side-nav">
                    <h2>학사안내</h2>
                    <ul>
                    	<li class="active"><a href="${pageContext.request.contextPath}/academics/notice.do">공지사항</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/calendar.do">학사일정</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/registration.do">수강신청</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/grades.do">성적</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/graduation.do">수료 및 졸업</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/faq.do">자주묻는질문</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>공지사항</h3>

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
							        <a href="${pageContext.request.contextPath}/academics/noticeview.do?no=${row.number}">
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
        
<%@ include file = "/WEB-INF/views/_footer.jsp" %>
        