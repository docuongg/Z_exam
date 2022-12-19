jQuery(document).ready(function () {
  const second = 1000,
        minute = second * 60,
        hour = minute * 60,
        day = hour * 24;

  submitButton = $("#submitExam")

  var x = setInterval(function() {  
    let examId = $('#mycontainer').data("name")
    if (localStorage.getItem(`exam_${examId}`)) {
      createTime = localStorage.getItem(`exam_${examId}`);
    } else {
      var createTime = $('#mycontainer').data("source")
      createTime = Math.round(createTime)
      localStorage.setItem(`exam_${examId}`, createTime);
    }
    
    var distance = $("#timeout").text()*60*1000
    var countdown = 0
    countdown = distance - (Date.now() - createTime*1000)
    if (countdown < 0) {
      localStorage.removeItem(`exam_${examId}`);
      submitB.click();
      clearInterval(x);
    }
    submitButton.click (function(e) {
      clearInterval(x);
      localStorage.removeItem(`exam_${examId}`);
    });
    $('#hours').text(Math.floor((countdown % (day)) / (hour))),
    $('#minutes').text(Math.floor((countdown % (hour)) / (minute))),
    $('#seconds').text(Math.floor((countdown % (minute)) / second));

  }, 1000)
}());