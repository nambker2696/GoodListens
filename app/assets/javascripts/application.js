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
//= require masonry/jquery.masonry
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require froala_editor.min.js
//= require plugins/image.min.js
//= require toastr

$(document).on('click', '.reply-link', function(event) {
  event.preventDefault();
  $(this).parent().parent().next('.replies').children('.comment')
    .removeClass('hide');
  var replyForm = $(this).closest('.comment').find('.new_comment');
  replyForm.removeClass('hide-form');
  replyForm.find('.reply-textfield')[0].focus();
})

$(document).on('turbolinks:load', function() {
  $('.toast').delay(5000).fadeOut();

  $('#comments_list').children('.comment').addClass('hide');
  $('#comments_list').children('.replies')
    .children('.comment').addClass('hide');

  $('.toggle-comments').on('click', function(event) {
    event.preventDefault();
    if($(this).context.dataset.type == 'view') {
      $(this).html(
        '<i class="fa fa-eye-slash" aria-hidden="true"></i>'
        + ' Hide all comments');
      $(this).attr('data-type', 'hide');
      $('#comments_list').children('.comment').removeClass('hide');
    }
    else {
      $(this).html(
        '<i class="fa fa-eye" aria-hidden="true"></i>'
        + ' View all comments');
      $(this).attr('data-type', 'view');
      $('#comments_list').children('.comment').addClass('hide');
      $('#comments_list').children('.replies')
        .children('.comment').addClass('hide');
        $('#comments_list').children('.comment').find('.new_comment')
          .addClass('hide-form')
    }
  });

  /* $('.reply-link').on('click', function(event) {
    event.preventDefault();
    $(this).parent().parent().next('.replies').children('.comment')
      .removeClass('hide');
    var replyForm = $(this).closest('.comment').find('.new_comment');
    replyForm.removeClass('hide-form');
    replyForm.find('.reply-textfield')[0].focus();
  }); */

  $('.comment-btn').on('click', function(event) {
    event.preventDefault();
    $('#comment-textbox').focus();
  });

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
//________rate  star js

  var default_rate_value = $('.new-rate-container').attr('value')
  
  if (default_rate_value > 0) {
    var stars = $('.new-rate-container #stars').children('li.star');

    for (i = 0; i < default_rate_value; i++) {
      $(stars[i]).addClass('selected');
    }
    $('#rate_value').val(default_rate_value)
    console.log($('#rate_value').prop('value'))
  }

  $('.new-rate-container #stars li').on('mouseover', function(){
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

  $('.new-rate-container #stars li').on('click', function(){
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
//_____end rate star

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
  //________category
  let checkingValue = new Array(100);

  set_default_view($('#category-checkbox input:checked'));



  $('#category-checkbox input').on('click', function(event) {
    console.log("hello")
    var defaultValue = parseInt($(this).prop('value'));

    if ($(this).prop('checked')){
      checkingValue.push(defaultValue)
      $('.song_element').each(function() {
        if ($(this).data('temp').indexOf(defaultValue) > -1) 
          $(this).css("display","inline-block")
        });
      }
    else {
      checkingValue.slice(checkingValue.indexOf(defaultValue))
      $('.song_element').each(function() {
        if (($(this).data('temp').indexOf(defaultValue) > -1) && valueIsValid(($(this).data('temp'))))
          $(this).css("display","none")
        });
    }
  })

  function set_default_view(obj){
    var defaultValue =  parseInt($(obj).prop('value'));

    checkingValue.push(defaultValue);

    $('.song_element').each(function() {
      if (($(this).data('temp').indexOf(defaultValue) > -1) )
        $(this).css("display","inline-block")
    });
    
    }

  function valueIsValid(value_array) {
    for(i =0; i< checkingValue.length;i++) {
      if (value_array.indexOf(checkingValue[i]) > -1)
        return true;
    }
    return false;
  }
  //____end category js
});
