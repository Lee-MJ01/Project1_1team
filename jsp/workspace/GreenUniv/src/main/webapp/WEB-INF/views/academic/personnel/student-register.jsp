<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>인사관리 - 학생 등록</title>

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

    /* Sidebar (공통) */
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
    .page__header{height:46px;border-bottom:1px solid #cfd6df;padding:0 16px;display:flex;align-items:center;justify-content:space-between}
    .page__title{font-size:16px;font-weight:700;color:#222}
    .page__path{font-size:12px;display:flex;align-items:center;gap:6px;white-space:nowrap}
    .page__path .path__dim{color:#666}
    .page__path strong{color:#145074;font-weight:500}
    .page__path .path__sep svg{width:12px;height:6px;display:block}
    .page__path .path__sep path{stroke:#145074}

    /* Section */
    .section{border:1px solid #ddd;border-radius:8px;padding:16px;margin-top:14px;background:#fff}
    .section-title{display:flex;align-items:center;gap:8px;font-size:16px;font-weight:600;color:#145074;margin:0 0 12px}
    .section-title::before{content:"";width:6px;height:20px;background:var(--accent);border-radius:1px}

    /* Forms */
    .grid{display:grid;grid-template-columns:140px 1fr 140px 1fr;gap:10px 14px;align-items:center}
    .inp,.sel,.ta{height:34px;padding:0 8px;border:1px solid #ccc;background:#fff}
    .ta{height:72px;resize:vertical}
    .addr-wrap{display:grid;grid-template-columns:1fr;gap:8px}
    .addr-top{display:flex;gap:8px;align-items:center}
    .btn{height:34px;padding:0 12px;border:1px solid #ccc;background:#eee;cursor:pointer}
    .btns{display:flex;gap:8px;justify-content:flex-end;margin-top:16px}

    /* 학적 정보 표 */
    .reg-table{width:100%;border-collapse:collapse;table-layout:fixed;background:#fff}
    .reg-table th,.reg-table td{border:1px solid #e5e5e5;padding:10px}
    .reg-table th{width:160px;background:#fafafa;text-align:left;font-weight:600}
    .td-inline{display:flex;gap:8px}
    .td-inline>*{flex:1}
    .tbl-btns{padding-top:12px;text-align:right}
    .tbl-btns .btn{height:36px;min-width:92px}

    /* Flash message */
    .msg{margin:12px 0 0;padding:10px;border-radius:6px}
    .msg.ok{background:#f0fff4;border:1px solid #9ae6b4}
    .msg.err{background:#fff5f5;border:1px solid #feb2b2}

    /* Footer */
    .site-footer{background:#19202D;color:#cfd3db;height:60px;display:flex;align-items:center}
    .site-footer .footer-inner{width:min(1400px,96vw);margin:0 auto;padding:0 20px;font-size:12px;letter-spacing:.02em}
  </style>

  <!-- Kakao 주소검색 -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
    function openPostcode(){
      new daum.Postcode({
        oncomplete: function(data){
          document.getElementById('zip').value   = data.zonecode;
          document.getElementById('addr1').value = data.roadAddress || data.jibunAddress;
          document.getElementById('addr2').focus();
        }
      }).open();
    }
  </script>
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

        <!-- Header -->
        <div class="page__header">
          <h3 class="page__title">학생 등록</h3>
          <div class="page__path">
            <span class="path__dim">인사관리</span>
            <span class="path__sep">
              <svg viewBox="0 0 12 6" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                <path d="M1 1l5 4 5-4" fill="none" stroke="#145074" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </span>
            <strong>학생 등록</strong>
          </div>
        </div>

        <div class="page__body">

          <!-- 처리 메시지 -->
          <c:if test="${not empty param.code}">
            <div class="msg ${param.code eq 'SUCCESS' ? 'ok' : 'err'}">
              처리 결과 코드: <strong>${param.code}</strong>
            </div>
          </c:if>

          <!-- 등록 폼 -->
          <form method="post" action="${ctx}/student/write.do" autocomplete="off">

            <!-- 기본 정보 -->
            <section class="section">
              <h4 class="section-title">기본 정보 입력</h4>
              <div class="grid">
                <label>학번</label>
                <input class="inp" type="number" name="std_id" placeholder="예) 202500101" required />

                <label>주민등록번호</label>
                <input class="inp" type="text" name="resident_number" placeholder="900103-1234567" pattern="\\d{6}-\\d{7}" required />

                <label>이름</label>
                <input class="inp" type="text" name="name" placeholder="학생 이름 입력" required />

                <label>영문명</label>
                <input class="inp" type="text" name="e_name" placeholder="여권 등과 동일한 영문 이름" />

                <label>성별</label>
                <div>
                  <label><input type="radio" name="gender" value="M" required /> 남</label>
                  &nbsp;&nbsp;
                  <label><input type="radio" name="gender" value="F" /> 여</label>
                </div>

                <label>구분</label>
                <select class="sel" name="division" required>
                  <option value="">선택</option>
                  <option value="KOR">내국인</option>
                  <option value="FOR">외국인</option>
                </select>

                <label>휴대폰</label>
                <input class="inp" type="text" name="phone" placeholder="010-1234-5678" />

                <label>이메일</label>
                <input class="inp" type="email" name="email" placeholder="name@example.com" />

                <!-- 주소 -->
                <label>주소</label>
                <div class="addr-wrap" style="grid-column:2 / span 3">
                  <div class="addr-top">
                    <input class="inp" type="text" name="zip" id="zip" placeholder="우편번호 선택">
                    <button type="button" class="btn" onclick="openPostcode()">검색</button>
                  </div>
                  <input class="inp" type="text" name="addr1" id="addr1" placeholder="기본주소 선택">
                  <input class="inp" type="text" name="addr2" id="addr2" placeholder="상세주소 입력">
                </div>
              </div>
            </section>

            <!-- 학적 정보 -->
            <section class="section">
              <h4 class="section-title">학적정보 입력</h4>
              <table class="reg-table">
                <tr>
                  <th>입학년도</th>
                  <td>
                    <select class="sel" name="entryyear" required>
                      <option value="">선택</option>
                      <c:forEach var="y" begin="2015" end="2025">
                        <option value="${y}">${y}</option>
                      </c:forEach>
                    </select>
                  </td>
                  <th>졸업년도</th>
                  <td>
                    <select class="sel" name="graduationyear">
                      <option value="">선택</option>
                      <c:forEach var="y" begin="2019" end="2029">
                        <option value="${y}">${y}</option>
                      </c:forEach>
                    </select>
                  </td>
                </tr>

                <tr>
                  <th>입학구분</th>
                  <td>
                    <select class="sel" name="admission_type">
                      <option value="수시">수시</option>
                      <option value="정시">정시</option>
                      <option value="편입학">편입학</option>
                    </select>
                  </td>

                  <th>입학학과(전공)</th>
                  <td>
                    <div class="td-inline">
                      <select class="sel" name="college_name">
                        <option value="">인문사회대학</option>
                        <option value="자연과학대학">자연과학대학</option>
                        <option value="공과대학">공과대학</option>
                      </select>
                      <select class="sel" name="dept_id" required>
                        <option value="">선택</option>
                        <option value="101">국문학과</option>
                        <option value="102">영어영문학과</option>
                        <option value="201">생물학과</option>
                        <option value="202">물리학과</option>
                        <option value="301">기계공학과</option>
                        <option value="302">컴퓨터공학과</option>
                      </select>
                    </div>
                  </td>
                </tr>

                <tr>
                  <th>입학학년/학기</th>
                  <td>
                    <div class="td-inline">
                      <select class="sel" name="entrygrade" required>
                        <option value="1">1학년</option>
                        <option value="2">2학년</option>
                        <option value="3">3학년</option>
                        <option value="4">4학년</option>
                      </select>
                      <select class="sel" name="entryterm" required>
                        <option value="1">1학기</option>
                        <option value="2">2학기</option>
                      </select>
                    </div>
                  </td>

                  <th>지도교수</th>
                  <td>
                    <select class="sel" name="advisor">
                      <option value="">선택</option>
                      <option value="김국어">김국어</option>
                      <option value="김영어">김영어</option>
                      <option value="김생물">김생물</option>
                      <option value="김물리">김물리</option>
                      <option value="김기계">김기계</option>
                      <option value="김컴공">김컴공</option>
                    </select>
                  </td>
                </tr>
              </table>

              <input type="hidden" name="status" value="재학중" />
              <div class="tbl-btns">
                <button class="btn" type="submit">등록</button>
              </div>
            </section>

            <!-- 하단 버튼 -->
            <div class="btns">
              <a href="${ctx}/student/list.do"><button class="btn" type="button">목록</button></a>
              <button class="btn" type="reset">초기화</button>
              <button class="btn" type="submit">등록</button>
            </div>

          </form>
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
