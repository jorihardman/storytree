$(document).ready(function() {
  $('#branches').hide();
  $('#branches').slideDown('fast');

  $('.page').click(function() {
    leaf_id = this.id;
    $(this).animate({marginLeft: '0px'}, 'fast', function() {
      $('.page').each(function() {
        if (parseInt(this.id) > parseInt(leaf)) {
          $(this).fadeOut('fast');
        }
      });
      slideAndRedirect(leaf_id);
    });
  });

  $('.branch').click(function() {
    leaf_id = this.id;
    $(this).animate({marginLeft: '0px'}, 'fast', function() {
      $(this).slideUp('fast', function() {
        $(this)
          .hide()
          .html($(this).html().replace(/\[\d+\]/, ''))
          .attr('class', 'page')
          .appendTo('#story')
          .slideDown('fast', slideAndRedirect(leaf_id));
      });
    });
  });

  $('.branch, .page').hover(
    function() {
      $(this).animate({marginLeft: '10px'}, 'fast');
    },
    function() {
      $(this).animate({marginLeft: '0px'}, 'fast');
    }
  );
});

function slideAndRedirect(leaf_id) {
  $('#branches').slideUp('slow', function() {
    window.location = '/leaves/'+leaf_id;
  });
}
