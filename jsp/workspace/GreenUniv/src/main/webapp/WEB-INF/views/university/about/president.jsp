<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>그린대학교 | 총장 인사말  </title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/about/style_pre.css">

</head>
<body>
  <%-- 헤더 부분 포함 --%>
<%@ include file="/WEB-INF/views/_header.jsp" %>

  <!-- 메인 -->
<main class="main-container">
<aside>
    <p class="aside-title">대학소개</p>
    <nav aria-label="대학소개 사이드 메뉴">
      <ul>
        <li><a href="${pageContext.request.contextPath}/about/president.do" aria-current="page">총장 인사말</a></li>
        <li><a href="${pageContext.request.contextPath}/about/philosophy.do">교육이념</a></li>
        <li><a href="${pageContext.request.contextPath}/about/history.do">연혁</a></li>
        <li><a href="${pageContext.request.contextPath}/about/organization.do">조직도</a></li>
        <li><a href="${pageContext.request.contextPath}/about/directions.do">오시는길</a></li>
      </ul>
    </nav>
  </aside>

  <section>
  <h2 class="main-title">총장 인사말</h2>
  <div class="content-body">

    <div class="intro-wrapper">
      <div class="intro-text">
        <p class="main-slogan">
          지속가능한 미래를 향해,<br>
          IT로 세상을 바꾸는 그린대학교
        </p>

        <p class="intro">
          우리 그린대학교는 “지속가능한 미래, 혁신적인 IT”라는 비전을 품고 
          환경과 첨단 기술을 융합하는 교육·연구를 실천하는 미래지향적 대학입니다.
        </p>

        <p class="intro">
          오늘날 우리는 기후 위기와 디지털 대전환이라는 두 가지 거대한 과제 앞에 서 있습니다. 
          이에 그린대학교는 IT 전문성을 바탕으로 환경 문제 해결을 선도하는 새로운 모델을 만들어가고자 합니다.
        </p>

        <p class="intro">
          저는 4년의 임기 동안 우리 대학이 슬기롭게 나아갈 수 있도록 몇 가지 큰 과제를 완수하고자 합니다.
        </p>
      </div>

      <div class="president-photo">
        <img src="${pageContext.request.contextPath}/images/president.png" alt="그린대학교 총장">
      </div>
    </div>

    <hr class="closing-line">

    <div class="pledge">
      <p class="title"><strong>첫째,</strong> AI와 빅데이터로 환경을 연구하겠습니다.</p>
      <p class="body">
        기후 변화, 대기질, 수질, 생태계 데이터를 분석하여 지구 환경을 지키는 
        과학적 해법을 제시하고, 이를 실생활에 적용하는 연구를 강화하겠습니다.
      </p>
    </div>

    <div class="pledge">
      <p class="title"><strong>둘째,</strong> 스마트 캠퍼스를 조성하겠습니다.</p>
      <p class="body">
        IoT와 클라우드 기반 에너지 관리 시스템을 구축하여 
        강의실 조명과 냉난방을 자동 최적화하고, 탄소 배출을 줄이는 
        친환경 캠퍼스 모델을 만들겠습니다.
      </p>
    </div>

    <div class="pledge">
      <p class="title"><strong>셋째,</strong> 산학협력을 통한 IT-환경 융합 산업을 확대하겠습니다.</p>
      <p class="body">
        친환경 에너지, 스마트 농업, 도시 관리, 탄소 저감 기술 등 
        산업 현장과 연결된 융합 프로젝트를 운영하여 학생들이 
        연구 성과를 사회적 가치와 창업으로 이어갈 수 있도록 하겠습니다.
      </p>
    </div>

    <div class="closing-wrapper">
      <p class="closing-intro">존경하는 그린대학교 가족 여러분!</p>

      <div class="closing-content">
        <div class="closing-photo">
          <img src="${pageContext.request.contextPath}/images/presidint2.png" alt="총장님">
        </div>
        <div class="closing-text">
          <p>
            우리 대학의 발전 구상은 총장인 저 혼자만의 힘으로는 완성될 수 없습니다.
            그린대학교 가족 모두의 적극적인 관심과 협력이 필요합니다.
            <br><br>
            현재 우리가 맞이한 기후 위기와 디지털 대전환이라는 도전을 슬기롭게 극복한다면,
            그린대학교는 환경과 IT가 융합된 선도 대학으로 도약할 수 있을 것입니다.
            <br><br>
            이러한 목표 달성을 위해 우리 그린인들의 지혜와 역량을 모아 주실 것을 간곡히 부탁드립니다.
            저는 우리 대학 구성원 모두에게 봉사하고 헌신하는 총장이 될 수 있도록
            모든 노력을 다할 것을 이 자리에서 엄숙히 약속드립니다.
          </p>
          <p>감사합니다.</p>
        </div>
      </div>

      <hr class="closing-line">

      <p class="sign">
        <span class="sign-small">그린대학교 총장</span><br>
        <span class="sign-name">○○○</span>
      </p>
    </div>

  </div>
  </section>

</main>
<%-- 푸터 부분 포함 --%>
<%@ include file="/WEB-INF/views/_footer.jsp" %>

<script>
  // 주요사이트 이동
  document.getElementById('sites').addEventListener('change', function(){
    if(this.value){ window.open(this.value, '_blank'); this.selectedIndex = 0; }
  });

</script>
</body>
</html>
