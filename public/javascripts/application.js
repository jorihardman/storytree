$(document).ready(function() {
  $('#branches').hide();
  $('#branches').slideDown('fast');

  $('.page').click(function() {
    leaf_id = this.id;
    $(this).animate({marginLeft: '0px'}, 'fast', function() {
      $('.page').each(function() {
        if (parseInt(this.id) > parseInt(leaf_id)) {
          $(this).fadeOut('fast');
        }
      });
      $('#branches').slideUp('fast', function() {
        window.location = '/leaves/'+leaf_id;
      });
    });
  });

  $('.branch').click(function() {
    leaf_id = this.id;
    $(this).animate({marginLeft: '0px'}, 'fast', function() {
      $('#branches').slideUp('fast', function() {
        $('#'+leaf_id)
          .hide()
          .html($('#'+leaf_id).html().replace(/\[\d+\]/, ''))
          .attr('class', 'page')
          .appendTo('#story')
          .slideDown('fast', function() {
            window.location = '/leaves/'+leaf_id;
          });
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
