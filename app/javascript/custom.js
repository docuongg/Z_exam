// owlCarousel
$(document).ready(function(){
    $(".owl-carousel").owlCarousel();
  });
  
$('.loop').owlCarousel({
    center: false,
    items:2,
    loop:true,
    margin:10,
    responsive:{
        600:{
            items:3
        }
    }
});
$('.nonloop').owlCarousel({
    center: true,
    items:3,
    loop:false,
    margin:10,
    responsive:{
        600:{
            items:4
        }
    }
});

// rating
$('input').rating({
    start: 5,
    stop: 10
  });

  $('input').on('change', function () {
    alert('Rating: ' + $(this).val());
  });