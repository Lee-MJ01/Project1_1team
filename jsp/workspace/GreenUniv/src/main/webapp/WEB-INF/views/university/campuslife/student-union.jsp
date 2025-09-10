<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>student-union</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/campuslife/style_stu.css">
    <!-- 
        날짜 : 2025/09/04
        이름 : 천수빈
        내용 : 대학생활 - 학생회 소개 제작
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
                        <li class="active"><a href="#">학생회 소개</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <main>
            <div class="container">
                <aside class="side-nav">
                    <h2>대학생활</h2>
                    <ul>
                        <li class="active"><a href="#">학생회 소개</a></li>
                        <li><a href="#">동아리/스터디</a></li>
                        <li><a href="#">식단안내</a></li>
                        <li><a href="#">갤러리</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>학생회 소개</h3>

                    <div class="union-main">
                        <img src="${pageContext.request.contextPath}/images/grub_img.png" alt="그린대학교 총학생회 이미지" width="900" height="400">

                        <div class="union-box">
                            <h3>제2대<br>그린대학교 총학생회 GRUB</h3>
                            <p><strong>연락처</strong> : 010-1234-5678<br>(총학생회장 이민준)</p>
                            <p><strong>이메일</strong> : grub@gru.ac.kr</p>
                            <p><strong>위치</strong> : 1동 학생회관 234호</p>
                        </div>
                    </div>

                    <div class="union-info">
                        <img src="${pageContext.request.contextPath}/images/header_logo.png" alt="GRUB 백그라운드" class="logo-bg">
                        <p class="info-strong">“Groove into the Future, Together with GRUB!”</p><br>
                        <p class="info-text">
                            안녕하세요. 그린대학교 부산캠퍼스 총학생회 GRUB(Green University Busan) 입니다.<br>
                            GRUB는 Green University Busan의 약어이며, ‘그루브(Groove)’처럼 학생들과 발맞추어 소통하며 함께 성장하는 리듬을 상징합니다.<br> 
                            저희는 이곳이 모든 학우분들이 한 걸음 더 성장할 수 있도록 지혜를 배우고, 의견을 나누며, 함께 도전하는 장을 만들어가고자 합니다.<br>
                            <br>
                            저희 총학생회는 학우 여러분의 권익 보호를 최우선으로 삼으며, 학사제도 개선, 복지 확대, 문화 프로그램 지원 등<br>
                            실질적이고 구체적인 변화를 이끌어내는 활동을 이어가고 있습니다.<br>
                            또한 다양한 학내외 단체와의 협력을 통해 더 많은 기회와 혜택을 제공하고, 그린대학교 학생사회의 위상을 높이는 데 힘쓰고 있습니다.<br>
                            <br>
                            앞으로도 GRUB는 여러분께 지혜를 배움에 있어 아낌없는 투자와 캠퍼스가 단순한 공간을 넘어 사회와 소통하고 성장하며,<br>
                            미래 준비의 터전이 될 수 있도록 노력하겠습니다.<br>
                            또한 여러분들의 작은 목소리 하나하나를 귀 기울여 듣고, 그것을 학교와 지역 사회에 전달하여 더 큰 울림으로 만들어내겠습니다.<br>
                            <br>
                            GRUB는 학우분들의 든든한 동반자이자 방패이며, 함께 맟서 싸울 수 있는 창이 되어 언제나 함께 걸어가겠습니다.<br>
                            감사합니다.
                        </p>
                        <p class="info-last">그린대학교 총학생회 일동</p>
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