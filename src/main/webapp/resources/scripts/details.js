jQuery(document).ready(function($) {

	// Back to Top Button
    	var duration = 500;
    	$('.back-to-top').click(function(event) {
          event.preventDefault();
          $('html, body').animate({scrollTop: 0}, duration);
          return false;
	});

	// Main Menu Dropdown Toggle
	$('.menu-item-has-children a').click(function(event){
	  event.stopPropagation();
	  location.href = this.href;
  	});

	$('.menu-item-has-children').click(function(){
    	  $(this).addClass('toggled');
    	  if($('.menu-item-has-children').hasClass('toggled'))
    	  {
    	  $(this).children('ul').toggle();
	  $('.fly-nav-menu').getNiceScroll().resize();
	  }
	  $(this).toggleClass('tog-minus');
    	  return false;
  	});

	// Main Menu Scroll
	$(window).load(function(){
	  $('.fly-nav-menu').niceScroll({cursorcolor:"#888",cursorwidth: 7,cursorborder: 0,zindex:999999});
	});
});