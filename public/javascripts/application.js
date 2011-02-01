$(document).ready(function() {
  $('.page').click(function() {
    $(this).animate({marginLeft: '0px'}, 'fast', function() {
      leaf = this.id;
      $('.page').each(function() {
        if (parseInt(this.id) > parseInt(leaf)) {
          $(this).fadeOut('fast');
        }
      })
      window.location = '/leaves/'+this.id
    });
  });

  $('.branch').click(function() {
    $(this).animate({marginLeft: '0px'}, 'fast', function() {
      $(this).slideUp('fast', function() {
        $(this)
          .hide()
          .html($(this).html().replace(/\[\d+\]/, ''))
          .attr('class', 'page')
          .appendTo('#story')
          .slideDown('fast', function () {
            window.location = '/leaves/'+this.id;
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
