<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
<head>
<meta charset="UTF-8">

<title>Edit News</title>
<script type="text/javascript">
	window._wpemojiSettings = {"baseUrl":"http:\/\/s.w.org\/images\/core\/emoji\/72x72\/","ext":".png","source":{"concatemoji":"http:\/\/www.mvpthemes.com\/flexmag\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.4.1"}};
	!function(a,b,c){function d(a){var c,d=b.createElement("canvas"),e=d.getContext&&d.getContext("2d");return e&&e.fillText?(e.textBaseline="top",e.font="600 32px Arial","flag"===a?(e.fillText(String.fromCharCode(55356,56806,55356,56826),0,0),d.toDataURL().length>3e3):"diversity"===a?(e.fillText(String.fromCharCode(55356,57221),0,0),c=e.getImageData(16,16,1,1).data.toString(),e.fillText(String.fromCharCode(55356,57221,55356,57343),0,0),c!==e.getImageData(16,16,1,1).data.toString()):("simple"===a?e.fillText(String.fromCharCode(55357,56835),0,0):e.fillText(String.fromCharCode(55356,57135),0,0),0!==e.getImageData(16,16,1,1).data[0])):!1}function e(a){var c=b.createElement("script");c.src=a,c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var f,g;c.supports={simple:d("simple"),flag:d("flag"),unicode8:d("unicode8"),diversity:d("diversity")},c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.simple&&c.supports.flag&&c.supports.unicode8&&c.supports.diversity||(g=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",g,!1),a.addEventListener("load",g,!1)):(a.attachEvent("onload",g),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),f=c.source||{},f.concatemoji?e(f.concatemoji):f.wpemoji&&f.twemoji&&(e(f.twemoji),e(f.wpemoji)))}(window,document,window._wpemojiSettings);
</script>

<jsp:include page="load-js.jsp"></jsp:include>

<style type="text/css" id="custom-background-css">
body.custom-background {
	background-color: #eeeeee;
}
</style>


</head>
<body
	class="single single-post postid-144 single-format-standard custom-background">
	<div id="site" class="left relative">
		<div id="site-wrap" class="left relative">
			<div id="fly-wrap">
				<div class="fly-wrap-out">
					<div class="fly-side-wrap">
						<jsp:include page="fly-side-wrap.jsp"></jsp:include>
					</div>
					<!--fly-side-wrap-->
					<div class="fly-wrap-in">
						<jsp:include page="fly-menu-wrap.jsp"></jsp:include>
					</div>
					<!--fly-wrap-in-->
				</div>
				<!--fly-wrap-out-->
			</div>
			<!--fly-wrap-->
			<div id="head-main-wrap" class="left relative">
				<div id="head-main-top" class="left relative"></div>
				<!--head-main-top-->
				<div id="main-nav-wrap">
					<div class="nav-out">
						<div class="nav-in">
							<div id="main-nav-cont" class="left" itemscope
								itemtype="http://schema.org/Organization">
								<div class="nav-logo-out">
									<div class="nav-left-wrap left relative">
										<div class="fly-but-wrap left relative">
											<span></span> <span></span> <span></span> <span></span>
										</div>
									</div>
									<!--nav-left-wrap-->
									<div class="nav-logo-in">
										<div class="nav-menu-out">
											<div class="nav-menu-in">
												<jsp:include page="nav-menu.jsp"></jsp:include>
											</div>
											<!--nav-menu-in-->
											<div class="nav-right-wrap relative"></div>
											<!--nav-right-wrap-->
										</div>
										<!--nav-menu-out-->
									</div>
									<!--nav-logo-in-->
								</div>
								<!--nav-logo-out-->
							</div>
							<!--main-nav-cont-->
						</div>
						<!--nav-in-->
					</div>
					<!--nav-out-->
				</div>
				<!--main-nav-wrap-->
			</div>
			<!--head-main-wrap-->
			<div id="body-main-wrap" class="left relative" itemscope
				itemtype="http://schema.org/Article">
				<div class="body-main-out relative">
					<div class="body-main-in">
						<div id="body-main-cont" class="left relative">
							<div id="leader-wrap" class="left relative">
								<div
									style="width: 90%; height: 30px; background: #ddd; text-align: center; display: inline-block; color: #bbb; font-family: 'Open Sans', sans-serif; font-weight: 700; font-size: 1.2rem; white-space: nowrap; padding: 30px 5% 0; overflow: hidden;">
								</div>
							</div>
							<!--leader-wrap-->
							<div id="post-main-wrap" class="left relative">
								<div class="post-wrap-out1">
									<div class="post-wrap-in1">
										<div id="post-left-col" class="relative">
											<script type='text/javascript'>
											function wpopen (macagna) {
    window.open(macagna, '_blank', 'width=400,height=500,scrollbars=yes,status=yes');
}
</script>
											<article id="post-area"
												class="post-144 post type-post status-publish format-standard has-post-thumbnail hentry category-entertainment tag-entertainment tag-gallery tag-matt-damon tag-movies tag-the-martian">
											<form:form action="/controller/admin/page/saveNews"
												method="post" modelAttribute="sigs">
												<header id="post-header"> <form:hidden path="id" />
												<h2>Title</h2>
												<form:textarea class="post-title left"
													itemprop="name headline" path="title" /> <!--<textarea class="post-title left" itemprop="name headline">${sigs.title}</textarea>-->
												<div id="post-info-wrap" class="left relative">
													<div class="post-info-out">
														<div class="post-info-in">
															<div class="post-info-right left relative">
																<!--post-info-name-->
																<div class="post-info-date left relative">
																	<span class="post-info-text">Published</span> <span
																		class="post-date"> <form:textarea
																			class="post-info-text post-date"
																			itemprop="name headline" path="published" />
																	</span>
																</div>
																<!--post-info-date-->
															</div>
															<!--post-info-right-->
														</div>
														<!--post-info-in-->
													</div>
													<!--post-info-out-->
												</div>
												<!--post-info-wrap--> </header>
												<!--post-header-->
												<div id="post-feat-img" class="left relative">
													<img width="1000" height="600"
														src=${sigs.cover_url
													}
														class="attachment- size- wp-post-image" alt="male-model"
														itemprop="image" onerror="imgError(this);" />
													<div class="post-feat-text">
														<span class="post-excerpt left"> </span>
														<!--<span class="feat-caption">Photo:
														Shutterstock</span>-->
													</div>
													<!--post-feat-text-->
												</div>
												<!--post-feat-img-->
												<div id="content-area" itemprop="articleBody"
													class="post-144 post type-post status-publish format-standard has-post-thumbnail hentry category-entertainment tag-entertainment tag-gallery tag-matt-damon tag-movies tag-the-martian">
													<div class="post-cont-out">
														<!-- <div class="post-cont-in">-->
														<div id="content-main" class="left relative">
															<h2>Cover url</h2>
															<section class="social-sharing-top"> <!--post-social-count-->
															<form:textarea class="post-abtract left"
																itemprop="name headline" path="cover_url" /> </section>
															<h2>Abstract</h2>
															<section class="social-sharing-top"> <!--post-social-count-->
															<form:textarea class="post-abtract left"
																itemprop="name headline" path="abstract_content" /> </section>
															<br> <br>
															<!--social-sharing-top-->
															<h2>Content</h2>
															<form:textarea class="post-p left"
																itemprop="name headline" path="text_content" />
															<br>
															<div class="posts-nav-link"></div>
															<!--posts-nav-link-->
															<div class="post-tags">
																<div class="post-tags">
																	<span class="post-tags-header">Meta data:</span> <br>
																	
																	<br> <span itemprop="keywords">
																		<div class="tag-cloud left relative">
																			<c:forEach var="metas" items="${metas}">
																				<a href='<c:url value="/relatednews/${metas}"/>'
																					class='tag-link-259' title='12 topics'
																					style='font-size: 10px;'>${metas}</a>
																			</c:forEach>
																		</div>
																	</span>
																</div>

																<form:textarea class="post-meta left"
																	itemprop="name headline" path="meta" />
															</div>

															<!--<a href="<c:url value="#"/>"
															class="time-but">SAVE</a>-->

															<input type="submit" class="time-but" value="Save">
															<div class="nav-links">
																<!--comments-button-->
																<!--comments-->
															</div>
															<!--content-main-->
															<!-- </div>-->
															<!--post-cont-in-->
														</div>
														<!--post-cont-out-->
													</div>
													<!--content-area-->
												</div>
											</form:form> </article>
										</div>
										<!--post-left-col-->
									</div>
									<!--post-wrap-in1-->
									<div id="post-right-col" class="relative">
										<div class="side-title-wrap left relative">
											<h3 class="side-list-title"></h3>
										</div>
										<!--side-title-wrap-->
										<div class="side-pop-wrap left relative">
											<div class="feat-widget-cont left relative"></div>
											<!--feat-widget-cont-->
										</div>
										<!--side-pop-wrap-->
									</div>
									<!--post-right-col-->
								</div>
								<!--post-wrap-out1-->
							</div>
							<!--post-main-wrap-->
							<div id="foot-ad-wrap" class="left relative">
								<div
									style="width: 90%; height: 30px; background: #ddd; text-align: center; display: inline-block; color: #bbb; font-family: 'Open Sans', sans-serif; font-weight: 700; font-size: 1.2rem; white-space: nowrap; padding: 30px 5% 0; overflow: hidden;">
								</div>
							</div>
							<!--foot-ad-wrap-->
						</div>
						<!--body-main-cont-->
					</div>
					<!--body-main-in-->
				</div>
				<!--body-main-out-->
				<jsp:include page="footer.jsp"></jsp:include>
			</div>
			<!--body-main-wrap-->
		</div>
		<!--site-wrap-->
	</div>
	<!--site-->
	<div class="fly-to-top back-to-top">
		<i class="fa fa-angle-up fa-3"></i> <span class="to-top-text">To
			Top</span>
	</div>


</body>
</html>
