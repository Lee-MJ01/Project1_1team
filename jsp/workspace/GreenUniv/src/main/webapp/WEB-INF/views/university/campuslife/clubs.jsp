<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>clubs</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/campuslife/style_club.css">
    <!-- 
        날짜 : 2025/09/04
        이름 : 천수빈
        내용 : 대학생활 - 동아리/스터디 제작
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
                        <li><a href="#">학생회 소개</a></li>
                        <li class="active"><a href="#">동아리/스터디</a></li>
                        <li><a href="#">식단안내</a></li>
                        <li><a href="#">갤러리</a></li>
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