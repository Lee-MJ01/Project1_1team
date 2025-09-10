<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cafeteria</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/campuslife/style_cafe.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/campuslife/css/xeicon.min.css">
    <!-- 
        날짜 : 2025/09/04
        이름 : 천수빈
        내용 : 대학생활 - 식단안내 제작
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
                            <img src="${pageContext.request.contextPath}/images/header_logo.png" width="196" alt="그린대학교 로고">
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
                        <li class="active"><a href="#">식단안내</a></li>
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
                        <li class="active"><a href="#">식단안내</a></li>
                        <li><a href="#">갤러리</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>식단안내</h3>

                    <div class="cafeteria-header">
                        <button class="prev"><i class="xi-angle-left-thin"></i></button>
                        <span class="month">2025.03.10~2025.03.14</span>
                        <button class="next"><i class="xi-angle-right-thin"></i></button>
                    </div>

                    <table class="cafeteria">
                        <thead>
                            <tr>
                                <th>구분</th>
                                <th>2025.3.10(월)</th>
                                <th>2025.3.11(화)</th>
                                <th>2025.3.12(수)</th >
                                <th>2025.3.13(목)</th>
                                <th>2025.3.14(금)</th>
                                <th>2025.3.15(토)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="strong"><strong>조식</strong></td>
                                <td>미운영</td>
                                <td>미운영</td>
                                <td>미운영</td>
                                <td>미운영</td>
                                <td>미운영</td>
                                <td>미운영</td>
                            </tr>
                            <tr>
                                <td class="strong"><strong>중식</strong></td>
                                <td>
                                    <span class="sticker">정식 5,500원</span><br>
                                    백미밥<br>
                                    바지락미역국<br>
                                    닭안심매콤조림<br>
                                    야끼우동<br>
                                    두부강정<br>
                                    상추겉절이<br>
                                    포기김치
                                </td>
                                <td>
                                    <span class="sticker">정식 5,500원</span><br>
                                    흑미밥<br>
                                    만두국<br>
                                    돈육고추장불고기<br>
                                    버섯잡채<br>
                                    미트볼데리야끼조림<br>
                                    오이무침<br>
                                    포기김치
                                </td>
                                <td>
                                    <span class="sticker">정식 5,500원</span><br>
                                    백미밥<br>
                                    삼겹살김치찌개<br>
                                    꿔바로우/소스<br>
                                    로제떡볶이<br>
                                    비엔나햄볶음<br>
                                    오징어다시마채무침<br>
                                    깍두기
                                </td>
                                <td>
                                    <span class="sticker">정식 5,500원</span><br>
                                    백미밥<br>
                                    꼬치어묵우동<br>
                                    닭데리야끼조림<br>
                                    카레<br>
                                    군만두/초간장<br>
                                    파프리카콩나물냉채<br>
                                    배추김치
                                </td>
                                <td>
                                    <span class="sticker">정식 5,500원</span><br>
                                    현미밥<br>
                                    설렁탕<br>
                                    생선가스/소스<br>
                                    잡채어묵조림<br>
                                    두부조림<br>
                                    부추오이무침<br>
                                    포기김치
                                </td>
                                <td>미운영</td>
                            </tr>
                            <tr>
                                <td class="strong"><strong>석식</strong></td>
                                <td>미운영</td>
                                <td>미운영</td>
                                <td>미운영</td>
                                <td>미운영</td>
                                <td>미운영</td>
                                <td>미운영</td>
                            </tr>
                        </tbody>
                    </table>

                    <p class="cafeteria-note">※ 항상 그린식당을 이용해 주셔서 감사합니다.</p>
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
                        <img src="${pageContext.request.contextPath}/images/footer_logo.png" alt="그린대학교 로고" class="footer-logo">
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