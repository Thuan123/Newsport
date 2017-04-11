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



	// Infinite Scroll
	/*$('.infinite-content').infinitescroll({
	  navSelector: ".nav-links",
	  nextSelector: ".nav-links a:first",
	  itemSelector: ".infinite-post",
	  loading: {
		msgText: "Loading more posts...",
		finishedMsg: "Sorry, no more posts"
	  },
	  errorCallback: function(){ $(".inf-more-but").css("display", "none") }
	});
	$(window).unbind('.infscr');
	$(".inf-more-but").click(function(){
   		$('.infinite-content').infinitescroll('retrieve');
        	return false;
	});
	$(window).load(function(){
		if ($('.nav-links a').length) {
			$('.inf-more-but').css('display','inline-block');
		} else {
			$('.inf-more-but').css('display','none');
		}
	});*/

	// Biến dùng kiểm tra nếu đang gửi ajax thì ko thực hiện gửi thêm
	var is_busy = false;
	     
	
	 
	$(document).ready(function()
	{
		// Biến lưu trữ trang hiện tại
		var page = 1;
		 
		// Số record trên mỗi trang
		var record_per_page = 3;
		 
		// Biến lưu trữ rạng thái phân trang 
		var stopped = false;
		
	    // Khi kéo scroll thì xử lý
	    $('.inf-more-but').click(function()
	    {
	        // Element append nội dung
	       // $element = $('.infinite-content');
	 
	        // ELement hiển thị chữ loadding
	        //$button = $(this);
	    	//$loadding = $('.loading'); 
	    	
	        // Nếu đang gửi ajax thì ngưng
	        if (is_busy == true) {
	            return false;
	        }
	         
	        // Tăng số trang lên 1
	        page++;
	 
	        // Hiển thị loadding ...
	        $('.inf-more-but').html('LOADDING ...');
	 
	        // Gửi Ajax
	        $.ajax(
	        {
	            type: 'post',
	            dataType: 'text',
	            url: '/controller/loadmorenews',
	            data: {page: page},
	            success: function(result)
	            {
	            	var html = '';
	            	if(result.length<=record_per_page){
	            		$.each(JSON.parse(result), function(idx, obj) {
	            			var baseUrl = '<c:url value="/details/${obj.id}" />';
	            			html +="<li class='infinite-post'><a href= '/controller/details/"+obj.id+"'"+ "rel='bookmark' title='News Sport'>"+
	            			"<div class='archive-list-out'>"+
							"<div class='archive-list-img left relative'>"+
								"<img width='450' height='270' src="+obj.cover_url+
									"class='reg-img wp-post-image' alt='woman-beach2' sizes='(max-width: 450px) 100vw, 450px'/>" +
								"<img width='80' height='80' src="+obj.cover_url+
									"class='mob-img wp-post-image' alt='woman-beach2' sizes='(max-width: 80px) 100vw, 80px' />"+
							"</div>"+
							"<div class='archive-list-in'>"+
							  "<div class='archive-list-text left relative'>"+
								"<span class='side-list-cat'>Sport</span>"+
								"<h2>"+obj.title+"</h2>"+
								"<p>"+obj.abstract_content+"</p>"+
							  "</div>"+
						    "</div>"+
							"</div>"+
							"</a></li>";
	            			
		            	});
	            		$('.infinite-content').append(html);
	            		$('.inf-more-but').remove();
	            	}else{
	            		$.each(JSON.parse(result), function(idx, obj) {
	            			var baseUrl = '<c:url value="/details/${obj.id}" />';
	            			html +="<li class='infinite-post'><a href= '/controller/details/"+obj.id+"'"+ "rel='bookmark' title='News Sport'>"+
	            			"<div class='archive-list-out'>"+
							"<div class='archive-list-img left relative'>"+
								"<img width='450' height='270' src="+obj.cover_url+
									"class='reg-img wp-post-image' alt='woman-beach2' sizes='(max-width: 450px) 100vw, 450px'/>" +
								"<img width='80' height='80' src="+obj.cover_url+
									"class='mob-img wp-post-image' alt='woman-beach2' sizes='(max-width: 80px) 100vw, 80px' />"+
							"</div>"+
							"<div class='archive-list-in'>"+
							  "<div class='archive-list-text left relative'>"+
								"<span class='side-list-cat'>Sport</span>"+
								"<h2>"+obj.title+"</h2>"+
								"<p>"+obj.abstract_content+"</p>"+
							  "</div>"+
						    "</div>"+
							"</div>"+
							"</a></li>";
	            			
		            	});
	            		$('.infinite-content').append(html);
	            	}
	            	
	            },
                error:function(data,status,er) { 
                    alert("error: ");
                }
	        })
	        .always(function()
	        {
	            // Sau khi thực hiện xong thì đổi giá trị cho button
	            $('.inf-more-but').html('MORE POSTS');
	            is_busy = false;
	        });
	 
	    });
	});
	
$(window).load(function() {
  // The slider being synced must be initialized first
  $('.post-gallery-bot').flexslider({
    animation: "slide",
    controlNav: false,
    animationLoop: true,
    slideshow: false,
    itemWidth: 80,
    itemMargin: 10,
    asNavFor: '.post-gallery-top'
  });

  $('.post-gallery-top').flexslider({
    animation: "fade",
    controlNav: false,
    animationLoop: true,
    slideshow: false,
    	  prevText: "&lt;",
          nextText: "&gt;",
    sync: ".post-gallery-bot"
  });
});




});