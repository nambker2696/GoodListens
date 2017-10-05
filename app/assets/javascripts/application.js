// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require toastr
//= require masonry/jquery.masonry
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require froala_editor.min.js
//= require plugins/image.min.js

$(document).on('turbolinks:load', function(){
  $('a.internal_link').on('click', function(event) {
    if (this.hash !== '') {
      event.preventDefault();
      
      var hash = this.hash;
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 1100, function(){  
        window.location.hash = hash;
      });
    }
  });

  $(':button#add_review').on('click', function() {
    $('.review_form').css('display', 'block');
  });

  $('.close_form').click(function(){
    var curr = $(this).parentsUntil('.review_form').parent('.review_form')
    curr.css('display', 'none');
  });

  $('.review_form').on('click',function(event) {
     $('.review_form').css('display', 'none');
  }).on('click','.review_form_content',function(e){
    e.stopPropagation();
  });

  $('#stars li').on('mouseover', function(){
    var onStar = parseInt($(this).data('value'), 10); 
   
    $(this).parent().children('li.star').each(function(e){
      if (e < onStar) {
        $(this).addClass('hover');
      }
      else {
        $(this).removeClass('hover');
      }
    });
  }).on('mouseout', function(){
    $(this).parent().children('li.star').each(function(e){
      $(this).removeClass('hover');
    });
  });

  $('#stars li').on('click', function(){
    var onStar = parseInt($(this).data('value'), 10);
    var stars = $(this).parent().children('li.star');
    
    for (i = 0; i < stars.length; i++) {
      $(stars[i]).removeClass('selected');
    }
    
    for (i = 0; i < onStar; i++) {
      $(stars[i]).addClass('selected');
    }

    var ratingValue = parseInt($('#stars li.selected').last().data('value'), 10);
    $('#rate_value').val(ratingValue)
  });

  toastr.options = {
    'closeButton': false,
    'debug': false,
    'newestOnTop': false,
    'progressBar': false,
    'positionClass': 'toast-top-right',
    'preventDuplicates': false,
    'onclick': null,
    'showDuration': '300',
    'hideDuration': '1000',
    'timeOut': '5000',
    'extendedTimeOut': '1000',
    'showEasing': 'swing',
    'hideEasing': 'linear',
    'showMethod': 'fadeIn',
    'hideMethod': 'fadeOut'
  }

  $('selector').froalaEditor();

  $(function() {
    $('textarea#froala-editor').froalaEditor({
      imageStyles: {
        class1: 'Class 1',
        class2: 'Class 2'
      },
      imageEditButtons: ['imageReplace', 'imageAlign', 'imageRemove', '|',
        'imageLink', 'linkOpen', 'linkEdit', 'linkRemove', '-', 'imageDisplay',
        'imageStyle', 'imageAlt', 'imageSize']
    })
  });
});
