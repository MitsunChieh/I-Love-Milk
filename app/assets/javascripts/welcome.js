
  $(function(){
    $('.pic').append($('.pic li:first').clone())
    var now_index = 0;
    var picCount = $('.pic li').length;
    var sliderW = $('.slider').width();
    var ulWidth = picCount * sliderW;
    $('.pic').width(ulWidth);
    $('.pic li').width(sliderW);
    $('.control').css({width: sliderW, marginLeft: -sliderW/2});
    for (var i = 0; i < picCount -1; i++) {
      $('.control').append('<li><a href="javascrip:;" class='+i+'></a></li>')
    }
    var dt = 3000;
    var at = 400;
    btnNow();
    setTimeout(pp, dt);
    function pp(){
      if(now_index < picCount-1){
        $('.pic').animate({left: now_index * sliderW * -1}, at, btnNow);
        setTimeout(pp, dt);
      }else{
        $('.pic').animate({left: now_index * sliderW * -1}, at, sliderWReset);
      }
    }
    function sliderWReset(){
      $('.pic').css({left: 0})
      now_index = 0;
      btnNow();
      setTimeout(pp, dt-at);
    }
    function btnNow(){
      $('.control li').eq(now_index).addClass('now').siblings('.now').removeClass('now');
      now_index++;
    }
  })