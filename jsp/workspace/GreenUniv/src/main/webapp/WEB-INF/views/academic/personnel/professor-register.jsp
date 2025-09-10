<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>인사관리 - 교수 등록</title>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<style>
/* ===== Design tokens (공통) ===== */
:root{
  --brand-blue:#00518C; --brand-dark:#1F2838;
  --text:#222; --muted:#333;
  --sidebar-bg:#F5F6F7; --card:#FFF;
  --line:#C0C0C0; --thead:#F6F8FB; --accent:#1F5E95;
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
/* 링크/스팬 타이포 통일 */
.sidebar-menu li a,.sidebar-menu li span{
  display:flex;align-items:center;gap:10px;width:100%;
  color:#333;font-weight:500;text-decoration:none;
}
.sidebar-menu li a:hover{color:var(--brand-blue)}
.sidebar-menu li span{cursor:default}

/* Page */
.main-area{flex:1}
.page{background:var(--card);border:1px solid var(--line)}
.page__body{padding:20px}
.page__header{height:46px;border-bottom:1px solid var(--line);padding:0 16px;display:flex;align-items:center;justify-content:space-between}
.page__title{font-size:16px;font-weight:700;color:#222}
.page__path{font-size:12px;display:flex;align-items:center;gap:6px;white-space:nowrap}
.page__path .path__dim{color:#666}
.page__path strong{color:#145074;font-weight:500}
.page__path .path__sep svg{width:12px;height:6px;display:block}

/* Section title */
.section-title{display:flex;align-items:center;gap:8px;font-size:16px;font-weight:600;color:#145074;margin:0 0 10px}
.section-title::before{content:"";width:6px;height:20px;background:var(--accent);border-radius:1px}

/* Inputs */
.inp,.sel,.ta{width:100%;height:36px;padding:0 10px;font-size:14px;color:#333;border:1px solid #cfd6df;background:#fff;outline:none}
.inp:focus,.sel:focus,.ta:focus{border-color:#A5B4C5}
.ta{height:120px;padding:10px;resize:vertical}
.sel{-webkit-appearance:none;-moz-appearance:none;appearance:none;
  background-image:
    linear-gradient(45deg, transparent 50%, #666 50%),
    linear-gradient(135deg, #666 50%, transparent 50%);
  background-position: calc(100% - 16px) 16px, calc(100% - 10px) 16px;
  background-size:6px 6px,6px 6px;background-repeat:no-repeat}

/* Utils */
.hstack{display:flex;align-items:center;gap:8px}
.w180{width:180px !important;max-width:180px !important}
.help{font-size:12px;color:#C3482B}
.section-actions{display:flex;justify-content:flex-end;margin-top:12px}
.btn-primary{height:36px;padding:0 22px;border:0;cursor:pointer;background:#2d5078;color:#fff;font-size:14px;border-radius:4px}

/* ===== 교수 등록 전용: 기본정보 표 ===== */
.pf-grid{width:100%;border-collapse:collapse;table-layout:fixed;font-size:14px;color:#333;border:1px solid #e5e5e5}
.pf-grid th,.pf-grid td{border:1px solid #e5e5e5;padding:10px 12px;background:#fff;vertical-align:middle;line-height:1.3}
.pf-grid th{width:110px;text-align:center;font-weight:600;background:#f7f7f7}
.pf-grid th.photo{background:#fff;text-align:center}
.photo-cell{vertical-align:middle;text-align:center;background:#fff}
.pf-avatar{width:84px;height:84px;border-radius:50%;background:#eef1f5 url('${ctx}/images/icon-avatar.png') no-repeat center/40px;margin:0 auto}

.pf-field .inp,.pf-field .sel{width:260px;max-width:260px;height:32px;padding:0 8px;border:1px solid #cfd6df;box-sizing:border-box}
.pf-field .sel{-webkit-appearance:none;-moz-appearance:none;appearance:none}
.note-red{color:#c8483c;font-size:12px}

/* 주소 3줄 */
.addr-wrap{display:grid;grid-template-columns:1fr;gap:8px}
.addr-top{display:flex;gap:8px;align-items:center}
.addr-top .inp{width:180px}
.btn-zip{height:32px;padding:0 12px;border:1px solid #cfd6df;background:#eee;cursor:pointer}

/* 학적정보 표(우측 입력 폭 통일) */
.form-grid.edu{width:100%;border-collapse:separate;border-spacing:0;table-layout:fixed;font-size:14px;color:#333;border-top:1px solid #D8DEE8}
.form-grid.edu th,.form-grid.edu td{height:44px;background:#fff;border-bottom:1px solid #E1E6EE;border-right:1px solid #E1E6EE;padding:8px 12px;vertical-align:middle}
.form-grid.edu tr>*:first-child{border-left:1px solid #D8DEE8}
.form-grid.edu th{width:150px;background:#FAFBFD;text-align:center;font-weight:400}
.form-grid.edu td .inp,.form-grid.edu td .sel{width:260px;max-width:260px;height:32px;padding:0 10px;border:1px solid #cfd6df;box-sizing:border-box}
.form-grid.edu td .w180{width:180px;max-width:180px}
.form-grid.edu .hstack .sel{width:180px}
.form-grid.edu td .sel{-webkit-appearance:none;-moz-appearance:none;appearance:none;
  background-image:
    linear-gradient(45deg, transparent 50%, #666 50%),
    linear-gradient(135deg, #666 50%, transparent 50%);
  background-position: calc(100% - 16px) 16px, calc(100% - 10px) 16px;
  background-size:6px 6px,6px 6px;background-repeat:no-repeat}

/* Footer */
.site-footer{background:#19202D;color:#cfd3db;height:60px;display:flex;align-items:center}
.site-footer .footer-inner{width:min(1400px,96vw);margin:0 auto;padding:0 20px;font-size:12px;letter-spacing:.02em}
</style>

<!-- 카카오 우편번호 -->
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
          <h3 class="page__title">교수 등록</h3>
          <div class="page__path">
            <span class="path__dim">인사관리</span>
            <span class="path__sep">
              <svg viewBox="0 0 12 6" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                <path d="M1 1l5 4 5-4" fill="none" stroke="#145074" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </span>
            <strong>교수 등록</strong>
          </div>
        </div>

        <div class="page__body">
          <form method="post" action="${ctx}/professor/write.do" autocomplete="off">
            <!-- 기본정보 -->
            <h4 class="section-title">기본정보 입력</h4>
            <table class="pf-grid" role="presentation">
              <colgroup>
                <col style="width:120px"><col style="width:110px"><col><col style="width:110px"><col>
              </colgroup>
              <tbody>
                <tr>
                  <td class="photo-cell" rowspan="5">
                    <div class="pf-avatar" aria-label="교수사진"></div>
                  </td>

                  <th class="label" scope="row">교수번호</th>
                  <td class="pf-field">
                    <span class="note-red">연도 + 학과 코드 + 순번 조합 자동생성</span>
                    <!-- 수동입력 필요 시
                    <input class="inp" type="number" name="prof_id">
                    -->
                  </td>

                  <th class="label" scope="row">주민등록번호</th>
                  <td class="pf-field">
                    <input class="inp" type="text" name="resident_number" placeholder="- 포함 14자리 입력" pattern="\d{6}-\d{7}">
                  </td>
                </tr>

                <tr>
                  <th class="label" scope="row">이름</th>
                  <td class="pf-field"><input class="inp" type="text" name="name" placeholder="교수 이름 입력" required></td>

                  <th class="label" scope="row">영문명</th>
                  <td class="pf-field"><input class="inp" type="text" name="e_name" placeholder="여권 등과 동일한 영문 이름"></td>
                </tr>

                <tr>
                  <th class="label" scope="row">성별</th>
                  <td class="pf-field">
                    <label style="margin-right:14px"><input type="radio" name="gender" value="M" required> 남</label>
                    <label><input type="radio" name="gender" value="F"> 여</label>
                  </td>

                  <th class="label" scope="row">국적</th>
                  <td class="pf-field">
                    <select class="sel" name="division" required>
                      <option value="">선택</option>
                      <option value="KOR">대한민국</option>
                      <option value="JPN">일본</option>
                      <option value="CHN">중국</option>
                      <option value="SGP">싱가포르</option>
                      <option value="USA">미국</option>
                      <option value="AUS">호주</option>
                    </select>
                  </td>
                </tr>

                <tr>
                  <th class="label" scope="row">휴대폰</th>
                  <td class="pf-field"><input class="inp" type="text" name="phone" placeholder="휴대폰 번호 입력"></td>

                  <th class="label" scope="row">이메일</th>
                  <td class="pf-field"><input class="inp" type="email" name="email" placeholder="이메일 입력"></td>
                </tr>

                <tr>
                  <th class="label" scope="row">주소</th>
                  <td class="pf-field" colspan="3">
                    <div class="addr-wrap">
                      <div class="addr-top">
                        <input class="inp" type="text" id="zip" name="zip" placeholder="우편번호 선택">
                        <button type="button" class="btn-zip" onclick="openPostcode()">검색</button>
                      </div>
                      <input class="inp" type="text" id="addr1" name="addr1" placeholder="기본주소 선택">
                      <input class="inp" type="text" id="addr2" name="addr2" placeholder="상세주소 입력">
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>

            <!-- 학적정보 -->
            <h4 class="section-title" style="margin-top:18px">학적정보 입력</h4>
            <table class="form-grid edu" role="presentation">
              <colgroup><col style="width:150px"><col><col style="width:150px"><col></colgroup>
              <tbody>
                <tr>
                  <th scope="row">졸업대학</th>
                  <td><input class="inp" type="text" name="graduated_univ" placeholder="대학교 이름 입력"></td>
                  <th scope="row">학문 분야(전공)</th>
                  <td><input class="inp" type="text" name="major_field" placeholder="전공 입력"></td>
                </tr>
                <tr>
                  <th scope="row">졸업일</th>
                  <td>
                    <input class="inp w180" type="text" name="graduation_date"
                           placeholder="mm/dd/yyyy"
                           onfocus="this.type='date'" onblur="if(!this.value) this.type='text'">
                  </td>
                  <th scope="row">학위</th>
                  <td>
                    <select class="sel w180" name="degree">
                      <option value="">선택</option>
                      <option value="학사">학사</option>
                      <option value="석사">석사</option>
                      <option value="박사">박사</option>
                    </select>
                  </td>
                </tr>
                <tr>
                  <th scope="row">담당학과</th>
                  <td>
                    <div class="hstack">
                      <select class="sel" name="college_name">
                        <option value="">인문사회대학</option>
                        <option value="자연과학대학">자연과학대학</option>
                        <option value="공과대학">공과대학</option>
                      </select>
                      <select class="sel" name="dept_id" required>
                        <option value="">학과 선택</option>
                        <option value="101">국문학과</option>
                        <option value="102">영어영문학과</option>
                        <option value="201">생물학과</option>
                        <option value="202">물리학과</option>
                        <option value="301">기계공학과</option>
                        <option value="302">컴퓨터공학과</option>
                      </select>
                    </div>
                  </td>
                  <th scope="row">임용일</th>
                  <td>
                    <input class="inp w180" type="text" name="hire_date"
                           placeholder="mm/dd/yyyy"
                           onfocus="this.type='date'" onblur="if(!this.value) this.type='text'">
                  </td>
                </tr>
              </tbody>
            </table>

            <div class="section-actions">
              <button type="submit" class="btn-primary">등록</button>
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
