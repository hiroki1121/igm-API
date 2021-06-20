document.addEventListener('DOMContentLoaded', () => {
  if (document.getElementById('image-select')) {
    const imageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');

      blobImage.setAttribute('src', blob);
      imageElement.appendChild(blobImage);
      imageList.appendChild(imageElement);

      blobImage.width = 400;
      blobImage.height = 300;
    }

    document.getElementById('image-select').addEventListener('change', function(e) {

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  }
});