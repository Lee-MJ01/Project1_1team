<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cafeteria</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/campuslife/style_cafe.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/campuslife/css/xeicon.min.css">
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
                        <li><a href="#">대학생활</a></li>
                        <li><a href="#">
                            <img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10"></a></li>
                        <li class="active"><a href="#">식단안내</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <main>
            <div class="container">
                <aside class="side-nav">
                    <h2>대학생활</h2>
                    <ul>
                    	<li><a href="${pageContext.request.contextPath}/campuslife/student-union.do">학생회소개</a></li>
                        <li><a href="${pageContext.request.contextPath}/campuslife/clubs.do"">동아리/스터디</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath}/campuslife/cafeteria.do">식단안내</a></li>
                        <li><a href="${pageContext.request.contextPath}/campuslife/gallery.do">갤러리</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>식단안내</h3>

                    <div class="cafeteria-header">
                        <button class="prev"><i class="xi-angle-left-thin"></i></button>
                        <!-- 동적 처리 -->
                        <span class="month">
							${dto.start_date}~${dto.end_date}
						</span>
                        <button class="next"><i class="xi-angle-right-thin"></i></button>
                    </div>

                    <table class="cafeteria">
                        <thead>
                            <tr>
                                <th>구분</th>
                                <th>${weekDate[0]}(월)</th>
                                <th>${weekDate[1]}(화)</th>
                                <th>${weekDate[2]}(수)</th>
                                <th>${weekDate[3]}(목)</th>
                                <th>${weekDate[4]}(금)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="strong"><strong>코너1</strong></td>
                                
                                <!-- DB 처리 -->
                                <td>미운영</td>
                            </tr>
                            <tr>
                                <td class="strong"><strong>코너2</strong></td>
                                
                                <!-- DB 처리 -->
                                <td>
                                    <span class="sticker">정식 5,500원</span><br>
                                    백미밥<br>
                                    바지락미역국<br>
                                    닭안심매콤조림<br>
                                    야끼우동<br>
                                    두부강정<br>
                                    상추겉절이<br>
                                    포기김치
                                </td>
                            </tr>
                            <tr>
                                <td class="strong"><strong>코너3</strong></td>
                                
                                <!-- DB 처리 -->
                                <td>미운영</td>
                            </tr>
                        </tbody>
                    </table>

                    <p class="cafeteria-note">※ 항상 그린식당을 이용해 주셔서 감사합니다.</p>
                </section>
            </div>
        </main>
        
       <%-- 푸터 부분 포함 --%>
<%@ include file="/WEB-INF/views/_footer.jsp" %>
    </div>
</body>
</html>