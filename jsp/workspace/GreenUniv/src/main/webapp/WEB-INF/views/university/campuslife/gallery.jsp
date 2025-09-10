<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>gallery</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/campuslife/style_gal.css">
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
                        <li class="active"><a href="#">갤러리</a></li>
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
                        <li><a href="${pageContext.request.contextPath}/campuslife/clubs.do"">동아리/스터디</a></li>
                        <li><a href="${pageContext.request.contextPath}/campuslife/cafeteria.do">식단안내</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath}/campuslife/gallery.do">갤러리</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>갤러리</h3>

                    <div class="gallery-list">
                        <div class="gallery-card">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/images/gallary_sample1.jpg" alt="갤러리1">
                                <h4 class="gallery-title">제40회 1995학년도 학위수여식</h4>
                                <div class="gallery-meta">
                                    <span>조회수 23</span> | 
                                    <span>글로벌···</span> | 
                                    <span>25.02.20</span>
                                </div>
                            </a>
                        </div>

                        <div class="gallery-card">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/images/gallary_sample2.jpg" alt="갤러리2">
                                <h4 class="gallery-title">제40회 1995학년도 학위수여식</h4>
                                <div class="gallery-meta">
                                    <span>조회수 23</span> | 
                                    <span>글로벌···</span> | 
                                    <span>25.02.20</span>
                                </div>
                            </a>
                        </div>

                        <div class="gallery-card">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/images/gallary_sample3.jpg" alt="갤러리3">
                                <h4 class="gallery-title">제40회 1995학년도 학위수여식</h4>
                                <div class="gallery-meta">
                                    <span>조회수 23</span> | 
                                    <span>글로벌···</span> | 
                                    <span>25.02.20</span>
                                </div>
                            </a>
                        </div>

                        <div class="gallery-card">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/images/gallary_sample4.png" alt="갤러리4">
                                <h4 class="gallery-title">제40회 1995학년도 학위수여식</h4>
                                <div class="gallery-meta">
                                    <span>조회수 23</span> | 
                                    <span>글로벌···</span> | 
                                    <span>25.02.20</span>
                                </div>
                            </a>
                        </div>

                        <div class="gallery-card">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/images/gallary_sample5.jpg" alt="갤러리5">
                                <h4 class="gallery-title">제40회 1995학년도 학위수여식</h4>
                                <div class="gallery-meta">
                                    <span>조회수 23</span> | 
                                    <span>글로벌···</span> | 
                                    <span>25.02.20</span>
                                </div>
                            </a>
                        </div>
                    </div>

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