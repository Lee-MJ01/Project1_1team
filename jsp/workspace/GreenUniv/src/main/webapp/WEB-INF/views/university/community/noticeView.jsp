<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/_header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<!-- 커뮤니티 공지사항 뷰 글보기 -->

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/community/style_not.css">

    <!-- ===== breadcrumb ===== -->
    <div class="background">
      <div class="container">
        <div class="sub-nav">
          <ul>
            <li><a href="/"><img src="${pageContext.request.contextPath}/images/ico-home.png" height="15" alt="홈"></a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li><a href="#">입학안내</a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li class="active"><a href="#">공지사항</a></li>
          </ul>
        </div>
      </div>
    </div>

    <!-- ===== 메인 ===== -->
    <main>
      <div class="container">
        <!-- 좌측 사이드 메뉴 -->
        <aside class="side-nav">
          <h2>입학안내</h2>
          <ul>
            <li class="active"><a href="#">공지사항</a></li>
            <li><a href="#">수시모집</a></li>
            <li><a href="#">정시모집</a></li>
            <li><a href="#">편입학</a></li>
            <li><a href="#">입학상담</a></li>
          </ul>
        </aside>

        <!-- 본문 -->
        <section class="content">
          <h3>공지사항</h3>

          <!-- 게시판 -->
		 <table class="board">
		    <tr>
		        <th>번호</th>
		        <td><input type="text" name="no" value="${BoardDTO.number}" readonly/></td>
		    </tr>
		    <tr>
		        <th>제목</th>
		        <td><input type="text" name="title" value="${BoardDTO.title}" readonly/></td>
		    </tr>
		    <tr>
		        <th>작성자</th>
		        <td><input type="text" name="writer" value="${BoardDTO.writer}" readonly/></td>
		    </tr>
		    <tr>
		        <th>작성일</th>
		        <td><input type="text" name="wdate" value="${BoardDTO.w_date}" readonly/></td>
		    </tr>
		    <tr>
		        <th>조회수</th>
		        <td><input type="text" name="views" value="${BoardDTO.view_count}" readonly/></td>
		    </tr>
		    <tr>
		        <th>내용</th>
		        <td>
		            <textarea name="content" readonly>${BoardDTO.content}</textarea>
		        </td>
		    </tr>
		</table>

	        <div>
	        	<c:if test="${sessUser.usid eq BoardDTO.writer}">
		            <a href="#" class="btn btnRemove">삭제</a>
		            <a href="#" class="btn btnModify">수정</a>
	            </c:if>
				<a href="${pageContext.request.contextPath}/admission/notice.do" class="btn btnList">목록</a>
	        </div>
	
	        <!-- 댓글목록 -->
	        <section class="commentList">
	            <h3>댓글목록</h3>
	            <p class="empty">등록된 댓글이 없습니다.</p>
			</section>
			


        </section>
      </div>
    </main>

<%@ include file = "/WEB-INF/views/_footer.jsp" %>

