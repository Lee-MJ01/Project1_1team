<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>학사관리시스템_대학 및 학과_등록</title>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
<style>
/* ===== Design tokens (전 페이지 공통) ===== */
:root{
  --brand-blue:#00518C; --brand-dark:#1F2838;
  --text:#222; --muted:#333;
  --sidebar-bg:#F5F6F7; --card:#FFF;
  --line:#C0C0C0; --thead:#F6F8FB; --row:#E9EDF3; --accent:#1F5E95;
  --sb-icon:18px; --sb-gap:8px; --sb-indent:calc(var(--sb-icon) + var(--sb-gap));
}

*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Noto Sans KR', Arial, system-ui, sans-serif;color:var(--text);background:#f9f9f9;min-height:100vh;display:flex;flex-direction:column}

/* 상단 바 */
.top-menu{background:var(--brand-blue);height:30px;display:flex;align-items:center}
.top-menu__inner{width:100%;display:flex;justify-content:flex-end;align-items:center;padding:0 40px}
.top-menu__link{color:#fff;font-size:12px;line-height:20px;text-decoration:none;position:relative;padding:0 10px}
.top-menu__link + .top-menu__link::before{content:"";position:absolute;left:0;top:4px;width:1px;height:11px;background:rgba(255,255,255,.3)}

/* 브랜드 바 */
.brand-bar{background:var(--brand-dark);height:90px;border-bottom:1px solid #dcdcdc;position:relative}
.brand-logo{position:absolute;left:260px;top:16px;width:352px;height:52px;display:block;object-fit:contain}
@media (max-width:1200px){.brand-logo{left:24px}}

/* 레이아웃 */
.layout{display:flex;align-items:flex-start;width:min(1400px,96vw);margin:22px auto 56px;gap:20px;flex:1}

/* 사이드바 (공통) */
.sidebar{flex:0 0 270px;min-height:840px;border-right:1px solid var(--line);background:var(--sidebar-bg)}
.sidebar-menu{padding:20px 16px;font-size:14px;color:var(--muted)}
.sidebar-menu h3{display:flex;align-items:center;gap:8px;margin:20px 0 10px;font-size:16px;font-weight:700;color:#111}
.menu-icon{width:18px;height:18px;flex:0 0 18px}
.sidebar-menu .menu-group>ul{list-style:none;margin:0 0 18px 0;padding:0;margin-left:var(--sb-indent)}
.sidebar-menu li{display:flex;align-items:center;gap:10px;margin:8px 0;line-height:1.7}
.sidebar-menu li::before{content:"·";font-size:20px;line-height:1;color:#7f8790}
.sidebar-menu a,.sidebar-menu span{text-decoration:none;color:#333;font-weight:500;cursor:pointer}
.sidebar-menu a:hover,.sidebar-menu span:hover{color:var(--brand-blue)}
/* 본문 카드 (강의 등록과 동일) */
.main-area{flex:1}
.page{background:var(--card);border:1px solid var(--line)}
.page__body{padding:16px}

/* 페이지 헤더(강의 등록과 동일) */
.page__header{height:46px;border-bottom:1px solid var(--line);padding:0 16px;display:flex;align-items:center;justify-content:space-between}
.page__title{font-size:16px;font-weight:700;color:#222}
.page__path{font-size:12px;display:flex;align-items:center;gap:6px;white-space:nowrap}
.page__path .path__dim{color:#666}
.page__path strong{color:#145074;font-weight:500}
.page__path .path__sep svg{width:12px;height:6px;display:block}
.page__path .path__sep path{stroke:#145074}

/* 섹션 타이틀 (강의 등록과 동일) */
.section-title{display:flex;align-items:center;gap:8px;font-size:16px;font-weight:600;color:#145074;margin:0 0 10px 0}
.section-title::before{content:"";width:6px;height:20px;background:var(--accent);border-radius:1px}

/* 폼 테이블 (강의 등록과 동일) */
.form-grid{width:100%;border-collapse:separate;border-spacing:0;table-layout:fixed;font-size:14px;color:#333;border-top:1px solid #D8DEE8}
.form-grid th,.form-grid td{height:44px;background:#fff;border-bottom:1px solid #E1E6EE;border-right:1px solid #E1E6EE;padding:8px 12px;vertical-align:middle}
.form-grid tr>*:first-child{border-left:1px solid #D8DEE8}
.form-grid th{width:150px;background:#FAFBFD;text-align:center !important;font-weight:400}

/* 입력 UI (강의 등록과 동일) */
.inp,.sel,.ta{width:100%;height:36px;padding:0 10px;font-size:14px;color:#333;border:1px solid #cfd6df;background:#fff;outline:none}
.inp:focus,.sel:focus,.ta:focus{border-color:#A5B4C5}
.ta{height:120px;padding:10px;resize:vertical}
.sel{-webkit-appearance:none;-moz-appearance:none;appearance:none;background-image:
  linear-gradient(45deg, transparent 50%, #666 50%),
  linear-gradient(135deg, #666 50%, transparent 50%);
background-position: calc(100% - 16px) 16px, calc(100% - 10px) 16px;background-size:6px 6px,6px 6px;background-repeat:no-repeat}

.hstack{display:flex;align-items:center;gap:8px}
.w180{width:180px !important;max-width:180px !important}
.help{font-size:12px;color:#C3482B}
.section-actions{display:flex;justify-content:flex-end;margin-top:12px}
.btn-primary{height:36px;padding:0 22px;border:0;cursor:pointer;background:#2d5078;color:#fff;font-size:14px}

/* Footer (강의 등록과 동일) */
.site-footer{background:#19202D;color:#cfd3db;height:60px;display:flex;align-items:center}
.site-footer .footer-inner{width:min(1400px,96vw);margin:0 auto;padding:0 20px;font-size:12px;letter-spacing:.02em}
</style>
</head>
<body>

  <!-- 상단 파란 메뉴 바: 강의 등록과 동일 -->
  <div class="top-menu">
    <nav class="top-menu__inner">
      <a class="top-menu__link" href="/index.html">HOME</a>
      <a class="top-menu__link" href="#">사이트맵</a>
      <a class="top-menu__link" href="#">로그아웃</a>
    </nav>
  </div>

   <!-- 상단 파란 메뉴 바 -->
  <div class="top-menu">
    <nav class="top-menu__inner">
      <a class="top-menu__link" href="/index.html">HOME</a>
      <a class="top-menu__link" href="#">사이트맵</a>
      <a class="top-menu__link" href="#">로그아웃</a>
    </nav>
  </div>

  <!-- 다크 로고 바 -->
  <header class="brand-bar">
    <a href="../index.html">
      <img class="brand-logo" src="../../images/admin_logo.png" alt="그린대학교 학사관리시스템 로고">
    </a>
  </header>

  <div class="layout">
    <!-- 좌측 사이드  -->
    <aside class="sidebar">
      <nav class="sidebar-menu">
        <div class="menu-group">
          <h3><img src="../../images/ico-admin-setting.png" alt="" class="menu-icon">환경설정</h3>
          <ul>
            <li><span>기본환경정보</span></li>
            <li><span>약관관리</span></li>
          </ul>
        </div>

        <div class="menu-group">
          <h3><img src="../../images/ico-admin-academic.png" alt="" class="menu-icon">학사운영</h3>
          <ul>
            <li><a href="/academic/operation/overview.html">교육 운영 현황</a></li>
            <li><a href="/academic/operation/overview.html#by-grade">학년별 학생 현황</a></li>
            <li><a href="/academic/operation/overview.html#by-major">학과별 학생 현황</a></li>
            <li><a href="/academic/operation/lecture-list.html">강의 목록</a></li>
            <li><a href="/academic/operation/lecture-register.html">강의 등록</a></li>
            <li><a href="/academic/operation/enrollment.html">수강 현황</a></li>
          </ul>
        </div>

        <div class="menu-group">
          <h3><img src="../../images/ico-admin-persons.png" alt="" class="menu-icon">인사관리</h3>
          <ul>
            <li><a href="/personnel/students.html">학생 목록</a></li>
            <li><a href="/personnel/student-register.html">학생 등록</a></li>
            <li><a href="/personnel/professors.html">교수 목록</a></li>
            <li><a href="/personnel/professor-register.html">교수 등록</a></li>
            <li><span>임직원 목록 및 등록</span></li>
          </ul>
        </div>

        <div class="menu-group">
          <h3><img src="../../images/ico-admin-college.png" alt="" class="menu-icon">대학 및 학과</h3>
          <ul>
            <li><a href="/academic/departments/department-list.html">대학 및 학과 목록</a></li>
            <li><a href="/academic/departments/department-register.html">대학 및 학과 등록</a></li>
          </ul>
        </div>

        <div class="menu-group">
          <h3><img src="../../images/ico-admin-board.png" alt="" class="menu-icon">게시판관리</h3>
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

    <!-- 본문 -->
    <main class="main-area">
      <section class="page">
        <div class="page__header">
          <h3 class="page__title">대학 및 학과 등록</h3>
          <div class="page__path">
            <span class="path__dim">대학 및 학과</span>
            <span class="path__sep">
              <svg viewBox="0 0 12 6" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                <path d="M1 1l5 4 5-4" fill="none" stroke="#145074" stroke-width="1.2" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
            </span>
            <strong>대학 및 학과 등록</strong>
          </div>
        </div>

        <div class="page__body">
          <!-- Ⅰ. 대학 정보 입력 -->
          <h4 class="section-title">대학 정보 입력</h4>
          <form method="post" action="/academic/departments/college-write.do" enctype="multipart/form-data" autocomplete="off">
            <table class="form-grid" role="presentation">
              <colgroup><col style="width:150px"><col><col style="width:150px"><col></colgroup>
              <tbody>
                <tr>
                  <th scope="row">대학명</th>
                  <td colspan="3"><input class="inp" type="text" name="college_name" placeholder="예) 인문사회대학" required></td>
                </tr>
                <tr>
                  <th scope="row">대학 영문명</th>
                  <td colspan="3"><input class="inp" type="text" name="college_name_en" placeholder="예) Humanities And Social Sciences"></td>
                </tr>
                <tr>
                  <th scope="row">대학 소개 제목</th>
                  <td colspan="3"><input class="inp" type="text" name="intro_title" placeholder="대학 소개 헤드라인"></td>
                </tr>
                <tr>
                  <th scope="row">대학 소개</th>
                  <td colspan="3"><textarea class="ta" name="intro_body" placeholder="대학 소개 내용 입력"></textarea></td>
                </tr>
                <tr>
                  <th scope="row">대표 이미지</th>
                  <td colspan="3">
                    <input type="file" name="thumb" accept="image/*">
                    <span class="help">권장 썸네일 320×240</span>
                  </td>
                </tr>
              </tbody>
            </table>
            <div class="section-actions">
              <button type="submit" class="btn-primary">등록</button>
            </div>
          </form>

          <!-- Ⅱ. 학과 정보 입력 -->
          <h4 class="section-title">학과 정보 입력</h4>
          <form method="post" action="/academic/departments/department-write.do" autocomplete="off">
            <table class="form-grid" role="presentation">
              <colgroup><col style="width:150px"><col><col style="width:150px"><col></colgroup>
              <tbody>
                <tr>
                  <th scope="row">학과번호</th>
                  <td>
                    <input class="inp w180" type="text" name="dept_id" placeholder="자동생성시 비워두기">
                    <span class="help">고유 3자리 순차 자동생성</span>
                  </td>
                  <th scope="row">단과대학</th>
                  <td>
                    <select class="sel w180" name="college_id" required>
                      <option value="">선택</option>
                      <option value="100">인문사회대학</option>
                      <option value="200">자연과학대학</option>
                      <option value="300">공과대학</option>
                    </select>
                  </td>
                </tr>

                <tr>
                  <th scope="row">입학정원</th>
                  <td><input class="inp w180" type="number" min="0" name="quota" placeholder="정원 입력"></td>
                  <th scope="row">영문명</th>
                  <td><input class="inp" type="text" name="dept_name_en" placeholder="학과 공식 영문 이름"></td>
                </tr>

                <tr>
                  <th scope="row">설립일</th>
                  <td>
                    <input class="inp w180" type="text" name="founded"
                           placeholder="mm/dd/yyyy"
                           onfocus="this.type='date'" onblur="if(!this.value) this.type='text'">
                  </td>
                  <th scope="row">학과 사무실</th>
                  <td><input class="inp" type="text" name="office" placeholder="예) 인문관 3층 305호"></td>
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
