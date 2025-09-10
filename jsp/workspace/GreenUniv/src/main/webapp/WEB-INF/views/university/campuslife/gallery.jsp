<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>gallery</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/campuslife/style_gal.css">
    <!-- 
        날짜 : 2025/09/04
        이름 : 천수빈
        내용 : 대학생활 - 갤러리 제작
    -->
</head>
<body>
    <div id="wrapper">
        <header>
            <div class="header-top">
                <div class="container">
                    <ul>
                        <li><a href="#">HOME</a></li>
                        <li><a href="#">사이트맵</a></li>
                        <li><a href="#">로그인</a></li>
                        <li><a href="#">학생지원</a></li>
                    </ul>
                </div>
            </div>  

            <div class="header-main">
                <div class="container">
                    <div class="logo">
                        <a href="#">
                            <img src="/images/header_logo.png" width="196" alt="그린대학교 로고">
                        </a>
                    </div>
                    <nav class="main-nav">
                        <ul>
                            <li><a href="#">대학소개</a></li>
                            <li><a href="#">입학안내</a></li>
                            <li><a href="#">대학·대학원</a></li>
                            <li><a href="#">학사안내</a></li>
                            <li><a href="#">대학생활</a></li>
                            <li><a href="#">커뮤니티</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </header>

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
                        <li><a href="#">학생회 소개</a></li>
                        <li><a href="#">동아리/스터디</a></li>
                        <li><a href="#">식단안내</a></li>
                        <li class="active"><a href="#">갤러리</a></li>
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
        
        <footer>
            <div class="footer-top">
                <div class="container">
                    <ul>
                        <li><a href="#">개인정보처리방침</a></li>
                        <li><a href="#">통합정보시스템</a></li>
                        <li><a href="#">학사일정</a></li>
                        <li><a href="#">주요민원 연락처</a></li>
                        <li><a href="#">교내공지사항</a></li>
                    </ul>
                </div>
            </div>

            <div class="footer-bottom">
                <div class="container">
                    <div class="footer-left">
                        <img src="/images/footer_logo.png" alt="그린대학교 로고" class="footer-logo">
                        <div class="footer-text">
                            <p>그린대학교</p>
                            <p>[12345] 부산광역시 부산진구 부전대로 123 그린대학교 / 대표전화 : 051-123-1000 /</p>
                            <p>입학안내 : 051-123-1302 팩스 : 051-123-3333</p>
                            <p class="copy">copyright ⓒ Green University All rights reserved.</p>
                        </div>
                    </div>
                    <div class="footer-right">
                        <select>
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