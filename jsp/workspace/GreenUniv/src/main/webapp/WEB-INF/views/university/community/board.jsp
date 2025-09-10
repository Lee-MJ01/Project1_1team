<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>board</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/community/style_boa.css">
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
                        <li class="active"><a href="#">자유게시판</a></li>
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
                        <li><a href="${pageContext.request.contextPath}/community/news.do">뉴스 및 칼럼</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/jobs.do">취업정보</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath}/community/board.do">자유게시판</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/qna.do">질문과 답변</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/resources.do">자료실</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>자유게시판</h3>

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
                        <thead>
                            <tr>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>조회</th>
                            </tr>
                        </thead>
                    
                        <tbody>
                            <tr>
                                <td>3</td>
                                <td>
                                    2024 하반기 도서관 이용자 만족도 조사(추첨을 통해 모···)
                                </td>
                                <td>담당자</td>
                                <td><time datetime="2024-04-09">24.04.09</time></td>
                                <td>160</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>
                                    2024 하반기 도서관 이용자 만족도 조사(추첨을 통해 모···)
                                </td>
                                <td>담당자</td>
                                <td><time datetime="2024-04-09">24.04.09</time></td>
                                <td>160</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>
                                    2024 하반기 도서관 이용자 만족도 조사(추첨을 통해 모···)
                                </td>
                                <td>담당자</td>
                                <td><time datetime="2024-04-09">24.04.09</time></td>
                                <td>160</td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="pagination">
                        <a href="#" class="first"><img src="${pageContext.request.contextPath}/images/btn-first-page.png" alt="처음"></a>
                        <a href="#" class="prev"><img src="${pageContext.request.contextPath}/images/btn-prev-page.png" alt="이전"></a>
                        <a href="#" class="active">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#" class="next"><img src="${pageContext.request.contextPath}/images/btn-next-page.png" alt="다음"></a>
                        <a href="#" class="last"><img src="${pageContext.request.contextPath}/images/btn-last-page.png" alt="끝"></a>
                    </div>
                </section>
            </div>
        </main>
        <%-- 푸터 부분 포함 --%>
		<%@ include file="/WEB-INF/views/_footer.jsp" %>
    </div>
</body>
</html>