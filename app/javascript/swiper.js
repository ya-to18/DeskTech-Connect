document.addEventListener('DOMContentLoaded', function(){
  let slidesPerViewOptions = 4.5;
  if (document.querySelector('.page-specific-class')) {
    slidesPerViewOptions = 5.5;
  }

  new Swiper('.swiper', {
    slidesPerView: slidesPerViewOptions,
    spaceBetween: 10,

    pagination: {
      el: '.swiper-pagination',
    },

    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },

    scrollbar: {
      el: '.swiper-scrollbar',
      hide: true,
    },
  });
});
