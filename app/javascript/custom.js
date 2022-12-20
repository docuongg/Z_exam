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


$('DOMContentLoaded', function(){
    (function(){
        let sr = $('.my-star');
        let i = 0;
        //loop through stars
        while (i < sr.length){
            //attach click event
            sr[i].addEventListener('click', function(){
                //current star
                let cs = parseInt(this.getAttribute("data-star"));
                //output current clicked star value
                $('#rate').val(cs);
                /*our first loop to set the class on preceding star elements*/
                let pre = cs; //set the current star value
                //loop through and set the active class on preceding stars
                while(1 <= pre){
                    //check if the classlist contains the active class, if not, add the class
                    if(!$('.star-'+pre).hasClass('is-active')){
                        $('.star-'+pre).addClass('is-active');
                    }
                    //decrement our current index
                    --pre;
                }//end of first loop

                /*our second loop to unset the class on succeeding star elements*/ 
                //loop through and unset the active class, skipping the current star
                let succ = cs+1;
                while(5 >= succ){
                    //check if the classlist contains the active class, if yes, remove the class
                    if($('.star-'+succ).hasClass('is-active')){
                        $('.star-'+succ).removeClass('is-active');
                    }
                    //increment current index
                    ++succ;
                }

            })//end of click event
            i++;
        }//end of while loop
    })();//end of function
})