<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <footer id="foot-wrap" class="left relative">
	   <div id="foot-top-wrap" class="left relative">
		   <div class="body-main-out relative">
			    <div class="body-main-in">
					 <div id="foot-widget-wrap" class="left relative">
						  <div class="foot-widget left relative">
							   <div class="foot-logo left realtive">
							   </div><!--foot-logo-->
							   <div class="foot-info-text left relative">
								  <p>Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem?</p>
								  <p>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet.</p>										
							   </div><!--footer-info-text-->
							   <div class="foot-soc left relative">
									<ul class="foot-soc-list relative">
										<li class="foot-soc-fb">
										   <a href="#" target="_blank"><i class="fa fa-facebook-square fa-2"></i></a>
										</li>
										<li class="foot-soc-twit">
										   <a href="#" target="_blank"><i class="fa fa-twitter-square fa-2"></i></a>
										</li>
										<li class="foot-soc-pin">
										   <a href="#" target="_blank"><i class="fa fa-pinterest-square fa-2"></i></a>
										</li>
							            <li class="foot-soc-inst">
										   <a href="#" target="_blank"><i class="fa fa-instagram fa-2"></i></a>
									    </li>
									    <li class="foot-soc-goog">
										   <a href="#" target="_blank"><i class="fa fa-google-plus-square fa-2"></i></a>
									    </li>
										<li class="foot-soc-yt">
										   <a href="#" target="_blank"><i class="fa fa-youtube-play fa-2"></i></a>
										</li>
									    <li class="foot-soc-link">
										   <a href="#" target="_blank"><i class="fa fa-linkedin-square fa-2"></i></a>
										</li>
								        <li class="foot-soc-tumb">
										   <a href="#" target="_blank"><i class="fa fa-tumblr-square fa-2"></i></a>
										</li>
										<li class="foot-soc-rss">
										   <a href="#" target="_blank"><i class="fa fa-rss-square fa-2"></i></a>
										</li>
					                 </ul>
								</div><!--foot-soc-->
									</div><!--foot-widget-->
	        <div id="mvp_catlist_widget-4" class="foot-widget left relative mvp_catlist_widget"><h3 class="foot-head">Latest News</h3>			<div class="blog-widget-wrap left relative">
				<ul class="blog-widget-list left relative">
				  <c:forEach var="menus" items="${menus}">
					<li>
					   <a href="#" rel="bookmark">
						   <div class="blog-widget-img left relative">
							   <img src=${menus.cover_url} alt="" width="300px" height="180px" class="widget-img-main wp-post-image" alt="woman-beach2" sizes="(max-width: 300px) 100vw, 300px"/>
							   <img src=${menus.cover_url} alt="" width="80px" height="80px" class="widget-img-side wp-post-image" alt="woman-beach2" sizes="(max-width: 80px) 100vw, 80px"/>
							</div><!--blog-widget-img-->
							<div class="blog-widget-text left relative">
								<span class="side-list-cat">Sport</span>
								<h2>${menus.title}</h2>
								<p>${menus.abstract_content}</p>
							</div><!--blog-widget-text-->
							</a>
						</li>
					</c:forEach>				
				</ul>
			</div><!--blog-widget-wrap-->
		</div>
		<div id="mvp_tags_widget-2" class="foot-widget left relative mvp_tags_widget"><h3 class="foot-head">Tags</h3>
			<div class="tag-cloud left relative">
				<a href='#' class='tag-link-259' title='12 topics' style='font-size: 10px;'>gallery</a>
                <a href='#' class='tag-link-86' title='10 topics' style='font-size: 10px;'>Sports</a>
		    </div>
		</div>							</div><!--foot-widget-wrap-->
						</div><!--body-main-in-->
					</div><!--body-main-out-->
				</div><!--foot-top-->
				<div id="foot-bot-wrap" class="left relative">
					<div class="body-main-out relative">
						<div class="body-main-in">
							<div id="foot-bot" class="left relative">
								<div class="foot-menu relative">
									<div class="menu-footer-menu-container">
									   <ul id="menu-footer-menu" class="menu">
									       <li id="menu-item-1817" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-home menu-item-1817">
									           <a href="index.jsp">Home</a>
									       </li>
									       <li id="menu-item-1819" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-1819">
									           <a href="#">Help</a>
									       </li>
									       <li id="menu-item-1820" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-1820">
									           <a href="#">About</a>
									       </li>
									   </ul>
									</div>
							     </div><!--foot-menu-->
								
							</div><!--foot-bot-->
						</div><!--body-main-in-->
					</div><!--body-main-out-->
				</div><!--foot-bot-->
			</footer>
</body>
</html>