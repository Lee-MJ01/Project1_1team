<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">
<header>
    <div class="topbar">
      <div class="container topbar__nav" role="navigation" aria-label="상단 빠른 메뉴">
        <ul class="topbar__list">
          <li class="topbar__item"><a href="${pageContext.request.contextPath}">HOME</a></li>
          <li class="topbar__item"><a href="${pageContext.request.contextPath}">사이트맵</a></li>
          <li class="topbar__item"><a href="${pageContext.request.contextPath}/member/login.do">로그인</a></li>
          <li class="topbar__item"><a href="${pageContext.request.contextPath}/student/curriculum.do">학사지원</a></li>
        </ul>
      </div>
    </div>
    <nav class="gnb" role="navigation" aria-label="주 메뉴">
        <div class="container gnb__inner">
            <a href="${pageContext.request.contextPath}" aria-label="그린대학교 홈"><img class="brand__logo" src="${pageContext.request.contextPath}/images/header_logo.png" alt="그린대학교"></a>
            <ul class="menu__list">
                <li><a class="menu__link" href="${pageContext.request.contextPath}/about/president.do">대학소개</a></li>
                <li><a class="menu__link" href="${pageContext.request.contextPath}/admission/notice.do">입학안내</a></li>
                <li><a class="menu__link" href="${pageContext.request.contextPath}/colleges/humanities.do">대학·대학원</a></li>
                <li><a class="menu__link" href="${pageContext.request.contextPath}/academics/notice.do">학사안내</a></li>
                <li><a class="menu__link" href="${pageContext.request.contextPath}/campuslife/student-union.do">대학생활</a></li>
                <li><a class="menu__link" href="${pageContext.request.contextPath}/community/notice.do">커뮤니티</a></li>
            </ul>
        </div>
        <div class="submenu">
            <div class="container">
                <ul class="submenuList">
                    <ul class="submenuDetail">
                        <li class="submenu-title">대학소개</li>
                        <li><a href="${pageContext.request.contextPath}/about/president.do">총장 인사말</a></li>
                        <li><a href="${pageContext.request.contextPath}/about/philosophy.do">교육이념</a></li>
                        <li><a href="${pageContext.request.contextPath}/about/history.do">연혁</a></li>
                        <li><a href="${pageContext.request.contextPath}/about/organization.do">조직도</a></li>
                        <li><a href="${pageContext.request.contextPath}/about/directions.do">오시는길</a></li>
                    </ul>
                    <ul class="submenuDetail">
                        <li class="submenu-title">입학안내</li>
                        <li><a href="${pageContext.request.contextPath}/admission/notice.do">공지사항</a></li>
                        <li><a href="${pageContext.request.contextPath}/admission/early.do">수시모집</a></li>
                        <li><a href="${pageContext.request.contextPath}/admission/regular.do">정시모집</a></li>
                        <li><a href="${pageContext.request.contextPath}/admission/transfer.do">편입학</a></li>
                        <li><a href="${pageContext.request.contextPath}/admission/counseling.do">입학상담</a></li>
                    </ul>
                    <ul class="submenuDetail">
                        <li class="submenu-title">대학·대학원</li>
                        <li><a href="${pageContext.request.contextPath}/colleges/humanities.do">인문사회대학</a></li>
                        <li><a href="${pageContext.request.contextPath}/colleges/science.do">자연과학대학</a></li>
                        <li><a href="${pageContext.request.contextPath}/colleges/engineering.do">공과대학</a></li>
                        <li><a href="${pageContext.request.contextPath}/colleges/education.do">사범대학</a></li>
                        <li><a href="${pageContext.request.contextPath}/colleges/graduate.do">대학원</a></li>
                    </ul>
                    <ul class="submenuDetail">
                        <li class="submenu-title">학사안내</li>
                        <li><a href="${pageContext.request.contextPath}/academics/notice.do">공지사항</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/calendar.do">학사일정</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/registration.do">수강신청</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/grades.do">성적</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/graduation.do">수료 및 졸업</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/faq.do">자주묻는질문</a></li>
                    </ul>
                    <ul class="submenuDetail">
                        <li class="submenu-title">대학생활</li>
                        <li><a href="${pageContext.request.contextPath}/campuslife/student-union.do">학생회소개</a></li>
                        <li><a href="${pageContext.request.contextPath}/campuslife/clubs.do"">동아리/스터디</a></li>
                        <li><a href="${pageContext.request.contextPath}/campuslife/cafeteria.do">식단안내</a></li>
                        <li><a href="${pageContext.request.contextPath}/campuslife/gallery.do">갤러리</a></li>
                    </ul>
                    <ul class="submenuDetail">
                        <li class="submenu-title">커뮤니티</li>
                        <li><a href="${pageContext.request.contextPath}/community/notice.do">공지사항</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/news.do">뉴스 및 칼럼</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/jobs.do">취업정보</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/board.do">자유게시판</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/qna.do">질문과 답변</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/resources.do">자료실</a></li>
                    </ul>
                </ul>
            </div>
        </div>
    </nav>
</header>