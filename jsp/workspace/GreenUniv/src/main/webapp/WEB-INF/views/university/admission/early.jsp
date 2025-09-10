<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>그린대학교 | 입학안내 - 수시모집</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/admission/common.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/admission/early.css">
</head>
<body>
  <div id="wrapper">
    <!-- 헤더 -->
    <header>
      <div class="topbar">
        <div class="container topbar__nav">
          <ul class="topbar__list">
            <li class="topbar__item"><a href="#">HOME</a></li>
            <li class="topbar__item"><a href="#">사이트맵</a></li>
            <li class="topbar__item"><a href="#">로그인</a></li>
            <li class="topbar__item"><a href="#">학사지원</a></li>
          </ul>
        </div>
      </div>
      <nav class="gnb">
        <div class="container gnb__inner">
          <a href="/" aria-label="그린대학교 홈"><img class="brand__logo" src="/images/header_logo.png" alt="그린대학교"></a>
          <ul class="menu__list">
            <li><a class="menu__link" href="#">대학소개</a></li>
            <li><a class="menu__link active" href="#">입학안내</a></li>
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
      <div class="container">
        <div class="sub-nav">
          <ul>
            <li><a href="/"><img src="${pageContext.request.contextPath}/images/ico-home.png" height="15" alt="홈"></a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li><a href="#">입학안내</a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li class="active"><a href="#">수시모집</a></li>
          </ul>
        </div>
      </div>
    </div>

    <!-- 메인 -->
    <main>
      <div class="container">
        <!-- 좌측 네비 -->
        <aside class="side-nav">
          <h2>입학안내</h2>
          <ul>
            <li><a href="notice.html">공지사항</a></li>
            <li class="active"><a href="early.html">수시모집</a></li>
            <li><a href="regular.html">정시모집</a></li>
            <li><a href="transfer.html">편입학</a></li>
            <li><a href="counseling.html">입학상담</a></li>
          </ul>
        </aside>

        <!-- 본문 -->
        <section class="content">
          <h3>수시모집</h3>
          <p>
            여기에 수시모집 관련 내용을 입력하세요.<br>
            (예: 모집 요강 PDF 링크, 주요 일정, 지원 자격 안내 등)
          </p>
        </section>
      </div>
    </main>

    <!-- 푸터 -->
    <footer class="footer">
      <div class="footer__top">
        <div class="container footer__nav">
          <ul class="footer__list">
            <li class="footer__item"><a href="#">개인정보처리방침</a></li>
            <li class="footer__item"><a href="#">통합정보시스템</a></li>
            <li class="footer__item"><a href="#">학사일정</a></li>
            <li class="footer__item"><a href="#">주요인원 연락처</a></li>
            <li class="footer__item"><a href="#">교내공지사항</a></li>
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
            <select class="select" onchange="if(this.value) window.open(this.value)">
              <option value="">주요사이트</option>
              <option value="https://www.busanbank.co.kr/">BNK부산은행</option>
              <option value="/academic/index.html">학사관리시스템</option>
            </select>
          </div>
        </div>
      </div>
    </footer>
  </div>
</body>
</html>
