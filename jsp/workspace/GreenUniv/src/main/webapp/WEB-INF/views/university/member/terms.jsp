<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>그린대학교 | 약관 동의</title>
  <!-- 회원가입 전용 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/member/member.css">
  <!-- 약관 전용 스타일 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/member/terms.css">
</head>
<body>
  <div id="wrapper">
    <%-- 헤더 부분 포함 --%>
    <%@ include file="/WEB-INF/views/_header.jsp" %>

    <!-- breadcrumb -->
    <div class="background">
      <div class="container">
        <div class="sub-nav">
          <ul>
            <li><a href="/"><img src="${pageContext.request.contextPath}/images/ico-home.png" height="15" alt="홈"></a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li><a href="#">회원</a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li class="active"><a href="#">약관안내</a></li>
          </ul>
        </div>
      </div>
    </div>

    <!-- 메인 -->
    <main>
      <div class="terms-wrap">
        <div class="container">
          <h2 class="card__title">약관안내</h2>
          <p class="terms-desc">
            <strong>※</strong> 대학구성원(학생, 교직원)은 회원가입 없이 학번/교번 아이디로 로그인 가능합니다.<br>
            <strong>※</strong> 만 14세 미만 아동은 홈페이지 회원가입이 제한됩니다.
          </p>

          <form id="termsForm" class="form-table" method="get" action="${pageContext.request.contextPath}/member/terms.do" novalidate>
            <!-- 이용약관 -->
            <div class="row">
              <div class="th">이용약관</div>
              <div class="td">
              	<textarea readonly>${termsDTO.terms}</textarea>
              </div>
            </div>
            <!-- 개인정보 수집안내 -->
            <div class="row">
              <div class="th">개인정보 수집안내</div>
              <div class="td">
              	<textarea readonly>${termsDTO.privacy}</textarea>
              </div>
            </div>

            <!-- 동의 -->
            <div class="terms-check">
              <label>
                <input type="checkbox" id="agree" required>
                위의 홈페이지 이용에 따른 회원가입 약관 및 개인정보 수집·이용에 모두 동의합니다.
              </label>
            </div>

            <!-- 버튼 -->
            <div class="actions">
              <button type="button" class="btn cancel" onclick="history.back()">취소</button>
              <button type="submit" class="btn primary">다음</button>
            </div>
          </form>
        </div>
      </div>
    </main>

    <%-- 푸터 부분 포함 --%>
	<%@ include file="/WEB-INF/views/_footer.jsp" %>
  </div>

  <!-- 스크립트 -->
  <script>
  	const ctx = "${pageContext.request.contextPath}";
  	
    // 주요사이트 이동
    document.getElementById('sites').addEventListener('change', function(){
      if(this.value){ window.open(this.value, '_blank'); this.selectedIndex = 0; }
    });

    // 약관 동의 체크 후 다음으로
    document.getElementById('termsForm').addEventListener('submit', function(e){
      e.preventDefault();
      if(!document.getElementById('agree').checked){
        alert('약관에 동의해야 합니다.');
        return;
      }
      location.href="/member/signup.do";
    });
  </script>
</body>
</html>
