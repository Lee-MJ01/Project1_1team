<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>resources</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/community/style_res.css">
    <!-- 
        날짜 : 2025/09/05
        이름 : 이민준
        내용 : 커뮤니티 - 자료실 제작 
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
                            <img src="/images/ico-home.png" height="15"></a></li>
                        <li><a href="#">
                            <img src="/images/bg-path-arrow.png" height="10"></a></li>
                        <li><a href="#">커뮤니티</a></li>
                        <li><a href="#">
                            <img src="/images/bg-path-arrow.png" height="10"></a></li>
                        <li class="active"><a href="#">자료실</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <main>
            <div class="container">
                <aside class="side-nav">
                    <h2>커뮤니티</h2>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li><a href="#">뉴스 및 칼럼</a></li>
                        <li><a href="#">취업정보</a></li>
                        <li><a href="#">자유게시판</a></li>
                        <li><a href="#">질문과 답변</a></li>
                        <li class="active"><a href="#">자료실</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>자료실</h3>

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
                                    <img src="${pageContext.request.contextPath}/images/ico-file01.png" alt="file" class="icon-file">
                                    교원자격증 재교부 및 기재사항 정정신청 안내(서식)
                                </td>
                                <td>학사관리과</td>
                                <td><time datetime="2024-04-09">24.04.09</time></td>
                                <td>120</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/images/ico-file01.png" alt="file" class="icon-file">
                                    2025 융합인재학부 오리엔테이션 자료
                                </td>
                                <td>융합인재학부</td>
                                <td><time datetime="2024-04-09">24.04.09</time></td>
                                <td>120</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/images/ico-file01.png" alt="file" class="icon-file">
                                    2022년 2월 8일 면접 전략 특강 강의 자료
                                </td>
                                <td>취업지원실</td>
                                <td><time datetime="2024-04-09">24.04.09</time></td>
                                <td>120</td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="pagination">
                        <a href="#" class="first"><img src="/images/btn-first-page.png" alt="처음"></a>
                        <a href="#" class="prev"><img src="/images/btn-prev-page.png" alt="이전"></a>
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#" class="next"><img src="/images/btn-next-page.png" alt="다음"></a>
                        <a href="#" class="last"><img src="/images/btn-last-page.png" alt="끝"></a>
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