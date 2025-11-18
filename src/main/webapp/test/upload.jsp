<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>다중 이미지 업로드 (MVC)</title>
</head>
<body>
  <h2>다중 이미지 업로드</h2>
  <form method="post" action="../test/upload_result.do" enctype="multipart/form-data">
    <input type="file" name="images" multiple  required />
    <button type="submit">업로드</button>
  </form>

  <div id="preview" style="display:flex;flex-wrap:wrap;gap:10px;margin-top:15px;"></div>
  <script>
    const input = document.querySelector('input[name="images"]');
    const preview = document.getElementById('preview');
    input.addEventListener('change', () => {
      preview.innerHTML = '';
      for (const file of input.files) {
        const img = document.createElement('img');
        img.src = URL.createObjectURL(file);
        img.style.width = '120px';
        img.style.height = '120px';
        img.style.objectFit = 'cover';
        preview.appendChild(img);
      }
    });
  </script>
</body>
</html>