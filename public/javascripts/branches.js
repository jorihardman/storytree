$(document).ready(function() {
  $("#story").scrollTop($("#story")[0].scrollHeight);
  $('#branches').slideDown('fast');
  bindAncestors();
  bindBranches();
  bindPageLinks();
});

function bindAncestors() {
  $('.ancestor').click(function() {
    leaf_id = this.id;
    $('html, body').animate({scrollTop: $('#story').offset().top}, 'fast', function() {
      $('.ancestor, .leaf').each(function() {
        if (parseInt(this.id) > parseInt(leaf_id)) {
          $(this).fadeOut('fast');
        }
      });
      $('#branches').slideUp('fast', function() {
          window.location = leaf_id;
      });
    });
  });
}

function bindBranches() {
  $('.branch').click(function() {
    leaf_id = this.id;
    $('#branches').slideUp('fast', function() {
      $('#'+leaf_id+' > .stats').hide()
      $('#'+leaf_id)
        .hide()
        .attr('class', 'ancestor')
        .appendTo('#story')
        .slideDown('fast', function() {
          window.location = leaf_id;
        });
    });
  });

  $('.branch, .ancestor').hover(
    function() {
      $(this).css('background-color','#ceedfc');
    },
    function() {
      $(this).css('background-color','transparent');
    }
  );
}

function bindPageLinks() {
  $('.pagination a').click(function () {
    $('html, body').animate({scrollTop: $('#story').offset().top}, 'fast');
  });
}
