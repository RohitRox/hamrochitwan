// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require fancybox
//= require_tree .

$(function(){
	$('.carousel').carousel();
  $('.redactor').redactor();
  $("a.fancybox").fancybox().append('<img src="/assets/zoom.png" class="zoom" />');
  $(document).on('change','.gallery-upload-preview', function(){
    var self = this;
    var oFReader = new FileReader();
    oFReader.readAsDataURL(this.files[0]);
    oFReader.onload = function (oFREvent) {
      $(self).parents('.fields').find('img').remove().end().prepend('<img src="'+oFREvent.target.result+'" class="rem-el" />');
    };
  });
  $('#post_photo, #page_picture').change(function(){
    var self = this;
    var oFReader = new FileReader();
    oFReader.readAsDataURL(this.files[0]);
    oFReader.onload = function (oFREvent) {
      $(self).parent().find('img').remove().end().prepend('<img src="'+oFREvent.target.result+'" class="wid-mb" />');
    };
  });
});