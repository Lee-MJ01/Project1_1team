<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // 필요 시 서버에서 전달한 기본값 사용 예시 (null-safe)
    String ctx = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학생 등록</title>
    <!-- 
        날짜 : 2025-09-01
        이름 : 박민규
        내용 : Personnel-students (register)
    -->
    <style>
        body{margin:0}

        .header{height:20%}
        .title{height:70%;display:flex}

        .header_top{height:20%;background-color:#00518C;text-align:right;padding-right:30px}
        .header_top a{color:#fff}
        .header_top span{color:#fff;margin:0 5px}
        .header_bottom{height:80%;background-color:#1F2838;padding-left:30px;display:flex;align-items:center}
        .header_bottom img{height:36px}

        .sideBar{width:15%;margin-left:50px;background-color:#eaeaea;padding:10px 12px}
        .sideBar img{width:20px;margin:10px 5px 0 0}
        .stylenone{list-style:none;margin:8px 0;font-weight:600}
        .styletwo{margin:0 0 12px 26px;padding:0}
        .styletwo li{list-style:none;margin:6px 0}
        .styletwo a{text-decoration:none;color:#000}

        .menu{width:75%;padding:10px 20px}
        .menu_top{display:flex;justify-content:space-between;align-items:center}
        .menu_top img{margin:0 2px 2px 5px}
        .stdlist{color:#145074}

        .section_all{display:flex;flex-direction:column;gap:24px}
        .section,.section2{background:#f9fbfd;border:1px solid #e3e7ee;border-radius:10px;padding:16px}
        .section h4,.section2 h4{margin:0 0 12px;display:flex;align-items:center;gap:8px}

        .form-grid{display:grid;grid-template-columns:140px 1fr 140px 1fr;gap:10px 16px;align-items:center}
        .form-grid .full{grid-column:1 / -1}
        .avatar{display:flex;align-items:center;gap:8px}
        .avatar img{height:28px}

        .actions{margin-top:18px;display:flex;gap:8px}
        .actions button{padding:10px 14px;border:0;border-radius:8px;cursor:pointer}
        .actions .primary{background:#00518C;color:#fff}
        .actions .ghost{background:#fff;border:1px solid #cfd6e4}

        footer{position:absolute;bottom:0;background-color:#1F2838;color:#fff;padding-left:30px;height:10%;display:flex;align-items:center;width:100%}
        input[type="text"],select{height:36px;padding:6px 10px;border:1px solid #cfd6e4;border-radius:8px}
        .inline{display:flex;gap:12px;align-items:center}
        .crumbs{display:flex;align-items:center;gap:6px}
        .crumbs img{height:12px}
        .muted{color:#6b7a90;font-size:12px}
    </style>
</head>
<body>
    <div class="header">
        <div class="header_top">
            <a href="<c:url value='/'/>">home</a><span>|</span>
            <a href="<c:url value='/sitemap'/>">사이트맵</a><span>|</span>
            <a href="<c:url value='/login'/>">로그인</a>
        </div>
        <div class="header_bottom">
            <img src="<c:url value='/images/admin_logo.png'/>" alt="그린대학교 관리자 로고">
        </div>
    </div>

    <div class="title">
        <div class="sideBar">
            <ul style="padding-left:0;margin:0">
                <li class="stylenone"><img src="<c:url value='/images/ico-admin-setting.png'/>" alt="">환경설정</li>
                <ul class="styletwo">
                    <li><a href="#">기본환경정보</a></li>
                    <li><a href="#">약관관리</a></li>
                </ul>

                <li class="stylenone"><img src="<c:url value='/images/ico-admin-academic.png'/>" alt="">학사운영</li>
                <ul class="styletwo">
                    <li><a href="#">교육 운영 현황</a></li>
                    <li><a href="#">학년별 학생현황</a></li>
                    <li><a href="#">강의 목록</a></li>
                    <li><a href="#">강의 등록</a></li>
                    <li><a href="#">수강 현황</a></li>
                </ul>

                <li class="stylenone"><img src="<c:url value='/images/ico-admin-persons.png'/>" alt="">인사관리</li>
                <ul class="styletwo">
                    <li><a href="#">학생 목록 및 등록</a></li>
                    <li><a href="#">교수 목록 및 등록</a></li>
                    <li><a href="#">임직원 목록 및 등록</a></li>
                </ul>

                <li class="stylenone"><img src="<c:url value='/images/ico-admin-college.png'/>" alt="">대학 및 학과</li>
                <ul class="styletwo">
                    <li><a href="#">교육 운영 현황</a></li>
                    <li><a href="#">교육 운영 현황</a></li>
                </ul>

                <li class="stylenone"><img src="<c:url value='/images/ico-admin-board.png'/>" alt="">게시판 관리</li>
                <ul class="styletwo">
                    <li><a href="#">입학안내 공지사항</a></li>
                    <li><a href="#">학사안내 공지사항</a></li>
                    <li><a href="#">커뮤니티 공지사항</a></li>
                    <li><a href="#">입학상담</a></li>
                    <li><a href="#">질문 및 답변</a></li>
                    <li><a href="#">식단안내</a></li>
                    <li><a href="#">교육 운영 현황</a></li>
                </ul>
            </ul>
        </div>

        <div class="menu">
            <div class="menu_top">
                <span>학생 등록</span>
                <div class="crumbs">
                    <span>인사관리</span>
                    <img src="<c:url value='/images/bg-link-arr-over.png'/>" alt="">
                    <span class="stdlist">학생 등록</span>
                </div>
            </div>
            <hr>

            <!-- 제출 경로는 프로젝트 규칙에 맞춰 조정하세요 -->
				<form method="post" action="<c:url value='/student/write.do'/>" accept-charset="UTF-8">
                <div class="section_all">
                    <!-- 기본 정보 입력 -->
                    <div class="section">
                        <h4>
                            <img src="<c:url value='/images/bullet-h4.png'/>" alt="">
                            기본 정보 입력
                        </h4>
                        <div class="form-grid">
                            <div class="avatar">
                                <img src="<c:url value='/images/icon-avatar.png'/>" alt="">
                                <span class="muted">프로필</span>
                            </div>
                            <div></div>
                            <label>학번</label>
                            <div class="muted">연도 + 학과 코드 + 순번 조합 자동 생성</div>

                            <label>주민등록번호</label>
                            <input type="text" name="rrn" placeholder="-포함 14자리 입력" maxlength="14">

                            <label>이름</label>
                            <input type="text" name="name" placeholder="학생 이름 입력">

                            <label>영문명</label>
                            <input type="text" name="engName" placeholder="여권 등과 동일한 영문 이름">

                            <label>성별</label>
                            <div class="inline">
                                <label><input type="radio" name="gender" value="M"> 남</label>
                                <label><input type="radio" name="gender" value="F"> 여</label>
                            </div>

                            <label>국적</label>
                            <select name="nation">
                                <option value="">선택</option>
                                <option>대한민국</option><option>일본</option><option>중국</option>
                                <option>싱가포르</option><option>미국</option><option>호주</option>
                            </select>

                            <label>주소</label>
                            <div class="full inline">
                                <input type="text" name="zip" placeholder="우편번호 선택" style="max-width:180px">
                                <input type="text" name="addr1" placeholder="기본주소 선택" style="flex:1">
                                <input type="text" name="addr2" placeholder="상세주소 입력" style="flex:1">
                            </div>
                        </div>
                    </div>

                    <!-- 학적 정보 입력 -->
                    <div class="section2">
                        <h4>
                            <img src="<c:url value='/images/bullet-h4.png'/>" alt="">
                            학적 정보 입력
                        </h4>
                        <div class="form-grid">
                            <label>입학년도</label>
                            <select name="enterYear">
                                <option value="">선택</option>
                                <c:forEach var="y" begin="2015" end="2025">
                                    <option><c:out value="${y}"/>년</option>
                                </c:forEach>
                            </select>

                            <label>졸업년도</label>
                            <select name="gradYear">
                                <option value="">선택</option>
                                <c:forEach var="y" begin="2019" end="2029">
                                    <option><c:out value="${y}"/>년</option>
                                </c:forEach>
                            </select>

                            <label>입학 구분</label>
                            <select name="enterType">
                                <option value="">선택</option>
                                <option>수시</option><option>정시</option><option>편입학</option>
                            </select>

                            <label>입학학과(전공)</label>
                            <div class="inline">
                                <select name="college">
                                    <option>인문사회대학</option>
                                    <option>자연과학대학</option>
                                    <option>공과대학</option>
                                </select>
                                <select name="department">
                                    <option>국문학과</option><option>영어영문학과</option>
                                    <option>생물학과</option><option>물리학과</option>
                                    <option>기계공학과</option><option>컴퓨터공학과</option>
                                </select>
                            </div>

                            <label>입학학년/학기</label>
                            <div class="inline">
                                <select name="grade">
                                    <option>1학년</option><option>2학년</option>
                                    <option>3학년</option><option>4학년</option>
                                    <option>5학년</option><option>6학년</option>
                                </select>
                                <select name="semester">
                                    <option>1학기</option><option>2학기</option>
                                </select>
                            </div>

                            <label>지도교수</label>
                            <select name="advisor">
                                <option value="">선택</option>
                                <option>김국어</option><option>김영어</option><option>김생물</option>
                                <option>김물리</option><option>김기계</option><option>김컴공</option>
                            </select>
                        </div>

                        <div class="actions">
                            <button type="submit" class="primary">등록</button>
                            <button type="reset" class="ghost">초기화</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <footer class="footer">
        <p>Copyright ©Green University All rights reserved. ADMINISTRATOR Version 1.4.1</p>
    </footer>
</body>
</html>
