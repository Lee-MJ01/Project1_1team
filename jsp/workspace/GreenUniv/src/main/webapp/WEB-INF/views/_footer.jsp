<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">


<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footer.css">

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