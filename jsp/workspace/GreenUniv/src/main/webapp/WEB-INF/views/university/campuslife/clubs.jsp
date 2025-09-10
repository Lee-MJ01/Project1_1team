<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>clubs</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/campuslife/style_club.css">
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
                        <li><a href="#">대학생활</a></li>
                        <li><a href="#">
                            <img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10"></a></li>
                        <li class="active"><a href="#">동아리/스터디</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <main>
            <div class="container">
                <aside class="side-nav">
                    <h2>대학생활</h2>
                    <ul>
                    	<li><a href="${pageContext.request.contextPath}/campuslife/student-union.do">학생회소개</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath}/campuslife/clubs.do"">동아리/스터디</a></li>
                        <li><a href="${pageContext.request.contextPath}/campuslife/cafeteria.do">식단안내</a></li>
                        <li><a href="${pageContext.request.contextPath}/campuslife/gallery.do">갤러리</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>동아리/스터디</h3>

                    <div class="main-content">
                        <h4 class="main-title">동아리</h4>

                        <div class="club-list">
                            <div class="club-card">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/images/clubs_img1.png" alt="동아리1">
                                    <p class="club-genre">코딩 동아리</p>
                                    <p class="club-name">너어무 쉬운 코딩</p>
                                </a>
                            </div>

                            <div class="club-card">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/images/clubs_img2.png" alt="동아리2">
                                    <p class="club-genre">독서 동아리</p>
                                    <p class="club-name">책않일그면이러케되</p>
                                </a>
                            </div>

                            <div class="club-card">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/images/clubs_img3.png" alt="동아리3">
                                    <p class="club-genre">맛집탐방 동아리</p>
                                    <p class="club-name">오늘도뚠뚠</p>
                                </a>
                            </div>

                            <div class="club-card">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/images/clubs_img4.png" alt="동아리4">
                                    <p class="club-genre">등산 동아리</p>
                                    <p class="club-name">산책하자며</p>
                                </a>
                            </div>

                            <div class="club-card">
                                <a href="#">
                                    <img src="${pageContext.request.contextPath}/images/clubs_img5.png" alt="동아리5">
                                    <p class="club-genre">여행 동아리</p>
                                    <p class="club-name">이야날씨쥑인다</p>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="main-content">
                        <h4 class="main-title">스터디</h4>
                        <table class="study-board">
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>날짜</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>6</td>
                                    <td><a href="#">[캥거루] 캐나다 어학연수 스터디</a></td>
                                    <td>서현우</td>
                                    <td>2025-09-04</td>
                                </tr>

                                <tr>
                                    <td>5</td>
                                    <td><a href="#">[9/10월] '하루에 한페이지씩' 모든 공부인 모여라</a></td>
                                    <td>설유진</td>
                                    <td>2025-09-01</td>
                                </tr>

                                <tr>
                                    <td>4</td>
                                    <td><a href="#">해운대 영어 스터디 모집 안내</a></td>
                                    <td>박민규</td>
                                    <td>2025-08-31</td>
                                </tr>

                                <tr>
                                    <td>3</td>
                                    <td><a href="#">[런닝피플] 지식 공부 말고, 건강 공부</a></td>
                                    <td>김대현</td>
                                    <td>2025-08-25</td>
                                </tr>

                                <tr>
                                    <td>2</td>
                                    <td><a href="#">나를 알아야 적을 안다. 자소서 스터디 모임</a></td>
                                    <td>이민준</td>
                                    <td>2025-08-24</td>
                                </tr>

                                <tr>
                                    <td>1</td>
                                    <td><a href="#">[1트전사] 정보처리기사 스터디 하실 분!</a></td>
                                    <td>천수빈</td>
                                    <td>2025-08-20</td>
                                </tr>
                            </tbody>
                        </table>

                        <p class="table-note">※ 동아리/스터디 게시판은 학생회원 이상 글쓰기 가능합니다.</p>

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