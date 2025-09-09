<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "./WEB-INF/views/_header.jsp" %>
    <div class="body">
        <div id="main-bg"></div>
        <div id="body1200">
            <div id="main-on">
                <h3>IT 기술로 세상을 변화시키는 인재를 양성</h3>
                <h1>그린대학교 컴퓨터과학과</h1>
                <p>급변하는 컴퓨터 기술의 발전에 선도적으로 참여하고 컴퓨터의 활용을 통하여 미래를 만들어 나갈 수 있는 인력을 배양</p>
                
                <div id="main-pagemove">
                	<button type="button">
                    	<img src="${pageContext.request.contextPath}/images/btn-prev01.png" alt="전페이지" id="prev-page">
                    </button>
                    <button type="button">
                    	<img src="${pageContext.request.contextPath}/images/btn-next01.png" alt="다음페이지" id="next-page">
                    </button>
                </div>
                <div id="main-departmentIntro">
                    <span><a href="${pageContext.request.contextPath}/colleges/humanities.do">학과소개 바로가기</a></span>
                    <span><img src="${pageContext.request.contextPath}/images/bg-link-arr.png" alt=""></span>
                </div>
                <div id="slide">
                    <span id="page1"></span>
                    <span id="page2"></span>
                    <span id="page3"></span>
                </div>
            </div>
            <div id="main-mid">
                <div id="box-left">
                    <div>
                        <h3>학사안내</h3>
                        <a href="${pageContext.request.contextPath}/academics/notice.do">
                            <img src="${pageContext.request.contextPath}/images/bg-viewmore01.png" alt="">
                        </a>
                        <hr>
                        <ul>
						    <jsp:useBean id="now" class="java.util.Date" />
						    <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
						
						    <c:forEach var="notice" items="${dtoAcademicsList}" varStatus="loop">
						        <a href="${pageContext.request.contextPath}/academics/notice.do">
						            <li>
						                <span>${notice.title}</span>
						                <span>
						                    <c:if test="${fn:startsWith(notice.w_date, today)}">
						                        <img src="${pageContext.request.contextPath}/images/ico-new01.gif" alt="new">
						                    </c:if>
						                </span>
						                
						                <span class="box-left-date">${fn:substring(notice.w_date, 0, 10)}</span>
						            </li>
						        </a>
						    </c:forEach>
						</ul>
                    </div>
                </div>
                <div id="box-right">
                    <div>
                        <h3>공지사항</h3>
                        <a href="${pageContext.request.contextPath}/academics/notice.do"">
                            <img src="${pageContext.request.contextPath}/images/bg-viewmore02.png" alt="">
                        </a>
                        <hr>
                        <ul>
                        	<c:forEach var="notice" items="${dtoCommunityList}" varStatus="loop">
						        <a href="${pageContext.request.contextPath}/academics/notice.do">
						            <li>
						                <span>${notice.title}</span>
						                <span>
						                    <c:if test="${fn:startsWith(notice.w_date, today)}">
						                        <img src="${pageContext.request.contextPath}/images/ico-new02.gif" alt="new">
						                    </c:if>
						                </span>
						                
						                <span class="box-left-date">${fn:substring(notice.w_date, 0, 10)}</span>
						            </li>
						        </a>
						    </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="gallary">
                <h3>PHOTO GALLARY</h3>
            </div>
            <div id="gallary-photo">
                <ul>
                    <li>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/images/gallary_sample1.jpg" alt="">
                            <div class="overlay">글로벌 명문대학 그린대</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/images/gallary_sample2.jpg" alt="">
                            <div class="overlay">글로벌 명문대학 그린대</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/images/gallary_sample3.jpg" alt="">
                            <div class="overlay">글로벌 명문대학 그린대</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/images/gallary_sample4.png" alt="">
                            <div class="overlay">글로벌 명문대학 그린대</div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="helper">
            <div>
                <div id="helper-h3">
                <h3>동아리 HELPER</h3>
            </div>
            <div id="helper-p">
                <p>공무원 시험 준비반을 운용함으로써 정치행정학과에서 공무원 시험을 준비하는 학생들에게
인터넷 강의, 교재를 제공하고 스터디 그룹의 활동을 도와주고 있습니다.</p>
            </div>
            <a href="${pageContext.request.contextPath}/campuslife/clubs.do">
                <div id="helper-div">자세히 보기</div>
            </a>
            </div>
        </div>
        <div class="main-under">
            <div class="main-under-leftbox">
                <div>
                    <div class="main-under-news">
                        <div class="news-header">
                            <h3>뉴스 및 칼럼</h3>
                            <img src="${pageContext.request.contextPath}/images/bg-viewmore01.png" alt="더보기">
                        </div>
                        <hr>
                    </div>
                    <div class="news-page">
                        <ul>
                        	<c:forEach var="notice" items="${dtoCommuNewsList}" varStatus="loop">
						        <a href="${pageContext.request.contextPath}/academics/notice.do">
						            <li>
						                <span>${notice.title}</span>
						                <span>
						                    <c:if test="${fn:startsWith(notice.w_date, today)}">
						                        <img src="${pageContext.request.contextPath}/images/ico-new01.gif" alt="new">
						                    </c:if>
						                </span>
						                
						                <span class="box-left-date">${fn:substring(notice.w_date, 0, 10)}</span>
						            </li>
						        </a>
						    </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="main-under-rightbox">
                <div id="rightBox">
                    <div class="main-under-news">
                        <h3 id="smartLink">SMART LINK</h3>
                        <hr>
                    </div>
                    <div class="news-page">
                        <ul class="smart-links">
                            <li>
                                <a href="${pageContext.request.contextPath}/admission/notice.do">
                                    <div class="icon-bg">
                                        <img src="${pageContext.request.contextPath}/images/bg-main-link01.png" alt="입학안내">
                                    </div>
                                    <span class="link-text">입학안내</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/academics/calendar.do">
                                    <div class="icon-bg">
                                        <img src="${pageContext.request.contextPath}/images/bg-main-link02.png" alt="학사일정">
                                    </div>
                                    <span class="link-text">학사일정</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/campuslife/student-union.do">
                                    <div class="icon-bg">
                                        <img src="${pageContext.request.contextPath}/images/bg-main-link03.png" alt="학생회">
                                    </div>
                                    <span class="link-text">학생회</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/student/curriculum.do">
                                    <div class="icon-bg">
                                        <img src="${pageContext.request.contextPath}/images/bg-main-link04.png" alt="교과과정">
                                    </div>
                                    <span class="link-text">교과과정</span>
                                </a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/community/jobs.do">
                                    <div class="icon-bg">
                                        <img src="${pageContext.request.contextPath}/images/bg-main-link05.png" alt="취업안내">
                                    </div>
                                    <span class="link-text">취업안내</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@ include file = "./WEB-INF/views/_footer.jsp" %>
