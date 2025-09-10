<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>calendar</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/academics/style_cal.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/academics/xeicon.min.css">
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
                            <img src="/images/ico-home.png" height="15"></a></li>
                        <li><a href="#">
                            <img src="/images/bg-path-arrow.png" height="10"></a></li>
                        <li><a href="#">학사안내</a></li>
                        <li><a href="#">
                            <img src="/images/bg-path-arrow.png" height="10"></a></li>
                        <li class="active"><a href="#">학사일정</a></li>
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
                        <li class="active"><a href="${pageContext.request.contextPath}/academics/calendar.do">학사일정</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/registration.do">수강신청</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/grades.do">성적</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/graduation.do">수료 및 졸업</a></li>
                        <li><a href="${pageContext.request.contextPath}/academics/faq.do">자주묻는질문</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>학사일정</h3>

                    <div class="calendar-header">
                        <button class="prev"><i class="xi-angle-left-thin"></i></button>
                        <span class="month">2025.03</span>
                        <button class="next"><i class="xi-angle-right-thin"></i></button>
                    </div>

                    <table class="calendar">
                        <thead>
                            <tr>
                                <th>Sun</th>
                                <th>Mon</th>
                                <th>Tue</th>
                                <th>Wed</th>
                                <th>Thu</th>
                                <th>Fri</th>
                                <th>Sat</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="prev-month">23</td>
                                <td class="prev-month">24</td>
                                <td class="prev-month">25</td>
                                <td class="prev-month">26</td>
                                <td class="prev-month">27</td>
                                <td class="prev-month">28</td>
                                <td class="prev-month">1</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>3</td>
                                <td class="today"><span>4</span></td>
                                <td class="event">5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                            </tr>
                            <tr>
                                <td>9</td>
                                <td>10</td>
                                <td>11</td>
                                <td>12</td>
                                <td>13</td>
                                <td>14</td>
                                <td>15</td>
                            </tr>
                            <tr>
                                <td>16</td>
                                <td>17</td>
                                <td>18</td>
                                <td>19</td>
                                <td>20</td>
                                <td>21</td>
                                <td>22</td>
                            </tr>
                            <tr>
                                <td>23</td>
                                <td>24</td>
                                <td>25</td>
                                <td>26</td>
                                <td>27</td>
                                <td>28</td>
                                <td>29</td>
                            </tr>
                            <tr>
                                <td>30</td>
                                <td>31</td>
                                <td class="next-month">1</td>
                                <td class="next-month">2</td>
                                <td class="next-month">3</td>
                                <td class="next-month">4</td>
                                <td class="next-month">5</td>
                            </tr>
                        </tbody>
                    </table>

                    <p class="calendar-note">※ 자세한 일정 내용은 공지사항을 참고하시기 바랍니다.</p>
                </section>
            </div>
        </main>
        
        
<%-- 푸터 부분 포함 --%>
<%@ include file="/WEB-INF/views/_footer.jsp" %>
    </div>
</body>
</html>