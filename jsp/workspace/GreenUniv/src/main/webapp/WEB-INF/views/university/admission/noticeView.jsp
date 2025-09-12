<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/_header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>그린대학교 | 공지사항</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/admission/notice.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/admission/common.css">
    <%-- 헤더, 푸터 등에 필요한 공통 CSS가 있다면 여기에 추가 --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css">
</head>
<style>
/* ===== Notice View 전용 스타일 ===== */

/* 제목 */
.notice-title {
  font-size: 22px;
  font-weight: 700;
  margin-bottom: 8px;
  color: #111;
}

/* 작성자 · 조회수 · 날짜 */
.notice-meta {
  font-size: 14px;
  color: #666;
  margin-bottom: 20px;
}
.notice-meta span {
  margin-right: 8px;
}

/* 본문 */
.notice-body {
  font-size: 16px;
  color: #333;
  white-space: pre-line; /* DB 줄바꿈 반영 */
  margin-bottom: 30px;
}

/* 버튼 영역 */
.notice-actions {
  margin-bottom: 40px;
}
.notice-actions .btn {
  display: inline-block;
  padding: 6px 14px;
  margin-right: 6px;
  font-size: 14px;
  border: 1px solid #ddd;
  border-radius: 4px;
  text-decoration: none;
  color: #333;
  background: #f9f9f9;
  transition: 0.2s;
}
.notice-actions .btn:hover {
  background: #f1f1f1;
}
.notice-actions .btnRemove { color: #c00; }
.notice-actions .btnModify { color: #0070c9; }

/* 댓글 */
.commentList {
  border-top: 1px solid #eee;
  padding-top: 20px;
}
.commentList h3 {
  font-size: 16px;
  margin-bottom: 10px;
}
.commentList p.empty {
  color: #888;
  font-size: 14px;
}
</style>
<body>
<%@ include file="/WEB-INF/views/_header.jsp" %>
    <div class="background">
      <div class="container">
        <div class="sub-nav">
          <ul>
            <li><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/images/ico-home.png" height="15" alt="홈"></a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li><a href="#">입학안내</a></li>
            <li><a href="#"><img src="${pageContext.request.contextPath}/images/bg-path-arrow.png" height="10" alt=">"></a></li>
            <li class="active"><a href="${pageContext.request.contextPath}/university/admission/notice.do">공지사항</a></li>
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
      		<li class="active"><a href="${pageContext.request.contextPath}/admission/notice.do">공지사항</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/early.do">수시모집</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/regular.do">정시모집</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/transfer.do">편입학</a></li>
            <li><a href="${pageContext.request.contextPath}/admission/counseling.do">입학상담</a></li>
          </ul>
        </aside>

        <!-- 본문 -->
		<section class="content">
		<h3 class="notice-title"><c:out value="${board.title}" /></h3>

		<div class="notice-meta">
			<span><c:out value="${board.writer}" /></span> ·
			<span>조회수 <c:out value="${board.view_count}" /></span> ·
			<span><c:out value="${board.w_date}" /></span>
		</div>

		<div class="notice-body">
			<c:out value="${board.content}" escapeXml="false" />
		</div>

		<div class="notice-actions">
			<c:if test="${sessUser != null and sessUser.usid == board.writer}">
			<a href=".../noticeModify.do?no=${board.number}" class="btn btnModify">수정</a>
			<a href=".../noticeDelete.do?no=${board.number}" class="btn btnRemove">삭제</a>
			</c:if>
			<a href=".../notice.do" class="btn">목록</a>
		</div>

		<section class="commentList">
			<h3>댓글</h3>
			<p class="empty">등록된 댓글이 없습니다.</p>
		</section>
		</section>

      </div>
    </main>

<%@ include file = "/WEB-INF/views/_footer.jsp" %>

