<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>인사관리 - 교수 목록</title>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<style>
/* ===== Design tokens (공통) ===== */
:root{
  --brand-blue:#00518C; --brand-dark:#1F2838;
  --text:#222; --muted:#333;
  --sidebar-bg:#F5F6F7; --card:#FFF;
  --line:#C0C0C0; --thead:#F6F8FB; --row:#E9EDF3; --accent:#1F5E95;
  --sb-icon:18px; --sb-gap:8px; --sb-indent:calc(var(--sb-icon) + var(--sb-gap));
}
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Noto Sans KR', Arial, system-ui, sans-serif;color:var(--text);background:#f9f9f9;min-height:100vh;display:flex;flex-direction:column}

/* Top bar */
.top-menu{background:var(--brand-blue);height:30px;display:flex;align-items:center}
.top-menu__inner{width:100%;display:flex;justify-content:flex-end;align-items:center;padding:0 40px}
.top-menu__link{color:#fff;font-size:12px;line-height:20px;text-decoration:none;position:relative;padding:0 10px}
.top-menu__link + .top-menu__link::before{content:"";position:absolute;left:0;top:4px;width:1px;height:11px;background:rgba(255,255,255,.3)}

/* Brand bar */
.brand-bar{background:var(--brand-dark);height:90px;border-bottom:1px solid #dcdcdc;position:relative}
.brand-logo{position:absolute;left:260px;top:16px;width:352px;height:52px;display:block;object-fit:contain}
@media (max-width:1200px){.brand-logo{left:24px}}

/* Layout */
.layout{display:flex;align-items:flex-start;width:min(1400px,96vw);margin:22px auto 56px;gap:20px;flex:1}

/* Sidebar */
.sidebar{flex:0 0 270px;min-height:840px;border-right:1px solid var(--line);background:var(--sidebar-bg)}
.sidebar-menu{padding:20px 16px;font-size:14px;color:var(--muted)}
.sidebar-menu h3{display:flex;align-items:center;gap:8px;margin:20px 0 10px;font-size:16px;font-weight:700;color:#111;cursor:default}
.menu-icon{width:18px;height:18px;flex:0 0 18px}
.sidebar-menu .menu-group>ul{list-style:none;margin:0 0 18px 0;padding:0;margin-left:var(--sb-indent)}
.sidebar-menu li{display:block;margin:8px 0;line-height:1.7;position:relative}
.sidebar-menu li::before{content:"·";position:absolute;left:-14px;top:0;color:#7f8790;font-size:20px;line-height:1}
.sidebar-menu li a,.sidebar-menu li span{
  display:flex;align-items:center;gap:10px;width:100%;
  color:#333;font-weight:500;text-decoration:none;
}
.sidebar-menu li a:hover{color:var(--brand-blue)}
.sidebar-menu li span{cursor:default}

/* Page */
.main-area{flex:1}
.page{background:var(--card);border:1px solid var(--line)}
.page__body{padding:16px}
.page__header{height:46px;border-bottom:1px solid var(--line);padding:0 16px;display:flex;align-items:center;justify-content:space-between}
.page__title{font-size:16px;font-weight:700;color:#222}
.page__path{font-size:12px;display:flex;align-items:center;gap:6px;white-space:nowrap}
.page__path .path__dim{color:#666}
.page__path strong{color:#145074;font-weight:500}
.page__path .path__sep svg{width:12px;height:6px;display:block}

/* Toolbar / Search */
.toolbar{display:flex;align-items:center;justify-content:flex-end;margin:12px 0}
.search-bar{display:flex;align-items:center;gap:8px}
.search-bar select,.search-bar input,.search-bar button{
  height:34px;font-size:14px;padding:0 10px;border:1px solid #cfd6df;background:#fff;outline:none
}
.search-bar select{width:160px}
.search-bar input{width:220px}
.search-bar button{background:#eee;cursor:pointer}

/* Table */
.list-table{width:100%;border-collapse:separate;border-spacing:0;table-layout:fixed;font-size:14px;border-top:1px solid #D8DEE8}
.list-table thead th{background:#FAFBFD;border-bottom:1px solid #E1E6EE;border-right:1px solid #E1E6EE;padding:10px;text-align:center}
.list-table tbody td{border-bottom:1px solid #EAEFF6;border-right:1px solid #EAEFF6;padding:10px;text-align:center;background:#fff}
.list-table tr>*:first-child{border-left:1px solid #D8DEE8}

/* Status color */
.state-active{color:#1e8d3d}
.state-leave{color:#f08a24}
.state-out{color:#d84545}

/* Section footer */
.section-actions{display:flex;justify-content:space-between;align-items:center;margin-top:16px}
.pagenation{display:flex;align-items:center;gap:6px}
.pagenation a, .pagenation button{display:inline-flex;align-items:center;justify-content:center;min-width:30px;height:30px;border:1px solid #cfd6df;background:#fff;cursor:pointer;text-decoration:none;color:#333}
.pagenation img{display:block}
.btn-primary{height:36px;padding:0 22px;border:0;cursor:pointer;background:#2d5078;color:#fff;font-size:14px;border-radius:4px;text-decoration:none}

/* Footer */
.site-footer{background:#19202D;color:#cfd3db;height:60px;display:flex;align-items:center}
.site-footer .footer-inner{width:min(1400px,96vw);margin:0 auto;padding:0 20px;font-size:12px;letter-spacing:.02em}
</style>
</head>
<body>

  <!-- Top menu -->
  <div class="top-menu">
    <nav class="top-menu__inner">
      <a class="top-menu__link" href="${ctx}/">HOME</a>
      <a class="top-menu__link" href="${ctx}/sitemap.jsp">사이트맵</a>
      <a class="top-menu__link" href="${ctx}/user/logout.do">로그아웃</a>
    </nav>
  </div>

  <!-- Brand header (logo → academic index) -->
  <header class="brand-bar">
    <a href="${ctx}/academic/index.do">
      <img class="brand-logo" src="${ctx}/images/admin_logo.png" alt="그린대학교 학사관리시스템 로고">
    </a>
  </header>

  <div class="layout">
    <!-- Sidebar -->
    <aside class="sidebar">
      <nav class="sidebar-menu">
        <!-- 환경설정 -->
        <div class="menu-group">
          <h3><img src="${ctx}/images/ico-admin-setting.png" alt="" class="menu-icon">환경설정</h3>
          <ul>
            <li><span>기본환경정보</span></li>
            <li><span>약관관리</span></li>
          </ul>
        </div>

        <!-- 학사운영 -->
        <div class="menu-group">
          <h3><img src="${ctx}/images/ico-admin-academic.png" alt="" class="menu-icon">학사운영</h3>
          <ul>
            <li><a href="${ctx}/academic/operation/overview.jsp">교육 운영 현황</a></li>
            <li><span>학년별 학생 현황</span></li>
            <li><span>학과별 학생 현황</span></li>
            <li><a href="${ctx}/academic/operation/lecture-list.jsp">강의 목록</a></li>
            <li><a href="${ctx}/academic/operation/lecture-register.jsp">강의 등록</a></li>
            <li><a href="${ctx}/academic/operation/enrollment.jsp">수강 현황</a></li>
          </ul>
        </div>

        <!-- 인사관리 -->
        <div class="menu-group">
          <h3><img src="${ctx}/images/ico-admin-persons.png" alt="" class="menu-icon">인사관리</h3>
          <ul>
            <li><a href="${ctx}/student/list.do">학생 목록</a></li>
            <li><a href="${ctx}/student/write.do">학생 등록</a></li>
            <li><a href="${ctx}/professor/list.do">교수 목록</a></li>
            <li><a href="${ctx}/professor/write.do">교수 등록</a></li>
            <li><span>임직원 목록 및 등록</span></li>
          </ul>
        </div>

        <!-- 대학 및 학과 -->
        <div class="menu-group">
          <h3><img src="${ctx}/images/ico-admin-college.png" alt="" class="menu-icon">대학 및 학과</h3>
          <ul>
            <li><a href="${ctx}/department/list.do">학과 목록</a></li>
            <li><a href="${ctx}/college/write.do">대학 및 학과 등록</a></li>
          </ul>
        </div>

        <!-- 게시판관리 -->
        <div class="menu-group">
          <h3><img src="${ctx}/images/ico-admin-board.png" alt="" class="menu-icon">게시판관리</h3>
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

    <!-- Main -->
    <main class="main-area">
      <section class="page">
        <div class="page__header">
          <h3 class="page__title">교수 목록</h3>
          <div class="page__path">
            <span class="path__dim">인사관리</span>
            <span class="path__sep">
              <svg viewBox="0 0 12 6" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                <path d="M1 1l5 4 5-4" fill="none" stroke="#145074" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </span>
            <strong>교수 목록</strong>
          </div>
        </div>

        <div class="page__body">
          <!-- 검색 -->
          <form class="toolbar search-bar" method="get" action="${ctx}/professor/list.do">
            <select name="cond">
              <option value="">검색조건</option>
              <option value="prof_id"   ${cond=='prof_id'?'selected':''}>교수번호</option>
              <option value="name"      ${cond=='name'?'selected':''}>이름</option>
              <option value="phone"     ${cond=='phone'?'selected':''}>휴대폰</option>
              <option value="email"     ${cond=='email'?'selected':''}>이메일</option>
              <option value="dept"      ${cond=='dept'?'selected':''}>학과</option>
              <option value="position"  ${cond=='position'?'selected':''}>직위</option>
              <option value="status"    ${cond=='status'?'selected':''}>재직여부</option>
              <option value="hire_date" ${cond=='hire_date'?'selected':''}>임용일</option>
            </select>
            <input type="text" name="kw" value="${kw}" placeholder="키워드 입력" />
            <input type="hidden" name="size" value="${size}" />
            <button type="submit">검색</button>
          </form>

          <!-- 목록 -->
          <table class="list-table">
            <colgroup>
              <col style="width:120px"><col style="width:100px"><col style="width:150px">
              <col style="width:140px"><col style="width:220px"><col>
              <col style="width:100px"><col style="width:100px"><col style="width:120px">
            </colgroup>
            <thead>
              <tr>
                <th>교수번호</th>
                <th>이름</th>
                <th>주민번호</th>
                <th>휴대폰</th>
                <th>이메일</th>
                <th>학과</th>
                <th>직위</th>
                <th>재직여부</th>
                <th>임용일</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="p" items="${pr.items}">
                <tr>
                  <td>${p.prof_id}</td>
                  <td>${p.name}</td>
                  <td>${p.resident_number}</td>
                  <td>${p.phone}</td>
                  <td>${p.email}</td>
                  <td>${p.dept_name}</td>
                  <td>${p.position}</td>
                  <td>
                    <c:choose>
                      <c:when test="${p.status=='재직' || p.status=='재직중'}"><span class="state-active">재직중</span></c:when>
                      <c:when test="${p.status=='휴직'}"><span class="state-leave">휴직</span></c:when>
                      <c:when test="${p.status=='퇴직'}"><span class="state-out">퇴직</span></c:when>
                      <c:otherwise>${p.status}</c:otherwise>
                    </c:choose>
                  </td>
                  <td>${p.hire_date}</td>
                </tr>
              </c:forEach>

              <c:if test="${empty pr.items}">
                <tr><td colspan="9">데이터가 없습니다.</td></tr>
              </c:if>
            </tbody>
          </table>

          <!-- 페이징 + 등록 -->
          <div class="section-actions">
            <div class="pagenation" aria-label="페이지 이동">
              <c:url var="base" value="/professor/list.do">
                <c:param name="cond" value="${cond}" />
                <c:param name="kw"   value="${kw}" />
                <c:param name="size" value="${size}" />
              </c:url>

              <c:if test="${pr.hasPrev}">
                <a href="${ctx}${base}&page=1"    title="첫 페이지"><img src="${ctx}/images/btn-first-page.png" alt="첫 페이지"></a>
                <a href="${ctx}${base}&page=${pr.page-1}" title="이전 페이지"><img src="${ctx}/images/btn-prev-page.png" alt="이전"></a>
              </c:if>

              <c:if test="${pr.hasPrevBlock}">
                <a href="${ctx}${base}&page=${pr.startPage-1}" title="이전 블록">&laquo;</a>
              </c:if>

              <c:forEach var="pno" begin="${pr.startPage}" end="${pr.endPage}">
                <c:choose>
                  <c:when test="${pno == pr.page}">
                    <button aria-current="page" disabled>${pno}</button>
                  </c:when>
                  <c:otherwise>
                    <a href="${ctx}${base}&page=${pno}">${pno}</a>
                  </c:otherwise>
                </c:choose>
              </c:forEach>

              <c:if test="${pr.hasNextBlock}">
                <a href="${ctx}${base}&page=${pr.endPage+1}" title="다음 블록">&raquo;</a>
              </c:if>

              <c:if test="${pr.hasNext}">
                <a href="${ctx}${base}&page=${pr.page+1}" title="다음 페이지"><img src="${ctx}/images/btn-next-page.png" alt="다음"></a>
                <a href="${ctx}${base}&page=${pr.totalPages}" title="마지막 페이지"><img src="${ctx}/images/btn-last-page.png" alt="마지막"></a>
              </c:if>
            </div>

            <a href="${ctx}/professor/write.do" class="btn-primary">등록</a>
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
