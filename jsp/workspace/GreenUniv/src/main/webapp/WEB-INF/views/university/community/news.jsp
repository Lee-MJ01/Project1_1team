<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>news</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/community/style_news.css">
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
                        <li><a href="#">커뮤니티</a></li>
                        <li><a href="#">
                            <img src="/images/bg-path-arrow.png" height="10"></a></li>
                        <li class="active"><a href="#">뉴스 및 칼럼</a></li>
                    </ul>
                </div>
            </div>
        </div>

        <main>
            <div class="container">
                <aside class="side-nav">
                    <h2>커뮤니티</h2>
                    <ul>
                    	<li><a href="${pageContext.request.contextPath}/community/notice.do">공지사항</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath}/community/news.do">뉴스 및 칼럼</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/jobs.do">취업정보</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/board.do">자유게시판</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/qna.do">질문과 답변</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/resources.do">자료실</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>뉴스 및 칼럼</h3>

                    <div class="search-bar">
                        <select>
                            <option>전체</option>
                            <option>제목</option>
                            <option>작성자</option>
                        </select>

                        <div class="search-box">
                            <input type="text" placeholder="검색어를 입력해 주세요">
                            <button>검색</button>
                        </div>
                    </div>

                    <table class="board">
                        <colgroup>
                            <col style="width: 8%;">
                            <col style="width: 8%;">
                            <col style="width: 49%;">
                            <col style="width: 10%;">
                            <col style="width: 15%">
                            <col style="width: 10%;">
                        </colgroup>
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>구분</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회</th>
                            </tr>
                        </thead>
                    
                        <tbody>
                            <tr>
                                <td>3</td>
                                <td><span class="division" data-status="column">칼럼</span></td>
                                <td>
                                    정원호(식품자원경제) 교수, 시론-4차 산업 시대···</td>
                                <td>정원호</td>
                                <td><time datetime="2024-04-09">24.04.09</time></td>
                                <td>160</td>
                            </tr>

                            <tr>
                                <td>2</td>
                                <td><span class="division" data-status="column">칼럼</span></td>
                                <td>
                                    주윤정(법학전문대학원), 교수, 기고-인공지능,···</td>
                                <td>주윤정</td>
                                <td><time datetime="2024-04-09">24.04.09</time></td>
                                <td>160</td>
                            </tr>

                            <tr>
                                <td>1</td>
                                <td><span class="division" data-status="news">뉴스</span></td>
                                <td>
                                    그린대, '2024년 2학기 늘봄학교 초1 맞춤형 프로···</td>
                                <td>홍보실</td>
                                <td><time datetime="2024-04-09">24.04.09</time></td>
                                <td>160</td>
                            </tr>

                            <tr>
                                <td>1</td>
                                <td><span class="division" data-status="column">칼럼</span></td>
                                <td>
                                    김동헌(의학) 명예교수, 세상읽기 - 절대로 포기하···</td>
                                <td>김동헌</td>
                                <td><time datetime="2024-04-09">24.04.09</time></td>
                                <td>160</td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="pagination">
                        <a href="#" class="first"><img src="/images/btn-first-page.png" alt="처음"></a>
                        <a href="#" class="prev"><img src="/images/btn-prev-page.png" alt="이전"></a>
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#" class="next"><img src="/images/btn-next-page.png" alt="다음"></a>
                        <a href="#" class="last"><img src="/images/btn-last-page.png" alt="끝"></a>
                    </div>
                </section>
            </div>
        </main>
        
<%-- 푸터 부분 포함 --%>
<%@ include file="/WEB-INF/views/_footer.jsp" %>
    </div>
</body>
</html>