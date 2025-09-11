<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <main>
      <div class="container">
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

        <section class="content">
          <h3>글쓰기</h3>


		<form action="${pageContext.request.contextPath}/board/write.do" method="post" enctype="multipart/form-data">
		  <!-- 큰 분류 -->
		  <label>큰 분류</label>
		  <select name="parent_cd" id="parent_cd" required>
		    <option value="">선택</option>
		    <c:forEach var="p" items="${parents}">
		      <option value="${p.comm_cd}" ${param.parent_cd == p.comm_cd ? 'selected' : ''}>${p.comm_nm}</option>
		    </c:forEach>
		  </select>
		
		  <!-- 작은 분류(게시판) -->
		  <label>게시판</label>
		  <select name="comm_cd" id="comm_cd" required>
		    <option value="">선택</option>
		    <c:forEach var="c" items="${children}">
		      <option value="${c.comm_cd}" data-parent="${c.up_comm_cd}"
		        ${param.comm_cd == c.comm_cd ? 'selected' : ''}>${c.comm_nm}</option>
		    </c:forEach>
		  </select>
		
		  <div>
		    <input type="text" name="title" placeholder="제목" required />
		  </div>
		  <div>
		    <textarea name="content" placeholder="내용" required></textarea>
		  </div>
		
		  <div>
		    <input type="file" name="files" multiple />
		  </div>
		
		  <div class="btns">
		    <button type="submit">등록</button>
		    <a href="${pageContext.request.contextPath}/admission/notice.do" class="btn">목록</a>
		  </div>
		</form>
       </section>
      </div>
    </main>
    
    <script>
  // 부모 선택 시 자식 옵션 필터링
  const parentSel = document.getElementById('parent_cd');
  const childSel  = document.getElementById('comm_cd');
  const allChildOptions = Array.from(childSel.querySelectorAll('option[data-parent]'));

  function filterChildren() {
    const p = parentSel.value;
    childSel.value = '';
    allChildOptions.forEach(o => o.hidden = (o.dataset.parent !== p));
  }

  parentSel.addEventListener('change', filterChildren);

  // 초기 진입 시 (?parent_cd=..&comm_cd=.. 로 들어온 경우 포함)
  filterChildren();
  if (childSel.querySelector(`option[value="${childSel.getAttribute('value')||'${param.comm_cd}'}"]`)) {
    childSel.value = "${param.comm_cd}";
  }
</script>
    

<%@ include file = "/WEB-INF/views/_footer.jsp" %>
</body>
</html>

