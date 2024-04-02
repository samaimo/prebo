// 変更前画像をプレビュー表示した状態から、変更する画像を選択したら表示が変わる //
window.addEventListener('DOMContentLoaded', function() {
  const imageField = document.getElementById('box-image');
  const preview = document.getElementById('image-preview');
  //要素がなければここで終了//
  if(!imageField) return null;

  imageField.addEventListener('change', function(e) {
    const file = e.target.files[0];
    const imageUrl = URL.createObjectURL(file);
    preview.src = imageUrl;
  });
});