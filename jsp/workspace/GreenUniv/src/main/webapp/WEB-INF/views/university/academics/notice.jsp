<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>notice</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/academics/style_not.css">
    <!-- 
        날짜 : 2025/09/01
        이름 : 천수빈
        내용 : 학사안내 - 공지사항 제작 
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
                        <li class="active"><a href="#">공지사항</a></li>
                        <li><a href="#">학사일정</a></li>
                        <li><a href="#">수강신청</a></li>
                        <li><a href="#">성적</a></li>
                        <li><a href="#">수료 및 졸업</a></li>
                        <li><a href="#">자주묻는질문</a></li>
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
                            <tr>
                                <td>3</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/images/ico-new01.gif" alt="N" class="icon-n">
                                    2025학년도 신입학 3차 추가모집 모집요강 및 모집인원 공지
                                </td>
                                <td>담당자</td>
                                <td>24.04.09</td>
                                <td>160</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/images/ico-new01.gif" alt="N" class="icon-n">
                                    2025학년도 신입학 2차 추가모집 모집요강 및 모집인원 공지
                                </td>
                                <td>담당자</td>
                                <td>24.04.09</td>
                                <td>160</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>
                                    2025학년도 신입학 추가모집 모집요강 및 모집인원 공지
                                </td>
                                <td>담당자</td>
                                <td>24.04.09</td>
                                <td>160</td>
                            </tr>
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