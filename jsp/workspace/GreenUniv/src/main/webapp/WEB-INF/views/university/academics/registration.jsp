<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>registration</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/academics/style_reg.css">
</head>
<body>
    <div id="wrapper">
        <%-- 헤더 부분 포함 --%>
<%@ include file="/WEB-INF/views/_header.jsp" %>

        <div class=background>
            <div class="container">
                <div class="sub-nav">
                    <ul>
                        <li><a href="#">
                            <img src="${pageContext.request.contextPath}/images/ico-home.png" height="15"></a></li>
                        <li><a href="#">
                            <img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10"></a></li>
                        <li><a href="#">학사안내</a></li>
                        <li><a href="#">
                            <img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10"></a></li>
                        <li class="active"><a href="#">수강신청</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <main>
            <div class="container">
                <aside class="side-nav">
                    <h2>학사안내</h2>
                    <ul>
                    	<li><a href="${pageContext.request.contextPath}/academics/notice.do">공지사항</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/calendar.do">학사일정</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath}/academics/registration.do">수강신청</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/grades.do">성적</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/graduation.do">수료 및 졸업</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/faq.do">자주묻는질문</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>수강신청</h3>

                    <div class="main-content">
                        <h4 class="main-title">수강신청 기간</h4>
                        <div class="main-text period-text">
                            <p>- 매학기 수강신청은 개강 전에 실시, 학생은 수강신청 공고를 충분히 숙지한 다음, 수강신청 기간에 인터넷을 통해 신청과목을 입력</p>
                            <p>- 필요한 경우 학과사무실의 학사상담이나 지도교수의 지도를 받을 수 있으며, 반드시 학년별 지정된 날짜에 수강신청 완료</p>
                            <p>- 자세한 설명은 학사일정 공지사항 게시판 참조</p>
                        </div>

                        <h4 class="main-title">수강신청 학점</h4>
                        <div class="main-text">
                            <p>- 학기당 이수학점 : 18학점 이내(논문과목 별도) [대학 학칙 제20조]</p>
                        </div>

                        <h4 class="main-title">학부(과)별 신청 학점</h4>
                        <table class="main-table">
                            <thead>
                                <tr>
                                    <th colspan="2">수강신청 학점수</th>
                                    <th>대상학부(과)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>졸업학점이 130학점인 학부(과)</td>
                                    <td>최저 12학점, 최대 18학점</td>
                                    <td>
                                        인문대학, 사회과학대학, 경영대학, 공과대학, 자연과학대학, 
                                        간호대학, 글로벌융합대학, 소프트웨어융합대학, 미디어스쿨, 
                                        데이터과학융합스쿨, 나노융합스쿨, 미래융합스쿨</td>
                                </tr>
                                <tr>
                                    <td>졸업학점이 135-140학점인 학부(과)</td>
                                    <td>최저 15학점, 최대 21학점</td>
                                    <td>의과대학 의예과(수료학점은 72이상)</td>
                                </tr>

                                <tr>
                                    <td>졸업학점이 150학점인 학부(과)</td>
                                    <td>최저 15학점, 최대 26학점</td>
                                    <td>의과대학 의학과</td>
                                </tr>
                            </tbody>
                        </table> 
                        <div class="main-text">
                            <p>- 4학년 1학기에는 12학점 이상, 최종학기에는 1과목 이상 수강신청 하여야 한다.</p>
                            <p>- 직전학기 성적이 3.75 이상인 학생은 최대학점에서 3학점까지 초과 이수할 수 있다.</p>
                            <p>- 장학생 선발은 직전학기에 평점평균 2.0 이상을 취득하여야 하며, 대학별 기준학점 이상을 이수하여야 한다.(학생지원팀 055-123-1010 문의)</p>
                        </div>

                        <h4 class="main-title">수강신청 변경 및 수강과목 철회</h4>
                        <div class="main-text">
                            <p>- 수강 신청한 과목을 철회하고자 할 때에는 수업주수 4분의 1이전까지 정해진 기간에 해당 교과목을 해당 사이트를 통하여 철회할 수 있음</p>
                            <p>- 학기당 2과목까지 철회할 수 있으나, 철회로 수강인원이 폐강기준인원 미만이 되는 교과목은 수강철회를 불허</p>
                            <p>- 철회 후 수강신청학점이 학기 당 최저 이수학점 이상이 되어야 함</p>
                            <button type="button" class="apply-btn">
                                <span>수강신청하기</span>
                                <img src="${pageContext.request.contextPath}/images/bg-link.png" alt="">
                            </button>
                        </div>
                    </div>
                </section>
            </div>
        </main>
<%-- 푸터 부분 포함 --%>
<%@ include file="/WEB-INF/views/_footer.jsp" %>
    </div>
</body>
</html>