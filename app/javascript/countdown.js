(function () {
    const second = 1000,
          minute = second * 60,
          hour = minute * 60,
          day = hour * 24;
        submitB = document.getElementById("submitExam")
        var x = setInterval(function() {  
          let exam_id = document.getElementById('mycontainer').dataset.name;
          if (localStorage.getItem(`exam_${exam_id}`)) {
            create_time = localStorage.getItem(`exam_${exam_id}`);
          } else {
            var create_time = document.getElementById('mycontainer').dataset.source
            create_time = Math.round(create_time)
            localStorage.setItem(`exam_${exam_id}`, create_time);
          }
      
          var distance = document.getElementById("timeout").innerText*60*1000
          var countdown = 0

            
            countdown = distance - (Date.now() - create_time*1000)
            if (countdown < 0) {
              localStorage.removeItem(`exam_${exam_id}`);
              submitB.click();
              clearInterval(x);
            }
            document.getElementById("hours").innerText = Math.floor((countdown % (day)) / (hour)),
            document.getElementById("minutes").innerText = Math.floor((countdown % (hour)) / (minute)),
            document.getElementById("seconds").innerText = Math.floor((countdown % (minute)) / second);

        }, 1000)
    }());