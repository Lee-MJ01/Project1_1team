<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/_header.jsp" %>
   
<!-- 입학안내 공지사항 뷰 글보기 -->

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>그린대학교 | 공지사항</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/admission/notice.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/university/admission/common.css">
    

  <style>
  /* ===== Notice View 전용 스타일 ===== */

  .board {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
    font-size: 15px;
    color: #333;
  }

  .board th, .board td {
    border: 1px solid #ddd;
    padding: 12px 15px;
    vertical-align: middle;
  }

  .board th {
    background: #f8f9fa;
    width: 150px;
    text-align: center;
    font-weight: 600;
    color: #111;
  }

  .board td {
    background: #fff;
  }

  /* input, textarea read-only 스타일 */
  .board input[readonly],
  .board textarea[readonly] {
    width: 100%;
    border: none;
    background: transparent;
    font-size: 15px;
    color: #333;
    resize: none;
  }

  /* textarea 본문 크기 */
  .board textarea {
    min-height: 200px;
    line-height: 1.6;
  }

  /* 버튼 영역 */
  .btn {
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

  .btn:hover { background: #f1f1f1; }

  .btnRemove { color: #c00; }
  .btnModify { color: #0070c9; }
  .btnList   { color: #333; }

  /* 댓글 영역 */
  .commentList {
    border-top: 1px solid #eee;
    padding-top: 20px;
    margin-top: 40px;
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
</head>

<body>
  <div class="background">
    <div class="container">
      <div class="sub-nav">
        <ul>
          <li><a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/images/ico-home.png" height="15" alt="홈"></a></li>
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
          <li class="active"><a href="${pageContext.request.contextPath}/admission/notice.do">공지사항</a></li>
          <li><a href="${pageContext.request.contextPath}/admission/early.do">수시모집</a></li>
          <li><a href="${pageContext.request.contextPath}/admission/regular.do">정시모집</a></li>
          <li><a href="${pageContext.request.contextPath}/admission/transfer.do">편입학</a></li>
          <li><a href="${pageContext.request.contextPath}/admission/counseling.do">입학상담</a></li>
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
</body>
</html>
