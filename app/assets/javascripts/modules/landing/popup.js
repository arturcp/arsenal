(function() {
  "use strict"; // use strict to start

  $(document).ready(function() {
    /* === magnificPopup === */
    if ($('.popup-video').length > 0) {
      $('.popup-video').magnificPopup({
        disableOn: 700,
        type: 'iframe',
        mainClass: 'mfp-fade',
        removalDelay: 160,
        preloader: false,
        fixedContentPos: false
      });
    }
  });
})(jQuery);
