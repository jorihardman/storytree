$(document).ready(function() {
  $('#branches').slideDown('fast');
  bindPages();
  bindBranches();
  validateSeeds();
});

function bindPages() {
  $('.page').click(function() {
    leaf_id = this.id;
    $(this).animate({marginLeft: '0px'}, 'fast', function() {
      $('.page').each(function() {
        if (parseInt(this.id) > parseInt(leaf_id)) {
          $(this).fadeOut('fast');
        }
      });
      $('#branches').slideUp('fast', function() {
        window.location = leaf_id + '#story';
      });
    });
  });
}

function bindBranches() {
  $('.branch').click(function() {
    leaf_id = this.id;
    $(this).animate({marginLeft: '0px'}, 'fast', function() {
      $('#branches').slideUp('fast', function() {
        $('#'+leaf_id+' > .stats').hide()
        $('#'+leaf_id)
          .hide()
          .attr('class', 'page')
          .appendTo('#story')
          .slideDown('fast', function() {
            window.location = leaf_id + '#story';
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
}

function validateSeeds() {
  $('#new_leaf').validate({
    rules: {
      'leaf[leaf_text]': {
        minlength: 10,
        required: true
      }
    }
  });
}
