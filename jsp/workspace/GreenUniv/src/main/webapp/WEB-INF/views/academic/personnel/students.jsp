<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Personnel-students</title>
    <style>
    .topbar{height:15%;}
    .top{background-color:#00518C;height:20%;text-align:right;padding-right:50px;}
    .top a{color:#fff;}
    .top span{color:#fff;margin:0 10px;}
    .bottom{background-color:#1F2838;height:80%;display:flex;align-items:center;}
    .sideBar{background-color:#eaeaea;width:20%;margin-left:30px;}
    a{text-decoration-line:none;color:black;}
    .sideBar img{width:20px;margin:0 5px 0 0;}
    .stylenone{list-style:none;}
    .sideBar li{padding-left:10px;}
    ul{margin-bottom:5px;list-style:none;}
    body{margin:0;height:100%;}
    .styletwo li{margin:0 0 5px 0;}
    .h20p{height:20%;margin-bottom:20px;}
    .h80p{height:80%;}
    .h100p{height:95%;width:100%;}
    .title{margin-top:10px;font-weight:700;display:flex;justify-content:space-between;}
    table{border-collapse:collapse;width:100%;}
    thead th{background:#fafafa;border-top:1px solid #a3a3a3;border-bottom:1px solid #a3a3a3;padding:10px;}
    table td{border-bottom:1px solid #D8D8D8;padding:10px;text-align:center;}
    main{width:80%;height:100%;padding:35px;}
    .search-bar{text-align:right;}
    select,input,button{box-sizing:border-box;margin:0;padding:0;}
    select,input,.search-bar button{height:35px;font-size:14px;padding:0 8px;border:1px solid #ccc;vertical-align:middle;}
    select{width:150px;}
    input{width:200px;}
    .search-bar button{width:60px;background:#eee;cursor:pointer;}
    .menu{display:flex;justify-content:center;}
    .active{color:green;}
    .out{color:red;}
    .drop{color:red;}
    .leave{color:orange;}
    .graduate{color:blue;}
    .list{text-align:right;font-weight:400;}
    .list img{margin:0 2px 2px 5px;}
    .stdlist{color:#145074;}
    .buttonDiv{margin-right:5px;display:flex;justify-content:center;}
    .pagenation{margin-top:20px;gap:5px;display:flex;justify-content:center;align-items:center;}
    .registerbtn{float:right;margin-top:-10px;}
    .footer{background:#1F2838;height:10%;color:#fff;padding-left:30px;display:flex;align-items:center;}
    .pager-btn{border:0;background:transparent;cursor:pointer;}
    .livepage{font-weight:700;}
    </style>
</head>
<body>
    <!-- 상단 -->
    <div class="topbar">
        <div class="top">
            <a href="${ctx}/"><span>home</span></a><span>|</span>
            <a href="#"><span>사이트맵</span></a><span>|</span>
            <a href="#"><span>로그아웃</span></a>
        </div>
        <div class="bottom">
            <a href="${ctx}/"><img src="${ctx}/images/admin_logo.png" alt="logo"></a>
        </div>
    </div>

    <div class="menu">
        <!-- 왼쪽 사이드바 -->
        <div class="sideBar">
            <ul>
                <li class="stylenone"><img src="${ctx}/images/ico-admin-setting.png">환경설정</li>
                <ul class="styletwo">
                    <li><a href="#">&middot;기본환경정보</a></li>
                    <li><a href="#">&middot;약관관리</a></li>
                </ul>
                <li class="stylenone"><img src="${ctx}/images/ico-admin-academic.png">학사운영</li>
                <ul class="styletwo">
                    <li><a href="#">&middot;교육 운영 현황</a></li>
                    <li><a href="#">&middot;학년별 학생현황</a></li>
                    <li><a href="#">&middot;강의 목록</a></li>
                    <li><a href="#">&middot;강의 등록</a></li>
                    <li><a href="#">&middot;수강 현황</a></li>
                </ul>
                <li class="stylenone"><img src="${ctx}/images/ico-admin-persons.png">인사관리</li>
                <ul class="styletwo">
                    <li><a href="${ctx}/student/list.do">&middot;학생 목록 및 등록</a></li>
                    <li><a href="#">&middot;교수 목록 및 등록</a></li>
                    <li><a href="#">&middot;임직원 목록 및 등록</a></li>
                </ul>
                <li class="stylenone"><img src="${ctx}/images/ico-admin-college.png">대학 및 학과</li>
                <ul class="styletwo">
                    <li><a href="#">&middot;교육 운영 현황</a></li>
                    <li><a href="#">&middot;교육 운영 현황</a></li>
                </ul>
                <li class="stylenone"><img src="${ctx}/images/ico-admin-board.png">게시판 관리</li>
                <ul class="styletwo">
                    <li><a href="#">&middot;입학안내 공지사항</a></li>
                    <li><a href="#">&middot;학사안내 공지사항</a></li>
                    <li><a href="#">&middot;커뮤니티 공지사항</a></li>
                    <li><a href="#">&middot;입학상담</a></li>
                    <li><a href="#">&middot;질문 및 답변</a></li>
                    <li><a href="#">&middot;식단안내</a></li>
                    <li><a href="#">&middot;교육 운영 현황</a></li>
                </ul>
            </ul>
        </div>

        <!-- 메인 -->
        <main>
            <div class="h20p">
                <div class="title">
                    <span>학생 목록</span>
                    <div class="list">
                        <span>인사관리</span>
                        <img src="${ctx}/images/bg-link-arr-over.png" alt="">
                        <span class="stdlist">학생 목록</span>
                    </div>
                </div>
                <hr>

                <!-- 🔎 검색바: 컨트롤러와 파라미터 연동 -->
                <form class="search-bar" method="get" action="${ctx}/student/list.do">
                    <select name="cond">
                        <option value="">검색조건</option>
                        <option value="std_id"     ${cond=='std_id'?'selected':''}>학번</option>
                        <option value="name"       ${cond=='name'?'selected':''}>이름</option>
                        <option value="phone"      ${cond=='phone'?'selected':''}>휴대폰</option>
                        <option value="email"      ${cond=='email'?'selected':''}>이메일</option>
                        <option value="dept"       ${cond=='dept'?'selected':''}>학과</option>
                        <option value="entrygrade" ${cond=='entrygrade'?'selected':''}>학년</option>
                        <option value="entryterm"  ${cond=='entryterm'?'selected':''}>학기</option>
                        <option value="status"     ${cond=='status'?'selected':''}>상태</option>
                    </select>
                    <input type="text" name="kw" value="${kw}" placeholder="키워드 입력">
                    <input type="hidden" name="size" value="${size}">
                    <button type="submit">검색</button>
                </form>
            </div>

            <div class="h80p">
                <table class="h100p">
                    <thead>
                        <tr>
                            <th>학번</th>
                            <th>이름</th>
                            <th>주민번호</th>
                            <th>휴대폰</th>
                            <th>이메일</th>
                            <th>학과</th>
                            <th>학년</th>
                            <th>학기</th>
                            <th>상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- 🔁 서버 목록 바인딩 -->
                        <c:forEach var="s" items="${pr.items}">
                            <tr>
                                <td>${s.std_id}</td>
                                <td>${s.name}</td>
                                <td>${s.resident_number}</td>
                                <td>${s.phone}</td>
                                <td>${s.email}</td>
                                <td>${s.dept_name}</td>
                                <td>${s.entrygrade}</td>
                                <td>${s.entryterm}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${s.status=='재학' || s.status=='재학중'}"><span class="active">재학중</span></c:when>
                                        <c:when test="${s.status=='자퇴'}"><span class="out">자퇴</span></c:when>
                                        <c:when test="${s.status=='제적'}"><span class="drop">제적</span></c:when>
                                        <c:when test="${s.status=='휴학' || s.status=='휴학중'}"><span class="leave">휴학중</span></c:when>
                                        <c:when test="${s.status=='졸업'}"><span class="graduate">졸업</span></c:when>
                                        <c:otherwise>${s.status}</c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>

                        <c:if test="${empty pr.items}">
                            <tr><td colspan="9">데이터가 없습니다.</td></tr>
                        </c:if>
                    </tbody>
                </table>

                <!-- 🔢 페이지네이션 (블록) -->
                <div class="pagenation">
                    <c:url var="base" value="/student/list.do">
                        <c:param name="cond" value="${cond}" />
                        <c:param name="kw"   value="${kw}" />
                        <c:param name="size" value="${size}" />
                    </c:url>

                    <c:if test="${pr.hasPrev}">
                        <a href="${ctx}${base}&page=1" class="pager-btn"><img src="${ctx}/images/btn-first-page.png" alt="first"></a>
                        <a href="${ctx}${base}&page=${pr.page-1}" class="pager-btn"><img src="${ctx}/images/btn-prev-page.png" alt="prev"></a>
                    </c:if>

                    <c:if test="${pr.hasPrevBlock}">
                        <a href="${ctx}${base}&page=${pr.startPage-1}" class="pager-btn">&laquo;</a>
                    </c:if>

                    <c:forEach var="p" begin="${pr.startPage}" end="${pr.endPage}">
                        <c:choose>
                            <c:when test="${p == pr.page}">
                                <button class="livepage" disabled>${p}</button>
                            </c:when>
                            <c:otherwise>
                                <a href="${ctx}${base}&page=${p}"><button type="button">${p}</button></a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>

                    <c:if test="${pr.hasNextBlock}">
                        <a href="${ctx}${base}&page=${pr.endPage+1}" class="pager-btn">&raquo;</a>
                    </c:if>

                    <c:if test="${pr.hasNext}">
                        <a href="${ctx}${base}&page=${pr.page+1}" class="pager-btn"><img src="${ctx}/images/btn-next-page.png" alt="next"></a>
                        <a href="${ctx}${base}&page=${pr.totalPages}" class="pager-btn"><img src="${ctx}/images/btn-last-page.png" alt="last"></a>
                    </c:if>
                </div>

                <div class="registerbtn">
                    <a href="${ctx}/student/write.do"><button type="button">등록</button></a>
                </div>
            </div>
        </main>
    </div>

    <!-- 푸터 -->
    <footer class="footer">
        <p>Copyright ©Green University All rights reserved. ADMINISTRATOR Version 1.4.1</p>
    </footer>
</body>
</html>
