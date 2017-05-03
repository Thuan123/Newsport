<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
<head>

<title>Latest News</title>

<jsp:include page="load-js.jsp"></jsp:include>

<style type="text/css" id="custom-background-css">
body.custom-background {
	background-color: #eeeeee;
}
</style>
</head>

<body
	class="page page-id-177 page-template page-template-page-latest page-template-page-latest-php custom-background">

	<div id="site" class="left relative">
		<div id="site-wrap" class="left relative">
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
											<div class="nav-right-wrap relative">
												<jsp:include page="nav-search.jsp"></jsp:include>
											</div>
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
												<h1 class="cat-head">More News</h1>

												<div id="home-mid-wrap" class="left relative">
													<div id="archive-list-wrap" class="left relative">
														<ul
															class="archive-col-list left relative infinite-content">
															<c:forEach var="latests" items="${latests}">
																<li class="infinite-post"><a
																	href="<c:url value="/details/${latests.id}"/>"
																	rel="bookmark" title="News Sport">
																		<div class="archive-list-out">
																			<div class="archive-list-img left relative">
																				<img width="450" height="270"
																					src=${latests.cover_url
																					}
																				class="reg-img wp-post-imagejpg"
																					alt="woman-beach2" onerror="imgError(this);" /> <img
																					width="80" height="80" src=${latests.cover_url
																					}
																				class="mob-img wp-post-image jpg"
																					alt="woman-beach2" onerror="imgError(this);" />
																				<!--feat-info-wrap-->
																			</div>
																			<!--archive-list-img-->
																			<div class="archive-list-in">
																				<div class="archive-list-text left relative">
																					<span class="side-list-cat">Sport</span>
																					<h2>${latests.title}</h2>
																				</div>
																			</div>
																		</div> <!--archive-list-out-->
																</a></li>
															</c:forEach>
														</ul>														
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
												<c:forEach var="pages" items="${homes}">
													<a href="<c:url value="/details/${pages.id}"/>"
														target="_blank"> <img src=${pages.cover_url } onerror="imgError(this);" />
													</a>
												</c:forEach>
											</div>
											<!--widget-ad-->
											<div id="mvp_facebook_widget-3"
												class="side-widget mvp_facebook_widget">
												<h4 class="post-header">
													<span class="post-header">Hot News</span>
												</h4>
												<div class="blog-widget-list left relative">
													<c:forEach var="newmenus" items="${hots}">
														<a href="<c:url value="/details/${newmenus.id}"/>"
															rel="bookmark">
															<div class="blog-widget-img left relative">
																<img src=${newmenus.cover_url } alt="" width="300px"
																	height="180px" class="widget-img-main wp-post-image"
																	alt="woman-beach2" onerror="imgError(this);" /> <img
																	src=${newmenus.cover_url } alt="" width="80px"
																	height="80px" class="widget-img-side wp-post-image"
																	alt="woman-beach2" onerror="imgError(this);" />
															</div> <!--blog-widget-img-->
															<div class="blog-widget-text left relative">
																<h2>${newmenus.title}</h2>
															</div>
														</a>
													</c:forEach>
												</div>
											</div>
											<div id="mvp_catlist_widget-7"
												class="side-widget mvp_catlist_widget">
												<h4 class="post-header">
													<span class="post-header">Latest News</span>
												</h4>
												<div class="blog-widget-wrap left relative">
													<ul class="blog-widget-list left relative">
														<c:forEach var="mores" items="${mores}">
															<li><a href="<c:url value="/details/${mores.id}"/>"
																rel="bookmark">
																	<div class="blog-widget-img left relative">
																		<img src=${mores.cover_url } alt="" width="300px"
																			height="180px" class="widget-img-main wp-post-image"
																			alt="woman-beach2" onerror="imgError(this);" /> <img
																			src=${mores.cover_url } alt="" width="80px"
																			height="80px" class="widget-img-side wp-post-image"
																			alt="woman-beach2" onerror="imgError(this);" />
																	</div> <!--blog-widget-img-->
																	<div class="blog-widget-text left relative">
																		<span class="side-list-cat">Sport</span>
																		<h2>${mores.title}</h2>
																	</div>
															</a></li>
														</c:forEach>
													</ul>
												</div>
												<!--blog-widget-wrap-->
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
