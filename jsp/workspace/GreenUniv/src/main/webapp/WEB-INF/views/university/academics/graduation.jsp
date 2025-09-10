<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>graduation</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/academics/style_gda.css">
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
                        <li class="active"><a href="#">수료 및 졸업</a></li>
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
                        <li><a href="${pageContext.request.contextPath}/academics/registration.do">수강신청</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/grades.do">성적</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath}/academics/graduation.do">수료 및 졸업</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/faq.do">자주묻는질문</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>수료 및 졸업</h3>

                    <div class="main-content">
                        <h4 class="main-title">수료기준</h4>
                        <table class="table-comp">
                            <colgroup>
                                <col style="width: 30%;">
                                <col style="width: 10%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th rowspan="2">구분</th>
                                    <th rowspan="2">
                                        <span class="th-text">총 취득학점</span>
                                    </th>
                                    <th colspan="4">수료학점</th>
                                </tr>
                                <tr>
                                    <th>1학년</th>
                                    <th>2학년</th>
                                    <th>3학년</th>
                                    <th>4학년</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>인문대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>66</td>
                                    <td>99</td>
                                    <td>130</td>
                                </tr>
                                <tr>
                                    <td>사회과학대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>66</td>
                                    <td>99</td>
                                    <td>130</td>
                                </tr>
                                <tr>
                                    <td>경영대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>66</td>
                                    <td>99</td>
                                    <td>130</td>
                                </tr>
                                <tr>
                                    <td>자연과학대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>66</td>
                                    <td>99</td>
                                    <td>130</td>
                                </tr>
                                <tr>
                                    <td>정보과학대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>66</td>
                                    <td>99</td>
                                    <td>130</td>
                                </tr>
                            </tbody>
                        </table>
                        <p class="table-note">- 수료기준:졸업학점에 따라 학년별 수료학점이 다르며, 각 학년별 수료학점을 취득한 경우 해당 학년에 대한 '수료증명서'를 발급 가능</p>
                    </div>

                    <div class="main-content">
                        <h4 class="main-title">조기졸업</h4>
                        <table class="table-earl">
                            <colgroup>
                                <col style="width: 30%;">
                                <col style="width: 20%;">
                                <col style="width: 20%;">
                                <col style="width: 30%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th colspan="3">자격</th>
                                    <th rowspan="2">신청절차</th>
                                </tr>
                                <tr>
                                    <th>이수학기</th>
                                    <th>평점평균</th>
                                    <th>취득학점</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>6학기 또는 7학기 이수자로서 해당학기 이수로 모든 졸업요건의 충족이 가능한 자.</td>
                                    <td>4.00 이상</td>
                                    <td>정규졸업 요구학점과 동일</td>
                                    <td>졸업을 원하는 학기초 30일 이내에 "조기 졸업신청서"를 교무팀에 제출</td>
                                </tr>
                            </tbody>
                        </table>
                        <p class="table-note">※ 편입생 제외</p>
                    </div>

                    <div class="main-content">
                        <h4 class="main-title">졸업</h4>
                        <table class="table-grad">
                            <colgroup>
                                <col style="width: 30%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 15%;">
                                <col style="width: 25%;">
                            </colgroup>
                            <thead>
                                <tr>
                                    <th rowspan="2">소속 단과대학</th>
                                    <th rowspan="2">총 취득학점</th>
                                    <th colspan="3">전공 이수 학점</th>
                                </tr>
                                <tr>
                                    <th><span class="th-text">복수전공(제1전공 기준동일)</span></th>
                                    <th>단일전공</th>
                                    <th>부전공</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>인문대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>60</td>
                                    <td>제1전공42/부전공21</td>
                                </tr>
                                <tr>
                                    <td>사회과학대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>60</td>
                                    <td>제1전공42/부전공21</td>
                                </tr>
                                <tr>
                                    <td>경영대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>60</td>
                                    <td>제1전공42/부전공21</td>
                                </tr>
                                <tr>
                                    <td>자연과학대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>70</td>
                                    <td>제1전공50/부전공25</td>
                                </tr>
                                <tr>
                                    <td>정보과학대학</td>
                                    <td>130이상</td>
                                    <td>33</td>
                                    <td>60</td>
                                    <td>제1전공42/부전공21</td>
                                </tr>
                            </tbody>
                        </table>
                        <p class="table-note">- 등록학기:8학기 이상, 의과대학 의학과는 12학기 이상</p>
                        <p class="table-note">- 총 성적평점평균:2.00이상</p>
                        <p class="table-note">- 졸업논문(또는 졸업종합시험):합격</p>
                    </div>
                </section>
            </div>
        </main>    
        
       
<%-- 푸터 부분 포함 --%>
<%@ include file="/WEB-INF/views/_footer.jsp" %>
    </div>
</body>
</html>