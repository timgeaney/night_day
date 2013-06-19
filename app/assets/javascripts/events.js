
$(window).load(function() {

    var $container = $('#events');
//   initialize
    $container.masonry({
      itemSelector: '.item'
  });

  $(function(){

    $("#reverse").on("click",function(e){
        $(".flipbox").flippyReverse();
        e.preventDefault();
    });

  	  $("#flip").on("click", function(e){
  	    $(".flipbox").flippy({
        color_target: "white",
        duration: "1000",
        verso: "woohoo"
  	  });
  	    e.preventDefault();
  	  
   });




  });
    
});

