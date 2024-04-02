//　プレゼント投稿画面のプレビュー表示//
document.addEventListener('turbo:load', function(){
  const postForm = document.getElementById('new_post');
  const previewList = document.getElementById('previews');

  if (!postForm) return;

  //input要素を取得
  const fileField = document.querySelector('input[type="file"][name="present[image]"]');
  //要素がなかったら終了
  if (!fileField) return;

  // input要素で値の変化が起きた際に呼び出される関数
  fileField.addEventListener('change', function(e){
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
});
