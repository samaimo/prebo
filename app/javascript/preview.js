window.addEventListener('DOMContentLoaded', function() {
  const imageField = document.getElementById('box-image');
  const preview = document.getElementById('image-preview');

  imageField.addEventListener('change', function(e) {
    const file = e.target.files[0];
    const imageUrl = URL.createObjectURL(file);
    preview.src = imageUrl;
  });
});