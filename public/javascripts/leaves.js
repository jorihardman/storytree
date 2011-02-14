function bindAncestors() {
  $('.ancestor').click(function() {
    leaf_id = this.id;
    $(this).animate({marginLeft: '0px'}, 'fast', function() {
      $('html, body').animate({scrollTop: $('#story').offset().top}, 'fast', function() {
        $('.ancestor').each(function() {
          if (parseInt(this.id) > parseInt(leaf_id)) {
            $(this).fadeOut('fast');
          }
        });
        $('#branches').slideUp('fast', function() {
          window.location = leaf_id+'#story';
        });
      });
    });
  });
}

function bindBranches() {
  $('.branch').click(function() {
    leaf_id = this.id;
    $(this).animate({marginLeft: '0px'}, 'fast', function() {
      $('html, body').animate({scrollTop: $('#story').offset().top}, 'fast', function() {
        $('#branches').slideUp('fast', function() {
          $('#'+leaf_id+' > .stats').hide()
          $('#'+leaf_id)
            .hide()
            .attr('class', 'ancestor')
            .appendTo('#story')
            .slideDown('fast', function() {
              window.location = leaf_id+'#story';
            });
        });
      });
    });
  });

  $('.branch, .ancestor').hover(
    function() {
      $(this).animate({marginLeft: '5px'}, 'fast');
    },
    function() {
      $(this).animate({marginLeft: '0px'}, 'fast');
    }
  );
}

function bindPageLinks() {
  $('.pagination a').click(function () {
    $('html, body').animate({scrollTop: $('#story').offset().top}, 'fast');
  });
}
