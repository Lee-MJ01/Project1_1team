<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>graduation</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/academics/style_gda.css">
    <!-- 
        날짜 : 2025/09/03
        이름 : 천수빈
        내용 : 학사안내 - 수료 및 졸업 제작 
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
                        <li class="active"><a href="#">수료 및 졸업</a></li>
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
                        <li><a href="#">학사일정</a></li>
                        <li><a href="#">수강신청</a></li>
                        <li><a href="#">성적</a></li>
                        <li class="active"><a href="#">수료 및 졸업</a></li>
                        <li><a href="#">자주묻는질문</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>수료 및 졸업</h3>

                    <div class="main-content">
                        <h4 class="main-title">수료기준</h4>
                        <table class="table-comp">
                            <colgroup>
                                <col style="width: 30%;">
                                <col style="width: 10%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th rowspan="2">구분</th>
                                    <th rowspan="2">
                                        <span class="th-text">총 취득학점</span>
                                    </th>
                                    <th colspan="4">수료학점</th>
                                </tr>
                                <tr>
                                    <th>1학년</th>
                                    <th>2학년</th>
                                    <th>3학년</th>
                                    <th>4학년</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>인문대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>66</td>
                                    <td>99</td>
                                    <td>130</td>
                                </tr>
                                <tr>
                                    <td>사회과학대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>66</td>
                                    <td>99</td>
                                    <td>130</td>
                                </tr>
                                <tr>
                                    <td>경영대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>66</td>
                                    <td>99</td>
                                    <td>130</td>
                                </tr>
                                <tr>
                                    <td>자연과학대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>66</td>
                                    <td>99</td>
                                    <td>130</td>
                                </tr>
                                <tr>
                                    <td>정보과학대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>66</td>
                                    <td>99</td>
                                    <td>130</td>
                                </tr>
                            </tbody>
                        </table>
                        <p class="table-note">- 수료기준:졸업학점에 따라 학년별 수료학점이 다르며, 각 학년별 수료학점을 취득한 경우 해당 학년에 대한 '수료증명서'를 발급 가능</p>
                    </div>

                    <div class="main-content">
                        <h4 class="main-title">조기졸업</h4>
                        <table class="table-earl">
                            <colgroup>
                                <col style="width: 30%;">
                                <col style="width: 20%;">
                                <col style="width: 20%;">
                                <col style="width: 30%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th colspan="3">자격</th>
                                    <th rowspan="2">신청절차</th>
                                </tr>
                                <tr>
                                    <th>이수학기</th>
                                    <th>평점평균</th>
                                    <th>취득학점</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>6학기 또는 7학기 이수자로서 해당학기 이수로 모든 졸업요건의 충족이 가능한 자.</td>
                                    <td>4.00 이상</td>
                                    <td>정규졸업 요구학점과 동일</td>
                                    <td>졸업을 원하는 학기초 30일 이내에 "조기 졸업신청서"를 교무팀에 제출</td>
                                </tr>
                            </tbody>
                        </table>
                        <p class="table-note">※ 편입생 제외</p>
                    </div>

                    <div class="main-content">
                        <h4 class="main-title">졸업</h4>
                        <table class="table-grad">
                            <colgroup>
                                <col style="width: 30%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 25%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th rowspan="2">소속 단과대학</th>
                                    <th rowspan="2">총 취득학점</th>
                                    <th colspan="3">전공 이수 학점</th>
                                </tr>
                                <tr>
                                    <th><span class="th-text">복수전공(제1전공 기준동일)</span></th>
                                    <th>단일전공</th>
                                    <th>부전공</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>인문대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>60</td>
                                    <td>제1전공42/부전공21</td>
                                </tr>
                                <tr>
                                    <td>사회과학대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>60</td>
                                    <td>제1전공42/부전공21</td>
                                </tr>
                                <tr>
                                    <td>경영대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>60</td>
                                    <td>제1전공42/부전공21</td>
                                </tr>
                                <tr>
                                    <td>자연과학대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>70</td>
                                    <td>제1전공50/부전공25</td>
                                </tr>
                                <tr>
                                    <td>정보과학대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>60</td>
                                    <td>제1전공42/부전공21</td>
                                </tr>
                            </tbody>
                        </table>
                        <p class="table-note">- 등록학기:8학기 이상, 의과대학 의학과는 12학기 이상</p>
                        <p class="table-note">- 총 성적평점평균:2.00이상</p>
                        <p class="table-note">- 졸업논문(또는 졸업종합시험):합격</p>
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