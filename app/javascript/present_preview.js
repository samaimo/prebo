// プレゼント投稿画面のプレビュー表示
document.addEventListener('turbo:load', function(){
  const postForm = document.getElementById('new_post');
  const previewList = document.getElementById('previews');

  // boxImage の場合
  const boxFileField = document.querySelector('input[type="file"][name="box[image]"]');
  if (boxFileField) {
    boxFileField.addEventListener('change', function(e) {
      // boxImage が選択されたときの処理を書く
      if (!postForm) return;

      // 古いプレビューが存在する場合は削除
      const alreadyPreview = document.querySelector('.preview');
      if (alreadyPreview) {
        alreadyPreview.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      const previewWrapper = document.createElement('div');
      previewWrapper.classList.add('preview');

      const previewImage = document.createElement('img');
      previewImage.classList.add('preview-image');
      previewImage.src = blob;

      previewWrapper.appendChild(previewImage);
      previewList.appendChild(previewWrapper);
    });
  }

  // presentImageの場合
  const presentFileField = document.querySelector('input[type="file"][name="present[image]"]');
  if (presentFileField) {
    presentFileField.addEventListener('change', function(e) {
      // presentImage が選択されたときの処理を書く
      if (!postForm) return;

      // 古いプレビューが存在する場合は削除
      const alreadyPreview = document.querySelector('.preview');
      if (alreadyPreview) {
        alreadyPreview.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      const previewWrapper = document.createElement('div');
      previewWrapper.classList.add('preview');

      const previewImage = document.createElement('img');
      previewImage.classList.add('preview-image');
      previewImage.src = blob;

      previewWrapper.appendChild(previewImage);
      previewList.appendChild(previewWrapper);
    });
  }
});
