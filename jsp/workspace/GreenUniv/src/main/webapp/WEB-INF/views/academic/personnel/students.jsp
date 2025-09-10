<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>인사관리 - 학생 목록</title>

  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet" />

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

    /* Top bar (공통) */
    .top-menu{background:var(--brand-blue);height:30px;display:flex;align-items:center}
    .top-menu__inner{width:100%;display:flex;justify-content:flex-end;align-items:center;padding:0 40px}
    .top-menu__link{color:#fff;font-size:12px;line-height:20px;text-decoration:none;position:relative;padding:0 10px}
    .top-menu__link + .top-menu__link::before{content:"";position:absolute;left:0;top:4px;width:1px;height:11px;background:rgba(255,255,255,.3)}

    /* Brand bar (공통) */
    .brand-bar{background:var(--brand-dark);height:90px;border-bottom:1px solid #dcdcdc;position:relative}
    .brand-logo{position:absolute;left:260px;top:16px;width:352px;height:52px;display:block;object-fit:contain}
    @media (max-width:1200px){.brand-logo{left:24px}}

    /* Layout (공통) */
    .layout{display:flex;align-items:flex-start;width:min(1400px,96vw);margin:22px auto 56px;gap:20px;flex:1}

    /* Sidebar (공통) */
    .sidebar{flex:0 0 270px;min-height:840px;border-right:1px solid var(--line);background:var(--sidebar-bg)}
    .sidebar-menu{padding:20px 16px;font-size:14px;color:var(--muted)}
    .sidebar-menu h3{display:flex;align-items:center;gap:8px;margin:20px 0 10px;font-size:16px;font-weight:700;color:#111;cursor:default}
    .menu-icon{width:18px;height:18px;flex:0 0 18px}
    .sidebar-menu .menu-group>ul{list-style:none;margin:0 0 18px 0;padding:0;margin-left:var(--sb-indent)}
    .sidebar-menu li{display:block;margin:8px 0;line-height:1.7;position:relative}
    .sidebar-menu li::before{content:"·";position:absolute;left:-14px;top:0;color:#7f8790;font-size:20px;line-height:1}
    /* 링크/스팬 타이포 통일 */
    .sidebar-menu li a,.sidebar-menu li span{
      display:flex;align-items:center;gap:10px;width:100%;
      color:#333;font-weight:500;text-decoration:none;
    }
    .sidebar-menu li a:hover{color:var(--brand-blue)}
    .sidebar-menu li span{cursor:default}

    /* Page card (공통) */
    .main-area{flex:1}
    .page{background:var(--card);border:1px solid var(--line)}
    .page__body{padding:16px}
    .page__header{height:46px;border-bottom:1px solid #cfd6df;padding:0 16px;display:flex;align-items:center;justify-content:space-between}
    .page__title{font-size:16px;font-weight:700;color:#222}
    .page__path{font-size:12px;display:flex;align-items:center;gap:6px;white-space:nowrap}
    .page__path .path__dim{color:#666}
    .page__path strong{color:#145074;font-weight:500}
    .page__path .path__sep svg{width:12px;height:6px;display:block}
    .page__path .path__sep path{stroke:#145074}

    /* 검색바 & 테이블 */
    .search-bar{text-align:right;margin-top:10px}
    .sel,.inp{height:35px;padding:0 8px;border:1px solid #ccc;font-size:14px}
    .sel{width:150px}
    .inp{width:200px}
    .btn{height:35px;padding:0 14px;border:1px solid #ccc;background:#eee;cursor:pointer}

    .table{width:100%;border-collapse:separate;border-spacing:0}
    .table thead th{background:#fafafa;border-top:1px solid #a3a3a3;border-bottom:1px solid #a3a3a3;padding:10px}
    .table tbody td{border-bottom:1px solid #D8D8D8;padding:10px;text-align:center}

    /* 상태 색상 */
    .active{color:green}.out{color:red}.drop{color:red}.leave{color:orange}.graduate{color:blue}

    /* 페이지네이션 */
    .pagination{margin-top:20px;display:flex;justify-content:center;gap:6px;align-items:center}
    .pager-btn{border:0;background:transparent;cursor:pointer;display:inline-flex;align-items:center}
    .livepage{font-weight:700}

    /* Footer (공통) */
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
      <a class="top-menu__link" href="${ctx}/user/login.do">로그인</a>
    </nav>
  </div>

  <!-- Brand header (로고 클릭 → academic 메인) -->
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
            <li><a href="${ctx}/departments/department-list.jsp">학과 목록</a></li>
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
          <h3 class="page__title">학생 목록</h3>
          <div class="page__path">
            <span class="path__dim">인사관리</span>
            <span class="path__sep">
              <svg viewBox="0 0 12 6" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                <path d="M1 1l5 4 5-4" fill="none" stroke="#145074" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </span>
            <strong>학생 목록</strong>
          </div>
        </div>

        <div class="page__body">

          <!-- 검색바 -->
          <form class="search-bar" method="get" action="${ctx}/student/list.do">
            <select class="sel" name="cond">
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
            <input class="inp" type="text" name="kw" value="${kw}" placeholder="키워드 입력">
            <input type="hidden" name="size" value="${size}">
            <button class="btn" type="submit">검색</button>
          </form>

          <!-- 목록 -->
          <div style="margin-top:12px">
            <table class="table">
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
          </div>

          <!-- 페이지네이션 -->
          <div class="pagination">
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

            <div style="margin-left:auto">
              <a href="${ctx}/student/write.do"><button class="btn" type="button">등록</button></a>
            </div>
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
