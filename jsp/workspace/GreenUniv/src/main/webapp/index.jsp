<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>그린대학교</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/mainStyle.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">
</head>

<body>
    <header>
    <div class="topbar">
      <div class="container topbar__nav" role="navigation" aria-label="상단 빠른 메뉴">
        <ul class="topbar__list">
          <li class="topbar__item"><a href="#">HOME</a></li>
          <li class="topbar__item"><a href="#">사이트맵</a></li>
          <li class="topbar__item"><a href="./member/login.do">로그인</a></li>
          <li class="topbar__item"><a href="#">학사지원</a></li>
        </ul>
      </div>
    </div>
    <nav class="gnb" role="navigation" aria-label="주 메뉴">
        <div class="container gnb__inner">
            <a href="/" aria-label="그린대학교 홈"><img class="brand__logo" src="${pageContext.request.contextPath}/images/header_logo.png" alt="그린대학교"></a>
            <ul class="menu__list">
                <li><a class="menu__link" href="#">대학소개</a></li>
                <li><a class="menu__link" href="#">입학안내</a></li>
                <li><a class="menu__link" href="#">대학·대학원</a></li>
                <li><a class="menu__link" href="#">학사안내</a></li>
                <li><a class="menu__link" href="#">대학생활</a></li>
                <li><a class="menu__link" href="#">커뮤니티</a></li>
            </ul>
        </div>
        <div class="submenu">
            <div class="container">
                <ul class="submenuList">
                    <ul class="submenuDetail">
                        <li class="submenu-title">대학소개</li>
                        <li><a href="">총장 인사말</a></li>
                        <li><a href="">교육이념</a></li>
                        <li><a href="">연혁</a></li>
                        <li><a href="">조직도</a></li>
                        <li><a href="">오시는길</a></li>
                    </ul>
                    <ul class="submenuDetail">
                        <li class="submenu-title">입학안내</li>
                        <li><a href="">공지사항</a></li>
                        <li><a href="">수시모집</a></li>
                        <li><a href="">정시모집</a></li>
                        <li><a href="">편입학</a></li>
                        <li><a href="">입학상담</a></li>
                    </ul>
                    <ul class="submenuDetail">
                        <li class="submenu-title">대학·대학원</li>
                        <li><a href="">인문사회대학</a></li>
                        <li><a href="">자연과학대학</a></li>
                        <li><a href="">공과대학</a></li>
                        <li><a href="">사범대학</a></li>
                        <li><a href="">대학원</a></li>
                    </ul>
                    <ul class="submenuDetail">
                        <li class="submenu-title">학사안내</li>
                        <li><a href="">공지사항</a></li>
                        <li><a href="">학사일정</a></li>
                        <li><a href="">수강신청</a></li>
                        <li><a href="">성적</a></li>
                        <li><a href="">수료 및 졸업</a></li>
                        <li><a href="">자주묻는질문</a></li>
                    </ul>
                    <ul class="submenuDetail">
                        <li class="submenu-title">대학생활</li>
                        <li><a href="">학생회소개</a></li>
                        <li><a href="">동아리/스터디</a></li>
                        <li><a href="">식단안내</a></li>
                        <li><a href="">갤러리</a></li>
                    </ul>
                    <ul class="submenuDetail">
                        <li class="submenu-title">커뮤니티</li>
                        <li><a href="">공지사항</a></li>
                        <li><a href="">뉴스 및 칼럼</a></li>
                        <li><a href="">취업정보</a></li>
                        <li><a href="">자유게시판</a></li>
                        <li><a href="">질문과 답변</a></li>
                        <li><a href="">자료실</a></li>
                    </ul>
                </ul>
            </div>
        </div>
    </nav>
  </header>
    
    <div class="body">
        <div id="main-bg"></div>
        <div id="body1200">
            <div id="main-on">
                <h3>IT 기술로 세상을 변화시키는 인재를 양성</h3>
                <h1>그린대학교 컴퓨터과학과</h1>
                <p>급변하는 컴퓨터 기술의 발전에 선도적으로 참여하고 컴퓨터의 활용을 통하여 미래를 만들어 나갈 수 있는 인력을 배양</p>
                
                <div id="main-pagemove">
                    <img src="${pageContext.request.contextPath}/images/btn-prev01.png" alt="전페이지" id="prev-page">
                    <img src="${pageContext.request.contextPath}/images/btn-next01.png" alt="다음페이지" id="next-page">
                </div>
                <div id="main-departmentIntro">
                    <span><a href="/university/about/president.html">학과소개 바로가기</a></span>
                    <span><img src="${pageContext.request.contextPath}/images/bg-link-arr.png" alt=""></span>
                </div>
                <div id="slide">
                    <span id="page1"></span>
                    <span id="page2"></span>
                    <span id="page3"></span>
                </div>
            </div>
            <div id="main-mid">
                <div id="box-left">
                    <div>
                        <h3>학사안내</h3>
                        <a href="/university/academics/notice.html">
                            <img src="${pageContext.request.contextPath}/images/bg-viewmore01.png" alt="">
                        </a>
                        <hr>
                        <ul>
                            <li>
                                <span>교과목 폐지 및 신설 안내</span>
                                <span><img src="${pageContext.request.contextPath}/images/ico-new01.gif" alt=""></span>
                                <span class="box-left-date">2025.09.01</span>
                            </li>
                            <li>
                                <span>2019-2학기 진로취업 프로그램 설계를 위한 학생 대상...</span>
                                <span><img src="${pageContext.request.contextPath}/images/ico-new01.gif" alt=""></span>
                                <span class="box-left-date">2025.09.01</span>
                            </li>
                            <li>
                                <span>제8회 KNDA 학술논문상 공모</span>
                                <span class="box-left-date">2025.09.01</span>
                            </li>
                            <li>
                                <span>대학 진로취업지원 현황 조사 안내</span>
                                <span class="box-left-date">2025.09.01</span>
                            </li>
                            <li>
                                <span>[진로취업특강] 유망직무 전문가 초청 특강, 여대생 커...</span>
                                <span class="box-left-date">2025.09.01</span>
                            </li>
                        </ul>
                    </div>
                </div>
                <div id="box-right">
                    <div>
                        <h3>공지사항</h3>
                        <a href="/university/academics/notice.html">
                            <img src="${pageContext.request.contextPath}/images/bg-viewmore02.png" alt="">
                        </a>
                        <hr>
                        <ul>
                            <li>
                                <span>교과목 폐지 및 신설 안내</span>
                                <span><img src="${pageContext.request.contextPath}/images/ico-new02.gif" alt=""></span>
                                <span class="box-left-date">2025.09.01</span>
                            </li>
                            <li>
                                <span>2019-2학기 진로취업 프로그램 설계를 위한 학생 대상...</span>
                                <span><img src="${pageContext.request.contextPath}/images/ico-new02.gif" alt=""></span>
                                <span class="box-left-date">2025.09.01</span>
                            </li>
                            <li>
                                <span>제8회 KNDA 학술논문상 공모</span>
                                <span class="box-left-date">2025.09.01</span>
                            </li>
                            <li>
                                <span>대학 진로취업지원 현황 조사 안내</span>
                                <span class="box-left-date">2025.09.01</span>
                            </li>
                            <li>
                                <span>[진로취업특강] 유망직무 전문가 초청 특강, 여대생 커...</span>
                                <span class="box-left-date">2025.09.01</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="gallary">
                <h3>PHOTO GALLARY</h3>
            </div>
            <div id="gallary-photo">
                <ul>
                    <li>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/images/gallary_sample1.jpg" alt="">
                            <div class="overlay">글로벌 명문대학 그린대</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/images/gallary_sample2.jpg" alt="">
                            <div class="overlay">글로벌 명문대학 그린대</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/images/gallary_sample3.jpg" alt="">
                            <div class="overlay">글로벌 명문대학 그린대</div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="${pageContext.request.contextPath}/images/gallary_sample4.png" alt="">
                            <div class="overlay">글로벌 명문대학 그린대</div>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="helper">
            <div>
                <div id="helper-h3">
                <h3>동아리 HELPER</h3>
            </div>
            <div id="helper-p">
                <p>공무원 시험 준비반을 운용함으로써 정치행정학과에서 공무원 시험을 준비하는 학생들에게
인터넷 강의, 교재를 제공하고 스터디 그룹의 활동을 도와주고 있습니다.</p>
            </div>
            <a href="#">
                <div id="helper-div">자세히 보기</div>
            </a>
            </div>
        </div>
        <div class="main-under">
            <div class="main-under-leftbox">
                <div>
                    <div class="main-under-news">
                        <div class="news-header">
                            <h3>뉴스 및 칼럼</h3>
                            <img src="${pageContext.request.contextPath}/images/bg-viewmore01.png" alt="더보기">
                        </div>
                        <hr>
                    </div>
                    <div class="news-page">
                        <ul>
                            <li>
                                <span>교과목 폐지 및 신설 안내</span>
                                <span><img src="${pageContext.request.contextPath}/images/ico-new01.gif" alt=""></span>
                                <span class="news-date">2025.09.03</span>
                            </li>
                            <li>
                                <sapn>2019-2학기 진로취업 프로그램 설계를 위한 학생 대상...</sapn>
                                <span><img src="${pageContext.request.contextPath}/images/ico-new01.gif" alt=""></span>
                                <span class="news-date">2025.09.03</span>
                            </li>
                            <li>
                                <sapn>제8회 KNDA 학술논문상 공모</sapn>
                                <span class="news-date">2025.09.03</span>
                            </li>
                            <li>
                                <sapn>대학 진로취업지원 현황 조사 안내</sapn>
                                <span class="news-date">2025.09.03</span>
                            </li>
                            <li>
                                <sapn>[진로취업특강] 유망직무 전문가 초청 특강, 여대생 커...</sapn>
                                <span class="news-date">2025.09.03</span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="main-under-rightbox">
                <div id="rightBox">
                    <div class="main-under-news">
                        <h3 id="smartLink">SMART LINK</h3>
                        <hr>
                    </div>
                    <div class="news-page">
                        <ul class="smart-links">
                            <li>
                                <a href="#">
                                    <div class="icon-bg">
                                        <img src="${pageContext.request.contextPath}/images/bg-main-link01.png" alt="입학안내">
                                    </div>
                                    <span class="link-text">입학안내</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="icon-bg">
                                        <img src="${pageContext.request.contextPath}/images/bg-main-link02.png" alt="학사일정">
                                    </div>
                                    <span class="link-text">학사일정</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="icon-bg">
                                        <img src="${pageContext.request.contextPath}/images/bg-main-link03.png" alt="학생회">
                                    </div>
                                    <span class="link-text">학생회</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="icon-bg">
                                        <img src="${pageContext.request.contextPath}/images/bg-main-link04.png" alt="교과과정">
                                    </div>
                                    <span class="link-text">교과과정</span>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="icon-bg">
                                        <img src="${pageContext.request.contextPath}/images/bg-main-link05.png" alt="취업안내">
                                    </div>
                                    <span class="link-text">취업안내</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    <footer class="footer">
        <div class="footer__top">
            <div class="container footer__nav">
                <ul class="footer__list">
                    <li class="footer__item"><a class="footer__link" href="#">개인정보처리방침</a></li>
                    <li class="footer__item"><a class="footer__link" href="#">통합정보시스템</a></li>
                    <li class="footer__item"><a class="footer__link" href="#">학사일정</a></li>
                    <li class="footer__item"><a class="footer__link" href="#">주요인원 연락처</a></li>
                    <li class="footer__item"><a class="footer__link" href="#">교내공지사항</a></li>
                </ul>
            </div>
        </div>

        <div class="footer__body">
            <div class="container footer__inner">
                <img class="footer__logo" src="${pageContext.request.contextPath}/images/footer_logo.png" alt="그린대학교 로고">
                <div>
                    <ul class="footer__info">
                        <li><strong>그린대학교</strong></li>
                        <li>[12345] 부산광역시 부산진구 부전대로 123 그린대학교 / 대표전화 : 051-123-1000</li>
                        <li>입학안내 : 051-123-1302 · 팩스 : 051-123-3333</li>
                    </ul>
                    <div class="footer__copy">copyright © Green University. All rights reserved.</div>
                </div>
                <div class="footer__select">
                    <label for="sites" class="sr-only" style="position:absolute;left:-9999px">주요사이트</label>
                    <select id="sites" class="select" name="sites">
                        <option value="">주요사이트</option>
                        <option value="https://www.busanbank.co.kr/ib20/mnu/BHP00001">BNK부산은행</option>
                        <option value="/academic/index.html">학사관리시스템</option>
                    </select>
                </div>
            </div>
        </div>
  </footer>
  <script>
        const gnb = document.querySelector('.gnb');
        const submenu = document.querySelector('.submenu');

        // GNB 영역에 마우스가 들어오면 서브메뉴를 보여줌
        gnb.addEventListener('mouseenter', () => {
            submenu.classList.add('is-active');
        });

        // GNB 영역에서 마우스가 나가면 서브메뉴를 숨김
        gnb.addEventListener('mouseleave', () => {
            submenu.classList.remove('is-active');
        });
    </script>
</body>
</html>