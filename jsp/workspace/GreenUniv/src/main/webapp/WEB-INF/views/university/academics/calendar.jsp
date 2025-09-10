<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>calendar</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/academics/style_cal.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/academics/xeicon.min.css">
    <!-- 
        날짜 : 2025/09/02
        이름 : 천수빈
        내용 : 학사안내 - 학사일정 제작 
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
                        <li><a href="#">학사안내</a></li>
                        <li><a href="#">
                            <img src="/images/bg-path-arrow.png" height="10"></a></li>
                        <li class="active"><a href="#">학사일정</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <main>
            <div class="container">
                <aside class="side-nav">
                    <h2>학사안내</h2>
                    <ul>
                        <li><a href="#">공지사항</a></li>
                        <li class="active"><a href="#">학사일정</a></li>
                        <li><a href="#">수강신청</a></li>
                        <li><a href="#">성적</a></li>
                        <li><a href="#">수료 및 졸업</a></li>
                        <li><a href="#">자주묻는질문</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>학사일정</h3>

                    <div class="calendar-header">
                        <button class="prev"><i class="xi-angle-left-thin"></i></button>
                        <span class="month">2025.03</span>
                        <button class="next"><i class="xi-angle-right-thin"></i></button>
                    </div>

                    <table class="calendar">
                        <thead>
                            <tr>
                                <th>Sun</th>
                                <th>Mon</th>
                                <th>Tue</th>
                                <th>Wed</th>
                                <th>Thu</th>
                                <th>Fri</th>
                                <th>Sat</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="prev-month">23</td>
                                <td class="prev-month">24</td>
                                <td class="prev-month">25</td>
                                <td class="prev-month">26</td>
                                <td class="prev-month">27</td>
                                <td class="prev-month">28</td>
                                <td class="prev-month">1</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>3</td>
                                <td class="today"><span>4</span></td>
                                <td class="event">5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                                <td>12</td>
                                <td>13</td>
                                <td>14</td>
                                <td>15</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td>17</td>
                                <td>18</td>
                                <td>19</td>
                                <td>20</td>
                                <td>21</td>
                                <td>22</td>
                            </tr>
                            <tr>
                                <td>23</td>
                                <td>24</td>
                                <td>25</td>
                                <td>26</td>
                                <td>27</td>
                                <td>28</td>
                                <td>29</td>
                            </tr>
                            <tr>
                                <td>30</td>
                                <td>31</td>
                                <td class="next-month">1</td>
                                <td class="next-month">2</td>
                                <td class="next-month">3</td>
                                <td class="next-month">4</td>
                                <td class="next-month">5</td>
                            </tr>
                        </tbody>
                    </table>

                    <p class="calendar-note">※ 자세한 일정 내용은 공지사항을 참고하시기 바랍니다.</p>
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