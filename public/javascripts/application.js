$(document).ready(function() {
  $('.page').click(function() {window.location = '/leaves/'+this.id});

  $('.branch').click(function() {
    $(this).animate({marginLeft: '0px'}, 'fast');
    $.post('/leaves/climb', {id: this.id});
  });

  $('.branch').hover(
    function() {
      $(this).animate({marginLeft: '10px'}, 'fast');
    },
    function() {
      $(this).animate({marginLeft: '0px'}, 'fast');
    }
  );
});
