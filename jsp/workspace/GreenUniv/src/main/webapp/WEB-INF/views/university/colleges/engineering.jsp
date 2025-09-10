<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>그린대학교 | 공과대학</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;600;700&display=swap" rel="stylesheet">
  <!-- 공통 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/colleges/common.css">
  <!-- 전용 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/colleges/engineering.css">
</head>
<body>
  <div id="wrapper">
    <!-- 헤더 -->
    <header>
      <div class="topbar">
        <div class="container topbar__nav" role="navigation" aria-label="상단 빠른 메뉴">
          <ul class="topbar__list">
            <li class="topbar__item"><a href="#">HOME</a></li>
            <li class="topbar__item"><a href="#">사이트맵</a></li>
            <li class="topbar__item"><a href="#">로그인</a></li>
            <li class="topbar__item"><a href="#">학사지원</a></li>
          </ul>
        </div>
      </div>
      <nav class="gnb" role="navigation" aria-label="주 메뉴">
        <div class="container gnb__inner">
          <a href="/" aria-label="그린대학교 홈"><img class="brand__logo" src="/images/header_logo.png" alt="그린대학교"></a>
          <ul class="menu__list">
            <li><a class="menu__link" href="#">대학소개</a></li>
            <li><a class="menu__link" href="#">입학안내</a></li>
            <li><a class="menu__link" href="#">대학·대학원</a></li>
            <li><a class="menu__link" href="#">학사안내</a></li>
            <li><a class="menu__link" href="#">대학생활</a></li>
            <li><a class="menu__link" href="#">커뮤니티</a></li>
          </ul>
        </div>
      </nav>
    </header>

    <!-- breadcrumb -->
    <div class="background">
      <div class="container breadcrumb">
        <ul>
          <li><a href="/"><img src="/images/ico-home.png" height="15" alt="홈"></a></li>
          <li><img src="/images/bg-path-arrow.png" height="10" alt=">"></li>
          <li><a href="#">대학·대학원</a></li>
          <li><img src="/images/bg-path-arrow.png" height="10" alt=">"></li>
          <li class="active"><a href="#">공과대학</a></li>
        </ul>
      </div>
    </div>

    <!-- 메인 -->
    <main>
      <div class="container">
        <!-- 사이드 메뉴 -->
        <aside class="side-nav">
          <h2>대학·대학원</h2>
          <ul>
            <li><a href="humanities.html">인문사회대학</a></li>
            <li><a href="science.html">자연과학대학</a></li>
            <li class="active"><a href="engineering.html">공과대학</a></li>
            <li><a href="education.html">사범대학</a></li>
            <li><a href="graduate.html">대학원</a></li>
          </ul>
        </aside>

        <!-- 본문 -->
        <section class="content">
          <h3>공과대학</h3>

          <div class="college-intro">
            <img src="${pageContext.request.contextPath}/images/college-introduce-3.jpg" alt="공과대학" class="intro-img">
            <div class="intro-text">
              <p class="en-title">Engineering</p>
              <p class="ko-title">기본 공학교육 및 산업현장과 연계된 산학협동을 위한 학문을 교수·연구</p>
              <p class="desc">
                공과대학은 과학 및 공학기술을 선도할 창의적이고 실천적인 전문기술인을 양성하기 위해
                기본적인 공학교육과정, 연구, 창의성교육 등을 중점적으로 수행한다.
                또한 산업현장과 연계된 산학협동의 활성화를 실현하여 공학교육과 교수·연구능력을 교육목표로 둔다.
              </p>
            </div>
          </div>

          <h4 class="dept-title">학부 및 학과</h4>
          <table class="board">
            <thead>
              <tr>
                <th>학과/전공</th>
                <th>학과장</th>
                <th>학과 사무실 번호</th>
                <th>비고</th>
              </tr>
            </thead>
            <tbody>
              <tr><td>기계공학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김기계</td><td>051-123-3001</td><td></td></tr>
              <tr><td>전자공학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김전자</td><td>051-123-3002</td><td></td></tr>
              <tr><td>전기공학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김전기</td><td>051-123-3003</td><td></td></tr>
              <tr><td>컴퓨터공학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김컴공</td><td>051-123-3004</td><td></td></tr>
              <tr><td>건축공학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김건축</td><td>051-123-3005</td><td></td></tr>
              <tr><td>재료공학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김재료</td><td>051-123-3006</td><td></td></tr>
              <tr><td>화학공학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김화학</td><td>051-123-3007</td><td></td></tr>
            </tbody>
          </table>
        </section>
      </div>
    </main>

    <!-- 푸터 -->
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
          <img class="footer__logo" src="/images/footer_logo.png" alt="그린대학교 로고">
          <div>
            <ul class="footer__info">
              <li><strong>그린대학교</strong></li>
              <li>[12345] 부산광역시 부산진구 부전대로 123 / 대표전화 : 051-123-1000</li>
              <li>입학안내 : 051-123-1302 · 팩스 : 051-123-3333</li>
            </ul>
            <div class="footer__copy">copyright © Green University. All rights reserved.</div>
          </div>
          <div class="footer__select">
            <select id="sites" class="select" name="sites">
              <option value="">주요사이트</option>
              <option value="#">도서관</option>
              <option value="#">학사관리시스템</option>
            </select>
          </div>
        </div>
      </div>
    </footer>
  </div>
</body>
</html>
