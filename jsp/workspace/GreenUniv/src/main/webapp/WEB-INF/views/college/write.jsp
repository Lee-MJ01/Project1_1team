<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>대학 정보 등록</title>
  <style>
    body{font-family:"Noto Sans KR",system-ui,Arial,sans-serif;color:#222;margin:0;background:#f6f7fb}
    .container{max-width:980px;margin:40px auto;padding:28px;background:#fff;border:1px solid #e7e9ef;border-radius:14px}
    h1{font-size:22px;margin:0 0 18px}
    .field{display:flex;gap:14px;margin-bottom:14px;align-items:center}
    .field label{flex:0 0 140px;color:#444}
    .field input[type="text"]{flex:1;padding:10px 12px;border:1px solid #cfd6e4;border-radius:8px}
    .field textarea{flex:1;min-height:140px;padding:12px;border:1px solid #cfd6e4;border-radius:8px;resize:vertical}
    .hint{font-size:12px;color:#777;margin-top:4px}
    .actions{margin-top:22px;display:flex;gap:10px}
    button{padding:11px 18px;border:0;border-radius:8px;cursor:pointer}
    .btn-primary{background:#0a5bd3;color:#fff}
    .btn-secondary{background:#eef2f8;color:#243047}
    .preview{margin-left:140px;margin-top:-6px}
    .preview img{max-width:320px;max-height:240px;border:1px solid #e0e5ef;border-radius:8px}
    .alert{margin-bottom:14px;padding:10px 12px;border-radius:8px;font-size:14px}
    .alert-success{background:#e9f6ec;color:#156a2f;border:1px solid #bfe5c9}
    .alert-fail{background:#fff2f2;color:#b4231a;border:1px solid #ffd3d3}
  </style>
</head>
<body>
<div class="container">

  <!-- 등록 결과 메시지 (선택) -->
  <c:choose>
    <c:when test="${param.code == '200'}">
      <div class="alert alert-success">글(대학 정보) 등록이 완료되었습니다.</div>
    </c:when>
    <c:when test="${param.code == '201'}">
      <div class="alert alert-fail">등록에 실패했습니다. 다시 시도해 주세요.</div>
    </c:when>
  </c:choose>

  <h1>대학 정보 입력</h1>

  <!-- action 경로는 컨트롤러 매핑과 동일 /college/write.do  -->
  <form action="${pageContext.request.contextPath}/college/write.do"
        method="post" enctype="multipart/form-data" accept-charset="UTF-8">

    <div class="field">
      <label for="college_name">대학명</label>
      <input type="text" id="college_name" name="college_name"
             placeholder="예) 인문사회대학" required>
    </div>

    <div class="field">
      <label for="college_name_en">대학 영문명</label>
      <input type="text" id="college_name_en" name="college_name_en"
             placeholder="예) Humanities And Social Sciences">
    </div>

    <div class="field">
      <label for="intro_title">대학 소개 제목</label>
      <input type="text" id="intro_title" name="intro_title"
             placeholder="소개 제목을 입력하세요" required>
    </div>

    <div class="field">
      <label for="intro_body">대학 소개</label>
      <textarea id="intro_body" name="intro_body"
                placeholder="대학 소개 내용을 입력하세요" required></textarea>
    </div>

    <div class="field">
      <label for="image_path">대표 이미지</label>
      <input type="file" id="image_path" name="image_path" accept="image/*">
    </div>
    <div class="preview" id="previewBox" style="display:none;">
      <div class="hint">미리보기 (권장 320 × 240)</div>
      <img id="previewImg" alt="preview">
    </div>

    <div class="actions">
      <button type="submit" class="btn-primary">등록</button>
      <button type="reset" class="btn-secondary">초기화</button>
    </div>
  </form>
</div>

<!-- 간단한 미리보기 스크립트 (선택) -->
<script>
  const input = document.getElementById('image_path');
  const box = document.getElementById('previewBox');
  const img = document.getElementById('previewImg');
  input?.addEventListener('change', e => {
    const file = e.target.files?.[0];
    if (!file) { box.style.display='none'; return; }
    const reader = new FileReader();
    reader.onload = ev => {
      img.src = ev.target.result;
      box.style.display = 'block';
    };
    reader.readAsDataURL(file);
  });
</script>
</body>
</html>
