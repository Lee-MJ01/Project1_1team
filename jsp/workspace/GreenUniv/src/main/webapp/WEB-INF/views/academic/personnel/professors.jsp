<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>인사관리 - 교수 목록</title>

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

    /* 검색바 & 테이블 & 버튼  */
    .search-bar{text-align:right;margin-top:10px}
    .sel,.inp{height:35px;padding:0 8px;border:1px solid #ccc;font-size:14px}
    .sel{width:150px}
    .inp{width:200px}
    .btn{height:35px;padding:0 14px;border:1px solid #ccc;background:#eee;cursor:pointer}

    .table{width:100%;border-collapse:separate;border-spacing:0}
    .table thead th{background:#fafafa;border-top:1px solid #a3a3a3;border-bottom:1px solid #a3a3a3;padding:10px;text-align:center}
    .table tbody td{border-bottom:1px solid #D8D8D8;padding:10px;text-align:center;background:#fff}

    /* 상태 색상 */
    .state-active{color:#1e8d3d}
    .state-leave{color:#f08a24}
    .state-out{color:#d84545}

    /* 페이지네이션  */
    .pager{
      display:flex; justify-content:center; align-items:center;
      gap:8px; margin:22px 0;
    }
    .pager a, .pager span{
      min-width:36px; height:36px; padding:0 12px;
      display:inline-flex; align-items:center; justify-content:center;
      border:1px solid #d7dce3; border-radius:999px;
      background:#fff; color:#222; text-decoration:none;
      font-weight:600; box-shadow:0 1px 0 rgba(0,0,0,.03);
    }
    .pager a:hover{ background:#f4f8ff; border-color:#9ab6f0 }
    .pager .is-active{ background:var(--brand-blue); color:#fff; border-color:var(--brand-blue) }
    .pager .disabled{ opacity:.4; cursor:not-allowed; pointer-events:none; }

    /* 하단 등록 버튼 영역  */
    .tbl-btns{text-align:right}
  </style>
</head>
<body>

  <!-- Top menu -->
  <div class="top-menu">
    <nav class="top-menu__inner">
      <a class="top-menu__link" href="${pageContext.request.contextPath}/">HOME</a>
      <a class="top-menu__link" href="${pageContext.request.contextPath}/sitemap.jsp">사이트맵</a>
      <a class="top-menu__link" href="${pageContext.request.contextPath}/user/logout.do">로그아웃</a>
    </nav>
  </div>

  <!-- Brand header (로고 클릭 → academic 메인) -->
  <header class="brand-bar">
    <a href="${pageContext.request.contextPath}/academic/index.do">
      <img class="brand-logo" src="${pageContext.request.contextPath}/images/admin_logo.png" alt="그린대학교 학사관리시스템 로고">
    </a>
  </header>

  <div class="layout">
    <!-- Sidebar -->
    <aside class="sidebar">
      <nav class="sidebar-menu">

        <!-- 환경설정 -->
        <div class="menu-group">
          <h3><img src="${pageContext.request.contextPath}/images/ico-admin-setting.png" alt="" class="menu-icon">환경설정</h3>
          <ul>
            <li><span>기본환경정보</span></li>
            <li><span>약관관리</span></li>
          </ul>
        </div>

        <!-- 학사운영 -->
        <div class="menu-group">
          <h3><img src="${pageContext.request.contextPath}/images/ico-admin-academic.png" alt="" class="menu-icon">학사운영</h3>
          <ul>
            <li><a href="${pageContext.request.contextPath}/academic/operation/overview.do">교육 운영 현황</a></li>
            <li><span>학년별 학생 현황</span></li>
            <li><span>학과별 학생 현황</span></li>
            <li><a href="${pageContext.request.contextPath}/academic/operation/lecture-list.do">강의 목록</a></li>
            <li><a href="${pageContext.request.contextPath}/academic/operation/lecture-register.do">강의 등록</a></li>
            <li><a href="${pageContext.request.contextPath}/academic/operation/enrollment.do">수강 현황</a></li>
          </ul>
        </div>

        <!-- 인사관리 -->
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

        <!-- 대학 및 학과 -->
        <div class="menu-group">
          <h3><img src="${pageContext.request.contextPath}/images/ico-admin-college.png" alt="" class="menu-icon">대학 및 학과</h3>
          <ul>
            <li><a href="${pageContext.request.contextPath}/departments/department-list.do">학과 목록</a></li>
            <li><a href="${pageContext.request.contextPath}/college/write.do">대학 등록</a></li>
            <li><a href="${pageContext.request.contextPath}/academic/departments/department-register.do">학과 등록</a></li>
          </ul>
        </div>

        <!-- 게시판관리 -->
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

          <!-- 검색  -->
          <form class="search-bar" method="get" action="<c:url value='/professor/list.do'/>">
            <select class="sel" name="cond">
              <option value="">검색조건</option>
              <option value="prof_id"   ${cond=='prof_id'?'selected':''}>교수번호</option>
              <option value="name"      ${cond=='name'?'selected':''}>이름</option>
              <option value="phone"     ${cond=='phone'?'selected':''}>휴대폰</option>
              <option value="email"     ${cond=='email'?'selected':''}>이메일</option>
              <option value="dept"      ${cond=='dept'?'selected':''}>학과</option>
              <option value="degree"    ${cond=='degree'?'selected':''}>학위</option>
              <option value="status"    ${cond=='status'?'selected':''}>재직여부</option>
              <option value="hire_date" ${cond=='hire_date'?'selected':''}>임용일</option>
            </select>
            <input class="inp" type="text" name="kw" value="${kw}" placeholder="키워드 입력">
            <input type="hidden" name="size" value="${size}">
            <button class="btn" type="submit">검색</button>
          </form>

          <!-- 목록 -->
          <div style="margin-top:12px">
            <table class="table">
              <colgroup>
                <col style="width:120px"><col style="width:120px">
                <col style="width:150px"><col style="width:220px">
                <col style="width:160px"><col style="width:120px">
                <col style="width:120px"><col style="width:140px">
              </colgroup>
              <thead>
                <tr>
                  <th>교수번호</th>
                  <th>이름</th>
                  <th>휴대폰</th>
                  <th>이메일</th>
                  <th>학과</th>
                  <th>학위</th>
                  <th>재직여부</th>
                  <th>임용일</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="p" items="${pr.items}">
                  <tr>
                    <td>${p.prof_id}</td>
                    <td>${p.name}</td>
                    <td>${p.phone}</td>
                    <td>${p.email}</td>
                    <td>${p.dept_name}</td>
                    <td>${p.degree}</td>
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
                  <tr><td colspan="8">데이터가 없습니다.</td></tr>
                </c:if>
              </tbody>
            </table>
          </div>

          <!-- 페이지네이션  -->
          <nav class="pager" aria-label="페이지 이동">
            <c:url var="firstUrl" value="/professor/list.do">
              <c:param name="cond" value="${cond}"/><c:param name="kw" value="${kw}"/>
              <c:param name="size" value="${size}"/><c:param name="page" value="1"/>
            </c:url>
            <c:url var="prevUrl" value="/professor/list.do">
              <c:param name="cond" value="${cond}"/><c:param name="kw" value="${kw}"/>
              <c:param name="size" value="${size}"/><c:param name="page" value="${pr.page-1}"/>
            </c:url>
            <c:url var="nextUrl" value="/professor/list.do">
              <c:param name="cond" value="${cond}"/><c:param name="kw" value="${kw}"/>
              <c:param name="size" value="${size}"/><c:param name="page" value="${pr.page+1}"/>
            </c:url>
            <c:url var="lastUrl" value="/professor/list.do">
              <c:param name="cond" value="${cond}"/><c:param name="kw" value="${kw}"/>
              <c:param name="size" value="${size}"/><c:param name="page" value="${pr.totalPages}"/>
            </c:url>

            <c:choose>
              <c:when test="${pr.hasPrev}"><a href="${firstUrl}">&lt;&lt;</a></c:when>
              <c:otherwise><span class="disabled">&lt;&lt;</span></c:otherwise>
            </c:choose>

            <c:choose>
              <c:when test="${pr.hasPrev}"><a href="${prevUrl}">&lt;</a></c:when>
              <c:otherwise><span class="disabled">&lt;</span></c:otherwise>
            </c:choose>

            <c:forEach var="pno" begin="${pr.startPage}" end="${pr.endPage}">
              <c:choose>
                <c:when test="${pno == pr.page}">
                  <span class="is-active">${pno}</span>
                </c:when>
                <c:otherwise>
                  <c:url var="pUrl" value="/professor/list.do">
                    <c:param name="cond" value="${cond}"/>
                    <c:param name="kw"   value="${kw}"/>
                    <c:param name="size" value="${size}"/>
                    <c:param name="page" value="${pno}"/>
                  </c:url>
                  <a href="${pUrl}">${pno}</a>
                </c:otherwise>
              </c:choose>
            </c:forEach>

            <c:choose>
              <c:when test="${pr.hasNext}"><a href="${nextUrl}">&gt;</a></c:when>
              <c:otherwise><span class="disabled">&gt;</span></c:otherwise>
            </c:choose>

            <c:choose>
              <c:when test="${pr.hasNext}"><a href="${lastUrl}">&gt;&gt;</a></c:when>
              <c:otherwise><span class="disabled">&gt;&gt;</span></c:otherwise>
            </c:choose>
          </nav>

          <div class="tbl-btns">
            <a href="<c:url value='/professor/write.do'/>"><button class="btn" type="button">등록</button></a>
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
