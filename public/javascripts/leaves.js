$(document).ready(function() {
  $('#branches').slideDown('fast');
  bindStory();
  bindBranches();
  bindPageLinks();
});

function bindStory() {
  $('.page').click(function() {
    leaf_id = this.id;
    $(this).animate({marginLeft: '0px'}, 'fast', function() {
      $('html, body').animate({scrollTop:0}, 'fast', function() {
        $('.page').each(function() {
          if (parseInt(this.id) > parseInt(leaf_id)) {
            $(this).fadeOut('fast');
          }
        });
        $('#branches').slideUp('fast', function() {
          window.location = leaf_id;
        });
      });
    });
  });
}

function bindBranches() {
  $('.branch').live('click', function() {
    leaf_id = this.id;
    $(this).animate({marginLeft: '0px'}, 'fast', function() {
      $('html, body').animate({scrollTop:0}, 'fast', function() {
        $('#branches').slideUp('fast', function() {
          $('#'+leaf_id+' > .stats').hide()
          $('#'+leaf_id)
            .hide()
            .attr('class', 'page')
            .appendTo('#story')
            .slideDown('fast', function() {
              window.location = leaf_id;
            });
        });
      });
    });
  });

  $('.branch, .page').live('mouseover mouseout', function(event) {
    if (event.type == 'mouseover') {
      $(this).animate({marginLeft: '10px'}, 'fast');
    } else {
      $(this).animate({marginLeft: '0px'}, 'fast');
    }
  });
}

function bindPageLinks() {
  $('.pagination a').click(function () {
    $('html, body').animate({scrollTop:0}, 'fast');
  });
}
