<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>student-register</title>

  <style>
    body{margin:0}
    .header{height:20%}
    .title{min-height:70%;display:flex;gap:20px}
    .header_top{height:20%;background:#00518C;text-align:right;padding-right:30px}
    .header_top a,.header_top span{color:#fff}
    .header_top span{margin:0 5px}
    .header_bottom{height:80%;background:#1F2838;padding-left:30px;display:flex;align-items:center}
    .header_bottom img{height:38px}

    .sideBar{width:15%;margin-left:50px;background:#eaeaea;padding:10px}
    .sideBar img{width:20px;margin:10px 5px 0 0}
    .stylenone{list-style:none}
    .styletwo a{color:#000;text-decoration:none}

    .menu{width:75%}
    .menu_top{display:flex;justify-content:space-between;align-items:center}
    .menu_top img{margin:0 2px 2px 5px}
    .stdlist{color:#145074}

    .section_all{display:flex;flex-direction:column;gap:24px}
    .section,.section2{border:1px solid #ddd;border-radius:8px;padding:16px}
    .section h4,.section2 h4{margin:0 0 12px 0;display:flex;align-items:center;gap:8px}

    .form-grid{
      display:grid;
      grid-template-columns:140px 1fr 140px 1fr; /* 라벨-입력 x 2열 */
      gap:10px 14px;
      align-items:center
    }
    .form-grid input[type="text"],
    .form-grid input[type="number"],
    .form-grid input[type="email"],
    .form-grid select,
    .form-grid textarea{
      height:34px;padding:0 8px;border:1px solid #ccc;box-sizing:border-box
    }
    .form-grid textarea{height:72px;resize:vertical}

    /* 주소 3칸 UI */
    .col-span-3{ grid-column: 2 / span 3; } /* 라벨 옆 3칸 전체 차지 */
    .addr-wrap{ display:grid; grid-template-columns:1fr; gap:8px; }
    .addr-top{ display:flex; gap:8px; align-items:center; }
    .addr-top input[type="text"]{ width:180px; }
    .addr-btn{ height:34px; padding:0 12px; border:1px solid #ccc; background:#eee; cursor:pointer }

    .btns{display:flex;gap:8px;justify-content:flex-end;margin-top:16px}
    .btns button{min-width:92px;height:36px;border:1px solid #ccc;background:#eee;cursor:pointer}

    footer{margin-top:24px;background:#1F2838;color:#fff;padding:16px 30px}
    .msg{margin:10px 0;padding:10px;border-radius:6px}
    .msg.ok{background:#f0fff4;border:1px solid #9ae6b4}
    .msg.err{background:#fff5f5;border:1px solid #feb2b2}
    
    /* ── 학적정보 입력: 표 레이아웃 ── */
   .reg-table{width:100%; border-collapse:collapse; table-layout:fixed; margin-top:6px;}
   .reg-table th, .reg-table td{border:1px solid #e5e5e5; padding:10px;}
   .reg-table th{width:160px; background:#fafafa; text-align:left; font-weight:600;}
   .reg-table td select, .reg-table td input{
     width:100%; height:34px; box-sizing:border-box; border:1px solid #ccc; padding:0 8px;
   }
   .td-inline{display:flex; gap:8px;}
   .td-inline>*{flex:1;}
   .tbl-btns{padding-top:12px; text-align:right;}
   .tbl-btns button{min-width:92px; height:36px; border:1px solid #ccc; background:#eee; cursor:pointer;}
       
   /* ── 교수 등록 기본정보 테이블 ─────────────────────────────── */
.pf-grid{width:100%;border-collapse:collapse;table-layout:fixed;margin-top:4px}
.pf-grid th,.pf-grid td{border:1px solid #e5e5e5;padding:8px 10px;background:#fff;vertical-align:middle}
.pf-grid th{background:#f7f7f7;font-weight:600;text-align:left}
.pf-grid th.photo{background:#fff;text-align:center}

/* 사진 아바타 */
.pf-avatar{width:68px;height:68px;border-radius:50%;background:#eef1f5 url('${ctx}/images/icon-avatar.png') no-repeat center/36px;margin:6px auto 10px}
.pf-photo-label{display:block;margin-top:6px;color:#666;font-size:12px}

/* 입력 폭(좌/우 동일) */
.pf-field .inp,.pf-field .sel{width:260px;max-width:260px;height:32px;padding:0 8px;border:1px solid #cfd6df;box-sizing:border-box}
.pf-field .sel{-webkit-appearance:none;-moz-appearance:none;appearance:none}

/* 붉은 안내문 */
.note-red{color:#c8483c;font-size:12px}

/* 주소 3줄 */
.addr-wrap{display:grid;grid-template-columns:1fr;gap:8px}
.addr-top{display:flex;gap:8px;align-items:center}
.addr-top .inp{width:180px}
.btn-zip{height:32px;padding:0 12px;border:1px solid #cfd6df;background:#eee;cursor:pointer}

/* 반지름/여백 느낌 보정(선택) */
.pf-grid th,.pf-grid td{line-height:1.3}
       
  </style>

  <!--  카카오 우편번호 서비스 -->
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
  <!-- 상단 -->
  <div class="header">
    <div class="header_top">
      <a href="${ctx}/">home</a><span>|</span>
      <a href="#">사이트맵</a><span>|</span>
      <a href="#">로그인</a>
    </div>
    <div class="header_bottom">
      <img src="${ctx}/images/admin_logo.png" alt="logo">
    </div>
  </div>

  <div class="title">
    <!-- 사이드바 -->
    <div class="sideBar">
      <ul class="stylenone">
        <li><img src="${ctx}/images/ico-admin-setting.png">환경설정</li>
        <ul class="styletwo">
          <li><a href="#">기본환경정보</a></li>
          <li><a href="#">약관관리</a></li>
        </ul>
        <li><img src="${ctx}/images/ico-admin-academic.png">학사운영</li>
        <ul class="styletwo">
          <li><a href="#">교육 운영 현황</a></li>
          <li><a href="#">학년별 학생현황</a></li>
          <li><a href="#">강의 목록</a></li>
          <li><a href="#">강의 등록</a></li>
          <li><a href="#">수강 현황</a></li>
        </ul>
        <li><img src="${ctx}/images/ico-admin-persons.png">인사관리</li>
        <ul class="styletwo">
          <li><a href="${ctx}/student/list.do">학생 목록 및 등록</a></li>
          <li><a href="#">교수 목록 및 등록</a></li>
          <li><a href="#">임직원 목록 및 등록</a></li>
        </ul>
        <li><img src="${ctx}/images/ico-admin-college.png">대학 및 학과</li>
        <ul class="styletwo">
          <li><a href="#">교육 운영 현황</a></li>
          <li><a href="#">교육 운영 현황</a></li>
        </ul>
        <li><img src="${ctx}/images/ico-admin-board.png">게시판 관리</li>
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

    <!-- 메인 -->
    <div class="menu">
      <div class="menu_top">
        <span>학생 등록</span>
        <div>
          <span>인사관리</span>
          <img src="${ctx}/images/bg-link-arr-over.png" alt="">
          <span class="stdlist">학생 등록</span>
        </div>
      </div>
      <hr/>

      <!-- (?code=...) 결과 메시지 표시 -->
      <c:if test="${not empty param.code}">
        <div class="msg ${param.code eq 'SUCCESS' ? 'ok' : 'err'}">
          처리 결과 코드: <strong>${param.code}</strong>
        </div>
      </c:if>

      <!-- 등록 폼 -->
      <form method="post" action="${ctx}/student/write.do" autocomplete="off">
        <!-- 기본 정보 -->
        <div class="section">
          <h4><img src="${ctx}/images/bullet-h4.png" alt="">기본 정보 입력</h4>
          <div class="form-grid">
            <label>학번</label>
            <input type="number" name="std_id" placeholder="예) 202500101" required />

            <label>주민등록번호</label>
            <input type="text" name="resident_number" placeholder="900103-1234567"
                   pattern="\\d{6}-\\d{7}" required />

            <label>이름</label>
            <input type="text" name="name" placeholder="학생 이름 입력" required />

            <label>영문명</label>
            <input type="text" name="e_name" placeholder="여권 등과 동일한 영문 이름" />

            <label>성별</label>
            <div>
              <label><input type="radio" name="gender" value="M" required /> 남</label>
              &nbsp;&nbsp;
              <label><input type="radio" name="gender" value="F" /> 여</label>
            </div>

            <label>구분</label>
            <select name="division" required>
              <option value="">선택</option>
              <option value="KOR">내국인</option>
              <option value="FOR">외국인</option>
            </select>

            <label>휴대폰</label>
            <input type="text" name="phone" placeholder="010-1234-5678" />

            <label>이메일</label>
            <input type="email" name="email" placeholder="name@example.com" />

            <!--  주소: 우편번호/기본주소/상세주소 (3칸) -->
            <label>주소</label>
            <div class="addr-wrap col-span-3">
              <div class="addr-top">
                <input type="text" name="zip" id="zip" placeholder="우편번호 선택">
                <button type="button" class="addr-btn" onclick="openPostcode()">검색</button>
              </div>
              <input type="text" name="addr1" id="addr1" placeholder="기본주소 선택">
              <input type="text" name="addr2" id="addr2" placeholder="상세주소 입력">
            </div>
          </div>
        </div>

        <!-- 학적 정보 -->
<div class="section2">
  <h4 class="info"><img src="${ctx}/images/bullet-h4.png" alt="">학적정보 입력</h4>

  <table class="reg-table">
    <tr>
      <th>입학년도</th>
      <td>
        <select name="entryyear" required>
          <option value="">선택</option>
          <c:forEach var="y" begin="2015" end="2025">
            <option value="${y}">${y}</option>
          </c:forEach>
        </select>
      </td>

      <th>졸업년도</th>
      <td>
        <select name="graduationyear">
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
        <select name="admission_type">
          <option value="수시">수시</option>
          <option value="정시">정시</option>
          <option value="편입학">편입학</option>
        </select>
      </td>

      <th>입학학과(전공)</th>
      <td>
        <div class="td-inline">
          <!-- 필요 시 college_name은 UI만 사용 -->
          <select name="college_name">
            <option value="">인문사회대학</option>
            <option value="자연과학대학">자연과학대학</option>
            <option value="공과대학">공과대학</option>
          </select>

          <!-- 실제 DB 저장은 dept_id -->
          <select name="dept_id" required>
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
          <select name="entrygrade" required>
            <option value="1">1학년</option>
            <option value="2">2학년</option>
            <option value="3">3학년</option>
            <option value="4">4학년</option>
          </select>

          <!-- entryterm은 실제 DB필드(1/2) -->
          <select name="entryterm" required>
            <option value="1">1학기</option>
            <option value="2">2학기</option>
          </select>
        </div>
      </td>

      <th>지도교수</th>
      <td>
        <!-- DB는 문자열 -->
        <select name="advisor">
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

  <!-- 등록 버튼만  -->
  <div class="tbl-btns">
    <button type="submit">등록</button>
  </div>

  <!-- 상태 값이 UI에 없으면 기본값으로 재학중을 전송 -->
  <input type="hidden" name="status" value="재학중" />
</div>


          <div class="btns">
            <a href="${ctx}/student/list.do"><button type="button">목록</button></a>
            <button type="reset">초기화</button>
            <button type="submit">등록</button>
          </div>
        </div>
      </form>
    </div>
  </div>

  <footer>
    <p>Copyright ©Green University All rights reserved. ADMINISTRATOR Version 1.4.1</p>
  </footer>
</body>
</html>
