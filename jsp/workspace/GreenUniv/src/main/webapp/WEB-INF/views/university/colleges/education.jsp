<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>그린대학교 | 사범대학</title>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;600;700&display=swap" rel="stylesheet">
  <!-- 공통 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/colleges/common.css">
  <!-- 전용 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/colleges/education.css">
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
          <li class="active"><a href="#">사범대학</a></li>
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
            <li><a href="engineering.html">공과대학</a></li>
            <li class="active"><a href="education.html">사범대학</a></li>
            <li><a href="graduate.html">대학원</a></li>
          </ul>
        </aside>

        <!-- 본문 -->
        <section class="content">
          <h3>사범대학</h3>

          <div class="college-intro">
            <img src="${pageContext.request.contextPath}/images/college-introduce-4.jpg" alt="사범대학" class="intro-img">
            <div class="intro-text">
              <p class="en-title">Education</p>
              <p class="ko-title">미래를 움직이는 큰 인재, 세계의 주역!</p>
              <p class="desc">
                본교 사범대학은 현대 교육에 대한 학문적 주제와 지역 및 글로벌 인재 양성에 중점을 두고 있습니다.
                강의실, 실험실, 실습동, 원격교육지원센터, 멀티미디어 강의실, 어학연습실,
                슈먼연습 분석실 등 첨단 시설을 갖춘 교육지원센터를 운영하고 있습니다.
                부속기관으로는 종합교육연구소, 과학교육연구소, 특수교육연구소 등이 있습니다.
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
              <tr><td>국어교육과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김국어</td><td>051-123-4001</td><td></td></tr>
              <tr><td>영어교육과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김영어</td><td>051-123-4002</td><td></td></tr>
              <tr><td>수학교육과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김수학</td><td>051-123-4003</td><td></td></tr>
              <tr><td>음악교육과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김음악</td><td>051-123-4004</td><td></td></tr>
              <tr><td>교육학과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김교육</td><td>051-123-4005</td><td></td></tr>
              <tr><td>사회교육과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김사회</td><td>051-123-4006</td><td></td></tr>
              <tr><td>유아교육과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김유아</td><td>051-123-4007</td><td></td></tr>
              <tr><td>체육교육과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김체육</td><td>051-123-4008</td><td></td></tr>
              <tr><td>특수교육과 <img src="${pageContext.request.contextPath}/images/ico_link.png" alt="링크"></td><td>김특수</td><td>051-123-4009</td><td></td></tr>
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
