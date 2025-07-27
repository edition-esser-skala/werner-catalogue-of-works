// source: https://mickael.canouil.fr/posts/2023-05-30-quarto-light-dark/

function updateImageSrc() {
  var bodyClass = window.document.body.classList;
  var images = window.document.getElementsByClassName('has-dark-version');
  for (var i = 0; i < images.length; i++) {
    var image = images[i];
    var src = image.src;
    var newSrc = src;
    if (bodyClass.contains('quarto-light') && src.includes('_dark')) {
      newSrc = src.replace('_dark', '_light');
    } else if (bodyClass.contains('quarto-dark') && src.includes('_light')) {
      newSrc = src.replace('_light', '_dark');
    }
    if (newSrc !== src) {
      image.src = newSrc;
    }
  }
}

var observer = new MutationObserver(function(mutations) {
  mutations.forEach(function(mutation) {
    if (mutation.type === 'attributes' && mutation.attributeName === 'class') {
      updateImageSrc();
    }
  });
});

observer.observe(window.document.body, {
  attributes: true
});

updateImageSrc();
