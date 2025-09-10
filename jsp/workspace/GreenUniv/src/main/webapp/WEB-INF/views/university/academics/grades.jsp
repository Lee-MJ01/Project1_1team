<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>grades</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/academics/style_gra.css">
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
                        <li class="active"><a href="#">성적</a></li>
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
                        <li class="active"><a href="${pageContext.request.contextPath}/academics/grades.do">성적</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/graduation.do">수료 및 졸업</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/faq.do">자주묻는질문</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>성적</h3>

                    <div class="main-content">
                        <h4 class="main-title">시험</h4>
                        <h5 class="sub-title">- 시험은 정기시험, 비정기시험, 추가시험, 재시험 등으로 구분</h5>
                        <div class="main-text">
                            <ol>
                                <li>1) 정기시험:중간시험과 학기말시험으로 나누며 중간시험은 학기 당 수업일수 2분의 1이 되는 주에 실시하고, 학기말시험은 학기의 최종 주에 실시</li>
                                <li>2) 비정기시험:과제학습, 세미나 등 계속적인 학습활동을 평가하는 시험으로 담당교수의 책임 하에 실시</li>
                                <li>3) 추가시험:질병 또는 부득이한 사정으로 정기시험에 응시할 수 없는 학생은 사유와 증빙서류를 첨부하여 추가시험신청서를 제출</li>
                            </ol>
                        </div>
                        <h5 class="sub-title">- 시험 부정행위자의 처리</h5>
                        <div class="main-text">
                            <ol>
                                <li>1) 시험 중 부정행위가 적발되면 감독교수는 그 행위내용을 시험지 상단에 기록하고 날인한 후 즉시 총장에게 보고</li>
                                <li>2) 시험 부정행위자에 대하여는 다음의 내용에 따라 제적 또는 유기정학 처분</li>
                                <li>└ 시험에 대리로 응시하거나 대리응시를 부탁한 경우</li>
                                <li>└ 시험지에 다른 사람의 이름을 쓰거나 쓰게 한 경우</li>
                                <li>└ 부정행위자로 적발되어 징계처분을 받은 사실이 있는 학생이 거듭 부정행위를 한 경우</li>
                            </ol>
                        </div>

                        <h4 class="main-title">성적</h4>
                        <h5 class="sub-title">- 평가내용</h5>
                        <div class="main-text">
                            <ol>
                                <li>1) 성적평가는 각 교과목의 시험성적, 과제평가, 출석상황 및 학습태도 등을 종합하여 평가</li>
                                <li>2) 출석 및 학습태도 10-20%, 정기시험 50-70%, 비정기시험 및 과제 20-30%로 함을 원칙</li>
                            </ol>
                        </div>

                        <h5 class="sub-title">- 등급</h5>
                        <table class="main-table">
                            <thead>
                                <tr>
                                    <th>등급</th>
                                    <th>평점</th>
                                    <th>백분위 기준점수</th>
                                    <th>비고</th>
                                </tr> 
                            </thead>
                            <tbody>
                                <tr>
                                    <td>A+</td>
                                    <td>4.5</td>
                                    <td>99</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>A</td>
                                    <td>4</td>
                                    <td>94</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>B+</td>
                                    <td>3.5</td>
                                    <td>89</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>B</td>
                                    <td>3</td>
                                    <td>84</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>C+</td>
                                    <td>2.5</td>
                                    <td>79</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>C</td>
                                    <td>2</td>
                                    <td>74</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>D+</td>
                                    <td>1.5</td>
                                    <td>69</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>D</td>
                                    <td>1</td>
                                    <td>64</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>F</td>
                                    <td>0</td>
                                    <td>59</td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table> 
                        <p class="table-note">※ 이수한 교과목의 성적이 D0급 이상 또는 P일 경우는 학점을 취득한 것으로 인정</p>
                    </div>
                </section>
            </div>
        </main>

        <%-- 푸터 부분 포함 --%>
<%@ include file="/WEB-INF/views/_footer.jsp" %>
    </div>
</body>
</html>