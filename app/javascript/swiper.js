document.addEventListener('DOMContentLoaded', function(){
  new Swiper('.swiper', {
    // Optional parameters
    loop: true,
    slidesPerView: 3,
    // autoplay: { // 自動再生
    //   delay: 1000, // 3秒後に次のスライド
    // },
    // If we need pagination
    pagination: {
      el: '.swiper-pagination',
    },
  
    // Navigation arrows
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  
    // And if we need scrollbar
    scrollbar: {
      el: '.swiper-scrollbar',
    },
  });
});
