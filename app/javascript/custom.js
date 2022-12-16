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

// $('div#clock1').countdown("2022/12/15 11:00:00")
//     .on('update.countdown', callback)
//     .on('finish.countdown', callback);

document.addEventListener('DOMContentLoaded', function(){
    (function(){
        let sr = document.querySelectorAll('.my-star');
        let i = 0;
        //loop through stars
        while (i < sr.length){
            //attach click event
            sr[i].addEventListener('click', function(){
                //current star
                let cs = parseInt(this.getAttribute("data-star"));
                //output current clicked star value
                document.querySelector('#rate').value = cs;
                /*our first loop to set the class on preceding star elements*/
                let pre = cs; //set the current star value
                //loop through and set the active class on preceding stars
                while(1 <= pre){
                    //check if the classlist contains the active class, if not, add the class
                    if(!document.querySelector('.star-'+pre).classList.contains('is-active')){
                        document.querySelector('.star-'+pre).classList.add('is-active');
                    }
                    //decrement our current index
                    --pre;
                }//end of first loop

                /*our second loop to unset the class on succeeding star elements*/ 
                //loop through and unset the active class, skipping the current star
                let succ = cs+1;
                while(5 >= succ){
                    //check if the classlist contains the active class, if yes, remove the class
                    if(document.querySelector('.star-'+succ).classList.contains('is-active')){
                        document.querySelector('.star-'+succ).classList.remove('is-active');
                    }
                    //increment current index
                    ++succ;
                }

            })//end of click event
            i++;
        }//end of while loop
    })();//end of function
})