<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>그린대학교 학사관리시스템 - 운영현황 메인</title>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<style>
:root{
  --brand-blue:#00518C; --brand-dark:#1F2838;
  --text:#222; --muted:#333;
  --sidebar-bg:#F5F6F7; --card:#FFF;
  --line:#C0C0C0; --thead:#F6F8FB; --row:#E9EDF3; --accent:#1F5E95;
  --sb-icon:18px; --sb-gap:8px; --sb-indent:calc(var(--sb-icon) + var(--sb-gap));
}
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Noto Sans KR', Arial, system-ui, sans-serif;color:var(--text);background:#f9f9f9;min-height:100vh;display:flex;flex-direction:column}
.top-menu{background:var(--brand-blue);height:30px;display:flex;align-items:center}
.top-menu__inner{width:100%;display:flex;justify-content:flex-end;align-items:center;padding:0 40px}
.top-menu__link{color:#fff;font-size:12px;line-height:20px;text-decoration:none;position:relative;padding:0 10px}
.top-menu__link + .top-menu__link::before{content:"";position:absolute;left:0;top:4px;width:1px;height:11px;background:rgba(255,255,255,.3)}
.brand-bar{background:var(--brand-dark);height:90px;border-bottom:1px solid #dcdcdc;position:relative}
.brand-logo{position:absolute;left:260px;top:16px;width:352px;height:52px;display:block;object-fit:contain}
@media (max-width:1200px){.brand-logo{left:24px}}
.layout{display:flex;align-items:flex-start;width:min(1400px,96vw);margin:22px auto 56px;gap:20px;flex:1}
.sidebar{flex:0 0 270px;min-height:840px;border-right:1px solid var(--line);background:var(--sidebar-bg)}
.sidebar-menu{padding:20px 16px;font-size:14px;color:var(--muted)}
.sidebar-menu h3{display:flex;align-items:center;gap:8px;margin:20px 0 10px;font-size:16px;font-weight:700;color:#111;cursor:default}
.menu-icon{width:18px;height:18px;flex:0 0 18px}
.sidebar-menu .menu-group>ul{list-style:none;margin:0 0 18px 0;padding:0;margin-left:var(--sb-indent)}
.sidebar-menu li{display:block;margin:8px 0;line-height:1.7;position:relative}
.sidebar-menu li::before{content:"·";position:absolute;left:-14px;top:0;color:#7f8790;font-size:20px;line-height:1}
.sidebar-menu li a,.sidebar-menu li span{display:flex;align-items:center;gap:10px;width:100%;line-height:1.7;color:#333;font-weight:500;text-decoration:none;}
.sidebar-menu li a:hover{color:var(--brand-blue)}
.sidebar-menu li span{cursor:default}
.main-area{flex:1}
.page{background:var(--card);border:1px solid var(--line)}
.page__body{padding:16px}
.page__header{height:46px;border-bottom:1px solid #cfd6df;padding:0 16px;display:flex;align-items:center;justify-content:space-between}
.page__title{font-size:16px;font-weight:700;color:#222}
.page__path{font-size:12px;display:flex;align-items:center;gap:6px}
.page__path .crumb{color:#666}
.page__path .page__sep{color:#a8b0ba;margin:0 2px}
.page__path .crumb-link{color:#145074;font-weight:500;text-decoration:none}
.page__path .crumb-link:hover{text-decoration:underline}
.block{border:0;background:transparent;box-shadow:none}
.block+.block{margin-top:14px}
.block__head{padding:0 0 8px}
.block__title{display:flex;align-items:center;gap:6px;font-size:16px;font-weight:600;color:#145074;margin:0}
.block__title::before{content:"";width:6px;height:20px;background:var(--accent);border-radius:1px}
.table{width:100%;border-collapse:separate;border-spacing:0;font-size:13px;border-top:1px solid #cfd6df;border-bottom:1px solid #e9edf3}
.table thead th{height:45.5px;background:var(--thead);color:#5a6475;font-weight:600;text-align:center;border:0;border-bottom:1px solid #cfd6df}
.table tbody td{height:45.5px;background:#fff;border:0;border-bottom:1px solid #e1e6ee}
.table tfoot td{height:45.5px;background:#fff;border-top:1px solid #e1e6ee;font-weight:700}
.table .center{text-align:center}
.table .num{text-align:right;padding-right:10px}
.table--univ col{width:136.25px}
.table--edu col:nth-child(1){width:120px}
.table--edu col:nth-child(2){width:100px}
.table--edu col:nth-child(3){width:160px}
.table--edu col:nth-child(4){width:80px}
.table--edu col:nth-child(5){width:100px}
.table--edu col:nth-child(6){width:80px}
.table--edu col:nth-child(7){width:60px}
.table--edu col:nth-child(8){width:120px}
.table--edu col:nth-child(9){width:100px}
.table--edu col:nth-child(10){width:80px}
.grid-2{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:12px;align-items:start}
.grid-2>.block{margin:0}
@media (max-width:1024px){.grid-2{grid-template-columns:1fr}}
.table--bygrade td,.table--bygrade tfoot td,.table--bymajor td,.table--bymajor tfoot td{ text-align:center !important;vertical-align:middle }
.spacer{height:14px}
a.link{color:#145074;text-decoration:none}
a.link:hover{text-decoration:underline}
.status{font-weight:700}
.status--done{color:#2e9f55}
.status--warn{color:#d64835}
.site-footer{background:#19202D;color:#cfd3db;height:60px;display:flex;align-items:center}
.site-footer .footer-inner{width:min(1400px,96vw);margin:0 auto;padding:0 20px;font-size:12px;letter-spacing:.02em}
</style>
</head>
<body>

<div class="top-menu">
  <nav class="top-menu__inner">
    <a class="top-menu__link" href="${pageContext.request.contextPath}/">HOME</a>
    <a class="top-menu__link" href="${pageContext.request.contextPath}/sitemap.jsp">사이트맵</a>
    <a class="top-menu__link" href="${pageContext.request.contextPath}/user/login.do">로그인</a>
  </nav>
</div>

<header class="brand-bar">
  <a href="${pageContext.request.contextPath}/academic/index.do">
    <img class="brand-logo" src="${pageContext.request.contextPath}/images/admin_logo.png" alt="그린대학교 학사관리시스템 로고">
  </a>
</header>

<div class="layout">
  <aside class="sidebar">
    <nav class="sidebar-menu">
      <div class="menu-group">
        <h3><img src="${pageContext.request.contextPath}/images/ico-admin-setting.png" alt="" class="menu-icon">환경설정</h3>
        <ul><li><span>기본환경정보</span></li><li><span>약관관리</span></li></ul>
      </div>
      <div class="menu-group">
        <h3><img src="${pageContext.request.contextPath}/images/ico-admin-academic.png" alt="" class="menu-icon">학사운영</h3>
        <ul>
          <!-- ★ 여기 링크 변경 -->
          <li><a href="${pageContext.request.contextPath}/academic/index.do">교육 운영 현황</a></li>
          <li><span>학년별 학생 현황</span></li>
          <li><span>학과별 학생 현황</span></li>
          <li><a href="${pageContext.request.contextPath}/academic/operation/lecture-list.do">강의 목록</a></li>
          <li><a href="${pageContext.request.contextPath}/academic/operation/lecture-register.do">강의 등록</a></li>
          <li><a href="${pageContext.request.contextPath}/academic/operation/enrollment.do">수강 현황</a></li>
        </ul>
      </div>
      <div class="menu-group">
        <h3><img src="${pageContext.request.contextPath}/images/ico-admin-persons.png" alt="" class="menu-icon">인사관리</h3>
        <ul>
          <li><a href="${pageContext.request.contextPath}/student/list.do">학생 목록</a></li>
          <li><a href="${pageContext.request.contextPath}/student/write.do">학생 등록</a></li>
          <li><a href="${pageContext.request.contextPath}/professor/list.do">교수 목록</a></li>
          <li><a href="${pageContext.request.contextPath}/professor/write.do">교수 등록</a></li>
          <li><span>임직원 목록 및 등록</span></li>
        </ul>
      </div>
      <div class="menu-group">
        <h3><img src="${pageContext.request.contextPath}/images/ico-admin-college.png" alt="" class="menu-icon">대학 및 학과</h3>
        <ul>
          <li><a href="${pageContext.request.contextPath}/departments/department-list.do">학과 목록</a></li>
          <li><a href="${pageContext.request.contextPath}/college/write.do">대학 등록</a></li>
          <li><a href="${pageContext.request.contextPath}/academic/departments/department-register.do">학과 등록</a></li>
        </ul>
      </div>
      <div class="menu-group">
        <h3><img src="${pageContext.request.contextPath}/images/ico-admin-board.png" alt="" class="menu-icon">게시판관리</h3>
        <ul>
          <li><span>입학안내 공지사항</span></li>
          <li><span>학사안내 공지사항</span></li>
          <li><span>커뮤니티 공지사항</span></li>
          <li><span>입학상담</span></li>
          <li><span>질문 및 답변</span></li>
          <li><span>식단안내</span></li>
          <li><span>자료실</span></li>
        </ul>
      </div>
    </nav>
  </aside>

  <main class="main-area">
    <section class="page">
      <div class="page__header">
        <h3 class="page__title">운영현황 메인</h3>
        <div class="page__path"><span class="crumb">HOME</span><span class="page__sep">›</span><a href="#" class="crumb-link">운영현황 메인</a></div>
      </div>

      <div class="page__body">
        <!-- 1) 대학 운영 현황 -->
        <article class="block">
          <header class="block__head"><h4 class="block__title">대학 운영 현황</h4></header>
          <div class="block__body">
            <table class="table table--univ">
              <colgroup><col><col><col><col><col><col><col><col></colgroup>
              <thead>
                <tr>
                  <th class="center">개설학과</th>
                  <th class="center">개설강좌</th>
                  <th class="center">전체교수</th>
                  <th class="center">임직원</th>
                  <th class="center">학생</th>
                  <th class="center">휴학생</th>
                  <th class="center">대학원생</th>
                  <th class="center">졸업생</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td class="center">${uni.deptCnt}</td>
                  <td class="center">${uni.courseCnt}</td>
                  <td class="center">${uni.profCnt}</td>
                  <td class="center">${uni.staffCnt}</td>
                  <td class="center">${uni.stuActive}</td>
                  <td class="center">${uni.stuLeave}</td>
                  <td class="center">${uni.stuGrad}</td>
                  <td class="center">${uni.alumni}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </article>

        <div class="spacer"></div>

        <!-- 2) 교육 운영 현황 -->
        <article class="block">
          <header class="block__head"><h4 class="block__title">교육 운영 현황</h4></header>
          <div class="block__body">
            <table class="table table--edu">
              <colgroup><col><col><col><col><col><col><col><col><col><col></colgroup>
              <thead>
                <tr>
                  <th class="center">학과</th>
                  <th class="center">과목코드</th>
                  <th class="center">과목명</th>
                  <th class="center">학년</th>
                  <th class="center">담당교수</th>
                  <th class="center">구분</th>
                  <th class="center">학점</th>
                  <th class="center">강의장</th>
                  <th class="center">수강인원</th>
                  <th class="center">수강률</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="row" items="${eduList}">
                  <tr>
                    <td class="center">${row.deptName}</td>
                    <td class="center">${row.crsCd}</td>
                    <td class="center">${row.crsName}</td>
                    <td class="center">${row.gradeLabel}</td>
                    <td class="center">${row.profName}</td>
                    <td class="center">${row.division}</td>
                    <td class="center">${row.credit}</td>
                    <td class="center">${row.room}</td>
                    <td class="center">${row.enrolledOfCapacity}</td>
                    <td class="center"><c:out value="${row.ratePct}"/>%</td>
                  </tr>
                </c:forEach>
                <c:if test="${empty eduList}">
                  <tr><td class="center" colspan="10">표시할 강좌가 없습니다.</td></tr>
                </c:if>
              </tbody>
            </table>
          </div>
        </article>

        <!-- 3) 2열: 학년별 / 학과별 학생 현황 -->
        <div class="grid-2" style="margin-top:14px;">
          <article class="block" id="by-grade">
            <header class="block__head"><h4 class="block__title">학년별 학생 현황</h4></header>
            <div class="block__body">
              <table class="table table--bygrade">
                <thead>
                  <tr><th class="center">학년</th><th class="center">재학생</th><th class="center">휴학생</th><th class="center">전체</th></tr>
                </thead>
                <tbody>
                  <c:forEach var="g" items="${byGrade}">
                    <tr>
                      <td class="center">${g.gradeLabel}</td>
                      <td class="center">${g.activeCnt}</td>
                      <td class="center">${g.leaveCnt}</td>
                      <td class="center">${g.totalCnt}</td>
                    </tr>
                  </c:forEach>
                  <c:if test="${empty byGrade}">
                    <tr><td class="center" colspan="4">데이터 없음</td></tr>
                  </c:if>
                </tbody>
                <tfoot>
                  <tr>
                    <td class="center"><strong>총합</strong></td>
                    <td><strong>
                      <c:set var="sumA" value="0"/>
                      <c:forEach var="g" items="${byGrade}">
                        <c:set var="sumA" value="${sumA + g.activeCnt}"/>
                      </c:forEach>${sumA}
                    </strong></td>
                    <td><strong>
                      <c:set var="sumL" value="0"/>
                      <c:forEach var="g" items="${byGrade}">
                        <c:set var="sumL" value="${sumL + g.leaveCnt}"/>
                      </c:forEach>${sumL}
                    </strong></td>
                    <td><strong>
                      <c:set var="sumT" value="0"/>
                      <c:forEach var="g" items="${byGrade}">
                        <c:set var="sumT" value="${sumT + g.totalCnt}"/>
                      </c:forEach>${sumT}
                    </strong></td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </article>

          <article class="block" id="by-major">
            <header class="block__head"><h4 class="block__title">학과별 학생 현황</h4></header>
            <div class="block__body">
              <table class="table table--bymajor">
                <thead>
                  <tr><th class="center">학과</th><th class="center">재학생</th><th class="center">휴학생</th><th class="center">전체</th></tr>
                </thead>
                <tbody>
                  <c:forEach var="d" items="${byDept}">
                    <tr>
                      <td class="center">${d.deptName}</td>
                      <td class="center">${d.activeCnt}</td>
                      <td class="center">${d.leaveCnt}</td>
                      <td class="center">${d.totalCnt}</td>
                    </tr>
                  </c:forEach>
                  <c:if test="${empty byDept}">
                    <tr><td class="center" colspan="4">데이터 없음</td></tr>
                  </c:if>
                </tbody>
                <tfoot>
                  <tr>
                    <td class="center"><strong>총합</strong></td>
                    <td><strong>
                      <c:set var="sA" value="0"/>
                      <c:forEach var="d" items="${byDept}">
                        <c:set var="sA" value="${sA + d.activeCnt}"/>
                      </c:forEach>${sA}
                    </strong></td>
                    <td><strong>
                      <c:set var="sL" value="0"/>
                      <c:forEach var="d" items="${byDept}">
                        <c:set var="sL" value="${sL + d.leaveCnt}"/>
                      </c:forEach>${sL}
                    </strong></td>
                    <td><strong>
                      <c:set var="sT" value="0"/>
                      <c:forEach var="d" items="${byDept}">
                        <c:set var="sT" value="${sT + d.totalCnt}"/>
                      </c:forEach>${sT}
                    </strong></td>
                  </tr>
                </tfoot>
              </table>
            </div>
          </article>
        </div>

        <!-- 4) 공지 / 입학상담 -->
        <div class="grid-2" style="margin-top:14px;">
          <article class="block">
            <header class="block__head"><h4 class="block__title">학사안내 공지사항</h4></header>
            <div class="block__body">
              <table class="table">
                <thead>
                  <tr><th class="center" style="width:70px">번호</th><th>제목</th><th class="center" style="width:90px">작성자</th><th class="center" style="width:90px">작성일</th></tr>
                </thead>
                <tbody>
                  <c:forEach var="b" items="${notices}">
                    <tr>
                      <td class="center">${b.no}</td>
                      <td><a class="link" href="${pageContext.request.contextPath}/board/view.do?no=${b.no}">${b.title}</a></td>
                      <td class="center">${b.writer}</td>
                      <td class="center">${b.wdate}</td>
                    </tr>
                  </c:forEach>
                  <c:if test="${empty notices}">
                    <tr><td class="center" colspan="4">공지사항이 없습니다.</td></tr>
                  </c:if>
                </tbody>
              </table>
            </div>
          </article>

          <article class="block">
            <header class="block__head"><h4 class="block__title">입학상담</h4></header>
            <div class="block__body">
              <table class="table">
                <thead>
                  <tr><th class="center" style="width:70px">번호</th><th>제목</th><th class="center" style="width:90px">작성일</th><th class="center" style="width:80px">상태</th></tr>
                </thead>
                <tbody>
                  <c:forEach var="q" items="${qna}">
                    <tr>
                      <td class="center">${q.no}</td>
                      <td><a class="link" href="${pageContext.request.contextPath}/board/view.do?no=${q.no}">${q.title}</a></td>
                      <td class="center">${q.wdate}</td>
                      <td class="center">
                        <span class="status ${q.status eq '답변완료' ? 'status--done' : 'status--warn'}">${q.status}</span>
                      </td>
                    </tr>
                  </c:forEach>
                  <c:if test="${empty qna}">
                    <tr><td class="center" colspan="4">문의가 없습니다.</td></tr>
                  </c:if>
                </tbody>
              </table>
            </div>
          </article>
        </div>

      </div>
    </section>
  </main>
</div>

<footer class="site-footer" role="contentinfo">
  <div class="footer-inner">
    Copyright &copy; Green University All rights reserved. ADMINISTRATOR Version 1.4.1
  </div>
</footer>
</body>
</html>
