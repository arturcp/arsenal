/*
Template Name: materialize
Author: TrendyTheme
Version: 1.5
*/

;
(function() {
  "use strict"; // use strict to start

  $(document).ready(function() {
    /* === Page scrolling feature - requires jQuery Easing plugin === */
    $('a.page-scroll').on('click', function(event) {
      var $anchor = $(this);
      $('html, body').stop().animate({
          scrollTop: $($anchor.attr('href')).offset().top - 60
      }, 1500, 'easeInOutExpo');
      event.preventDefault();
    });

    /* === Full Screen Banner === */
    $(window).on('resizeEnd', function() {
      $(".fullscreen-banner").height($(window).height());
    });

    $(window).resize(function() {
      if (this.resizeTO) clearTimeout(this.resizeTO);
      this.resizeTO = setTimeout(function() {
          $(this).trigger('resizeEnd');
      }, 300);
    }).trigger("resize");

    /* === Detect IE version === */
    (function() {
      function getIEVersion() {
          var match = navigator.userAgent.match(/(?:MSIE |Trident\/.*; rv:)(\d+)/);
          return match ? parseInt(match[1], 10) : false;
      }

      if (getIEVersion()) {
          $('html').addClass('ie' + getIEVersion());
      }
    }());

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

    /* ======= Stellar for background scrolling ======= */
    if ($('.parallax-bg').length > 0) {
      $('.parallax-bg').imagesLoaded(function() {
        $(window).stellar({
          horizontalScrolling: false,
          verticalOffset: 0,
          horizontalOffset: 0,
          responsive: true,
          hideDistantElements: true
        });
      });
    }
  });
})(jQuery);
