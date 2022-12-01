$(document).ready(function(){
    $(".owl-carousel").owlCarousel();
  });
  
$('.loop').owlCarousel({
    center: true,
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