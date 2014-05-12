$(function() {
    $('.slider').slider({'min': 0, 'max': 5, 'value': 0, 'step': 0.5, 'tooltip': 'hide'})
                .on('slide', function(ev) {
                  var value = ev.value;
                  var colour = "#C0C0C0";

                  if(value == 5) {
                    colour = '#6CF556';
                  } else if(value >= 4.5) {
                    colour = '#89F556';
                  } else if(value >= 4) {
                    colour = '#A7F556';
                  } else if(value >= 3.5) {
                    colour = '#C5F556';
                  } else if(value >= 3) {
                    colour = '#E3F556';
                  } else if(value >= 2.5) {
                    colour = '#F5E856';
                  } else if(value >= 2) {
                    colour = '#F5CA56';
                  } else if(value >= 1.5) {
                    colour = '#F5AC56';
                  } else if(value >= 1) {
                    colour = '#F58E56';
                  } else if(value >= 0.5) {
                    colour = '#F57156';
                  }

                  var indicator = $(this).closest('div[class^="indicator "]');
                  var textElement = indicator.children('.score').children('.indicator-excluded');
                  if(value == 0) {
                    textElement.html('<i class="fa fa-ban"></i>No vote');
                  } else {
                    textElement.html('&nbsp;');
                  }

                  indicator.css('background', colour);
                });

    var previousComment = '';
    $('.comment-button').on('click', function(e) {
      var indicator = $(this).closest('div[class^="indicator "]');
      previousComment = indicator.find('.indicator-comment').val();
    });
    $('.cancel-comment').on('click', function(e) {
      e.preventDefault();
      var indicator = $(this).closest('div[class^="indicator "]');
      indicator.find('.indicator-comment').val(previousComment);
      indicator.children('.modal').modal('hide'); 
    });
    $('.save-comment').on('click', function(e) {
      e.preventDefault();
      var indicator = $(this).closest('div[class*="indicator"]');
      indicator.children('.modal').modal('hide'); 
    });
  });