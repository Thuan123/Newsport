<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
<head>
<meta charset="UTF-8">

<title>Index News</title>

<script type="text/javascript">
   window._wpemojiSettings = {"baseUrl":"http:\/\/s.w.org\/images\/core\/emoji\/72x72\/","ext":".png","source":{"concatemoji":"http:\/\/www.mvpthemes.com\/flexmag\/wp-includes\/js\/wp-emoji-release.min.js?ver=4.4.1"}};
   !function(a,b,c){function d(a){var c,d=b.createElement("canvas"),e=d.getContext&&d.getContext("2d");return e&&e.fillText?(e.textBaseline="top",e.font="600 32px Arial","flag"===a?(e.fillText(String.fromCharCode(55356,56806,55356,56826),0,0),d.toDataURL().length>3e3):"diversity"===a?(e.fillText(String.fromCharCode(55356,57221),0,0),c=e.getImageData(16,16,1,1).data.toString(),e.fillText(String.fromCharCode(55356,57221,55356,57343),0,0),c!==e.getImageData(16,16,1,1).data.toString()):("simple"===a?e.fillText(String.fromCharCode(55357,56835),0,0):e.fillText(String.fromCharCode(55356,57135),0,0),0!==e.getImageData(16,16,1,1).data[0])):!1}function e(a){var c=b.createElement("script");c.src=a,c.type="text/javascript",b.getElementsByTagName("head")[0].appendChild(c)}var f,g;c.supports={simple:d("simple"),flag:d("flag"),unicode8:d("unicode8"),diversity:d("diversity")},c.DOMReady=!1,c.readyCallback=function(){c.DOMReady=!0},c.supports.simple&&c.supports.flag&&c.supports.unicode8&&c.supports.diversity||(g=function(){c.readyCallback()},b.addEventListener?(b.addEventListener("DOMContentLoaded",g,!1),a.addEventListener("load",g,!1)):(a.attachEvent("onload",g),b.attachEvent("onreadystatechange",function(){"complete"===b.readyState&&c.readyCallback()})),f=c.source||{},f.concatemoji?e(f.concatemoji):f.wpemoji&&f.twemoji&&(e(f.twemoji),e(f.wpemoji)))}(window,document,window._wpemojiSettings);
</script>
<jsp:include page="load-js.jsp"></jsp:include>
<style type="text/css" id="custom-background-css">
body.custom-background {
	background-color: #eeeeee;
}

th, td {
	padding: 4px;
	text-align: left;
}
</style>

</head>

<body
	class="page page-id-177 page-template page-template-page-latest page-template-page-latest-php custom-background">
	<jsp:useBean id="pagedListHolder" scope="request"
		type="org.springframework.beans.support.PagedListHolder" />
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
			<div id="body-main-wrap" class="left relative">
				<div class="body-main-out relative">
					<div class="body-main-in">
						<div id="body-main-cont" class="left relative">
							<div id="leader-wrap" class="left relative">
								<div
									style="width: 90%; height: 30px; background: #ddd; text-align: center; display: inline-block; color: #bbb; font-family: 'Open Sans', sans-serif; font-weight: 700; font-size: 1.2rem; white-space: nowrap; padding: 30px 5% 0; overflow: hidden;">

								</div>
							</div>
							<!--leader-wrap-->
							<div id="home-main-wrap" class="left relative">
								<div class="home-wrap-out1">
									<div class="home-wrap-in1">
										<div id="home-left-wrap" class="left relative">
											<div id="home-left-col" class="relative">
											
												<h1 class="cat-head">All News</h1>
												<c:url value="./index" var="pagedLink">
													<c:param name="action" value="list" />
													<c:param name="p" value="~" />
												</c:url>
												
												<div id="home-mid-wrap" class="left relative">
													<div id="archive-list-wrap" class="left relative">
													</div>
													<div id="archive-list-wrap" class="left relative">
														<ul class="blog-widget-list left relative">
															<c:forEach var="newlienwans" items="${pagedListHolder.pageList}">
																<li class="infinite-post"><a rel="bookmark"
																	title="News Sport">
																		<div class="archive-list-out">
																			<div class="archive-list-img left relative">
																				<img width="450" height="270"
																					src=${newlienwans.cover_url
																					}
																					class="reg-img wp-post-image" alt="woman-beach2"
																					onerror="imgError(this);" /> <img
																					width="80" height="80"
																					src=${newlienwans.cover_url
																					}
																					class="mob-img wp-post-image" alt="woman-beach2"
																					onerror="imgError(this);" />
																				<!--feat-info-wrap-->
																			</div>
																			<!--archive-list-img-->
																			<div class="archive-list-in">
																				<div class="archive-list-text left relative">
																					<span class="side-list-cat">
																						<table>
																							<tr>
																								<th><a href="./delete/${newlienwans.id}"><span
																										class="post-head-cat">Remove</span></a></th>
																								<th><a href="./edit/${newlienwans.id}"><span
																										class="post-head-cat">Edit</span></a></th>
																							</tr>
																						</table>
																					</span>
																				</div>
																				<div class="archive-list-text left relative">
																					<a href="<c:url value="./show/${newlienwans.id}"/>">
																						<h2>${newlienwans.title}</h2>
																					</a>
																					<p>${newlienwans.abstract_content}</p>
																				</div>
																				<!--archive-list-text-->
																			</div>
																			<!--archive-list-in-->
																		</div> <!--archive-list-out-->
																</a></li>
															</c:forEach>
														</ul>
														<div>
															<span class="loading"></span>

														</div>

														<div>
                                                            <tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}"/>
														</div>
														<!--nav-links-->
													</div>
													<!--archive-list-wrap-->
												</div>
												<!--home-mid-wrap-->
											</div>
											<!--home-left-col-->
										</div>
										<!--home-left-wrap-->
									</div>
									<!--home-wrap-in1-->
									<div id="arch-right-col" class="relative">
										<div id="sidebar-wrap" class="left relative">
											<div class="widget-ad left relative">
												
											</div>
											<!--widget-ad-->
											<div id="mvp_facebook_widget-3"
												class="side-widget mvp_facebook_widget">
												<h4 class="post-header">
													<span class="post-header">Options</span>
												</h4>
												<div class="blog-widget-list left relative"></div>
											</div>

										</div>
										<!--sidebar-wrap-->
									</div>
									<!--home-right-col-->
								</div>
								<!--home-wrap-out1-->
							</div>
							<!--home-main-wrap-->
							<div id="foot-ad-wrap" class="left relative">
								<div
									style="width: 90%; height: 30px; background: #ddd; text-align: center; display: inline-block; color: #bbb; font-family: 'Open Sans', sans-serif; font-weight: 700; font-size: 1.2rem; white-space: nowrap; padding: 30px 5% 0; overflow: hidden;"></div>
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
