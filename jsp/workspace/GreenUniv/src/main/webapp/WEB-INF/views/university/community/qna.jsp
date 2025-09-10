<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>qna</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/community/style_qna.css">
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
                        <li class="active"><a href="#">질문과 답변</a></li>
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
                        <li><a href="${pageContext.request.contextPath}/community/board.do">자유게시판</a></li>
                        <li class="active"><a href="${pageContext.request.contextPath}/community/qna.do">질문과 답변</a></li>
                        <li><a href="${pageContext.request.contextPath}/community/resources.do">자료실</a></li>
                    </ul>
                </aside>

                <section class="content">
                    <h3>질문과 답변</h3>

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
                                <th>상태</th>
                            </tr>
                        </thead>
                    
                        <tbody>
                            <tr>
                                <td>5</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/images/ico-lock.png" alt="비밀글" class="icon-lock">
                                    문의드립니다.
                                </td>
                                <td>홍길동</td>
                                <td><time datetime="2024-04-09">24.04.09</time></td>
                                <td><span class="answer" data-status="wait">답변대기</span></td>
                            </tr>

                            <tr>
                                <td>4</td>
                                <td>취업 진로 상담</td>
                                <td>홍길동</td>
                                <td><time datetime="2024-04-09">24.04.09</time></td>
                                <td><span class="answer" data-status="done">답변완료</span></td>
                            </tr>

                            <tr class="reply">
                                <td>3</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/images/ico-reply.png" alt="답변" class="icon-reply">
                                    RE : [답변] 취업 진로 상담
                                </td>
                                <td>담당자</td>
                                <td><time datetime="2024-04-09">24.04.09</time></td>
                                <td><span class="answer" data-status="done">답변완료</span></td>
                            </tr>

                            <tr>
                                <td>2</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/images/ico-lock.png" alt="비밀글" class="icon-lock">
                                    취업실전전략1 일반선택 교과목 문의입니다
                                </td>
                                <td>홍길동</td>
                                <td><time datetime="2024-04-09">24.04.09</time></td>
                                <td><span class="answer" data-status="done">답변완료</span></td>
                            </tr>
                            
                            <tr class="reply">
                                <td>1</td>
                                <td>
                                    <img src="${pageContext.request.contextPath}/images/ico-reply.png" alt="답변" class="icon-reply">
                                    RE : [답변] 취업실전전략1 일반선택 교과목 문의입니다
                                </td>
                                <td>담당자</td>
                                <td><time datetime="2024-04-09">24.04.09</time></td>
                                <td><span class="answer" data-status="done">답변완료</span></td>
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