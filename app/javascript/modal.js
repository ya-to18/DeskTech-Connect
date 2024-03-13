document.addEventListener('turbo:load', (event) => {
  document.querySelector('.modal-close').addEventListener('click', function() {
    document.getElementById('modal').classList.add('hidden');
  });

  document.querySelector('.modal-background').addEventListener('click', function() {
    document.getElementById('modal').classList.add('hidden');
  });

  document.body.addEventListener('click', function(event) {
    if (event.target.classList.contains('modal-trigger')) {
      document.addEventListener('turbo:frame-load', function(event) {
        if (event.target.id == 'modal_frame') {
          document.getElementById("modal").classList.remove("hidden");
        };
      });
    }
  });
});
