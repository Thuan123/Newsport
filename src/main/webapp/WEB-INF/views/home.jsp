<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en-US">
<head>
<title>News Sport</title>
<jsp:include page="load-js.jsp"></jsp:include>

<style type="text/css" id="custom-background-css">
body.custom-background {
	background-color: #eeeeee;
}
</style>


</head>

<body
	class="home page page-id-179 page-template page-template-page-home page-template-page-home-php custom-background">

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
			<div class="col-tabs-wrap left relative">
				<ul class="col-tabs">
					<li class="feat-col-tab"><a href="#tab-col1">Featured</a></li>
					<li class="latest-col-tab non-feat-tab"><a href="#tab-col2">Latest</a>
					</li>
					<li class="pop-col-tab non-feat-tab"><a href="#tab-col3">More</a>
					</li>
				</ul>
			</div>
			<!--col-tabs-wrap-->
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
							<div id="feat-top-wrap" class="left relative">
								<c:forEach var="features" items="${features}">
									<div class="feat-wide5-main left relative">
										<a href="<c:url value="/details/${features.id}"/>"
											rel="bookmark">
											<div class="feat-wide5-img left relative">
												<img src=${features.cover_url } alt="" width="1600px"
													height="450px" class="unlazy reg-img wp-post-image"
													alt="woman-beach2" onerror="imgError(this);" /> <img
													src=${features.cover_url } alt="" width="450px"
													height="270px" class="unlazy mob-img wp-post-image"
													alt="woman-beach2" onerror="imgError(this);" />
											</div> <!--feat-wide5-img-->
											<div class="feat-wide5-text">
												<span class="feat-cat">Sport</span>
												<h2>${features.title}</h2>
											</div> <!--feat-wide5-text-->
										</a>
									</div>
									<!--feat-wide5-main-->
								</c:forEach>
							</div>
							<!--feat-top-wrap-->
							<div id="home-main-wrap" class="left relative">
								<div class="home-wrap-out1">
									<div class="home-wrap-in1">
										<div id="home-left-wrap" class=" left relative">
											<div class="home-wrap-out2">
												<div class="home-wrap-in2">
													<div id="tab-col1"
														class="home-left-col relative tab-col-cont">
														<div class="side-title-wrap left relative">
															<h3 class="side-list-title">Featured News</h3>
														</div>
														<!--side-title-wrap-->
														<div id="home-mid-wrap" class="left relative">
															<div id="mvp_tagrow_widget-2"
																class="home-widget left relative mvp_tagrow_widget">
																<div class="row-widget-wrap left relative">
																	<ul class="row-widget-list">
																		<c:forEach var="feats" items="${feats}">
																			<li><a
																				href="<c:url value="/details/${feats.id}"/>"
																				rel="bookmark">
																					<div class="row-widget-img left relative">
																						<img src=${feats.cover_url } alt="" width="300px"
																							height="180px" class="reg-img wp-post-image"
																							alt="woman-jeans" onerror="imgError(this);" /> <img
																							src=${feats.cover_url } alt="" width="80px"
																							height="80px" class="mob-img wp-post-image"
																							alt="woman-jeans" onerror="imgError(this);" />
																					</div> <!--row-widget-img-->
																					<div class="row-widget-text left relative">
																						<span class="side-list-cat">Sport</span>
																						<p>${feats.title}</p>
																					</div> <!--row-widget-text-->
																			</a></li>
																		</c:forEach>
																	</ul>
																</div>
																<!--row-widget-wrap-->
															</div>
															<div id="mvp_catlist_widget-3"
																class="home-widget left relative mvp_catlist_widget">
																<div class="home-title-wrap left relative">
																	<h3 class="side-list-title">FootBall</h3>
																</div>
																<div class="blog-widget-wrap left relative">
																	<ul class="blog-widget-list left relative">
																		<c:forEach var="foots" items="${foots}">
																			<li><a
																				href="<c:url value="/details/${foots.id}"/>"
																				rel="bookmark">
																					<div class="blog-widget-img left relative">
																						<img src=${foots.cover_url } alt="" width="300px"
																							height="250px"
																							class="widget-img-main wp-post-image" alt="band"
																							onerror="imgError(this);" /> <img
																							src=${foots.cover_url } alt="" width="80px"
																							height="80px"
																							class="widget-img-side wp-post-image" alt="band"
																							onerror="imgError(this);" />
																					</div> <!--blog-widget-img-->
																					<div class="blog-widget-text left relative">
																						<span class="side-list-cat">Sport</span>
																						<h2>${foots.title}</h2>
																						<p>${foots.abstract_content}</p>
																					</div>
																			</a></li>
																		</c:forEach>
																	</ul>
																</div>
																<!--blog-widget-wrap-->
															</div>
															<div class="feat-widget-cont left relative">
																<div class="feat-widget-in left relative">
																	<c:forEach var="homes" items="${homes}">
																		<div class="feat-widget-wrap left relative">
																			<a href="<c:url value="/details/${homes.id}"/>"
																				rel="bookmark">
																				<div class="feat-widget-img left relative">
																					<img src=${homes.cover_url } alt="" width="900px"
																						height="550px"
																						class="widget-img-main wp-post-image" alt="band"
																						onerror="imgError(this);" /> <img
																						src=${homes.cover_url } alt="" width="450px"
																						height="270px"
																						class="widget-img-side wp-post-image" alt="band"
																						onerror="imgError(this);" />
																				</div> <!--feat-widget-img-->
																				<div class="feat-widget-text left relative">
																					<span class="side-list-cat">Sport</span>
																					<h2>${homes.title}</h2>
																					<p>${homes.abstract_content}</p>
																				</div> <!--feat-widget-text-->
																			</a>
																		</div>
																		<!--feat-widget-wrap-->
																	</c:forEach>
																</div>
																<!--feat-widget-in-->
															</div>
															<!--feat-widget-cont-->
															<div id="mvp_taglist_widget-2"
																class="home-widget left relative mvp_taglist_widget">
																<div class="home-title-wrap left relative">
																	<h3 class="side-list-title">Hot News</h3>
																</div>
																<div class="blog-widget-wrap left relative">
																	<ul class="blog-widget-list left relative">
																		<c:forEach var="hots" items="${hots}">
																			<li><a
																				href="<c:url value="/details/${hots.id}"/>"
																				rel="bookmark">
																					<div class="blog-widget-img left relative">
																						<img src=${hots.cover_url } alt="" width="300px"
																							height="180px"
																							class="widget-img-main wp-post-image"
																							alt="celebrity1" onerror="imgError(this);" /> <img
																							src=${hots.cover_url } alt="" width="80px"
																							height="80px"
																							class="widget-img-side wp-post-image"
																							alt="celebrity1" onerror="imgError(this);" />
																					</div> <!--blog-widget-img-->
																					<div class="blog-widget-text left relative">
																						<span class="side-list-cat">Sport</span>
																						<h2>${hots.title}</h2>
																						<p>${hots.abstract_content}</p>
																					</div> <!--blog-widget-text-->
																			</a></li>
																		</c:forEach>
																	</ul>
																</div>
																<!--blog-widget-wrap-->
															</div>

															<div class="home-widget left relative">
																<div class="blog-widget-wrap left relative">
																	<ul
																		class="blog-widget-list left relative infinite-content">
																		<c:forEach var="galerys" items="${galerys}">
																			<li class="infinite-post"><a
																				href="<c:url value="/details/${galerys.id}"/>"
																				rel="bookmark">
																					<div class="blog-widget-img left relative">
																						<img src=${galerys.cover_url } alt=""
																							width="300px" height="180px"
																							class="reg-img wp-post-image" alt="car2"
																							onerror="imgError(this);" /> <img
																							src=${galerys.cover_url } alt="" width="80px"
																							height="80px" class="mob-img wp-post-image"
																							alt="car2" onerror="imgError(this);" />
																					</div> <!--blog-widget-img-->
																					<div class="blog-widget-text left relative">
																						<span class="side-list-cat">Sport</span>
																						<h2>${galerys.title}</h2>
																						<p>${galerys.abstract_content}</p>
																					</div> <!--blog-widget-text-->
																			</a></li>
																		</c:forEach>
																	</ul>
																	<!-- /latestnews.html-->
																	<a href="<c:url value="/latestnews.html"/>"
																		class="time-but">More Posts</a>
																	<div class="nav-links">
																		<div class="pagination">
																			<span>Page 1 of 4</span> <span class="current">1</span>
																			<a href='#' class="inactive">2</a> <a href='#'
																				class="inactive">3</a> <a href='#' class="inactive">4</a>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!--home-wrap-in2-->
												<div id="tab-col2"
													class="home-mid-col relative tab-col-cont">
													<div class="side-title-wrap left relative">
														<h3 class="side-list-title">Latest News</h3>
													</div>
													<!--side-title-wrap-->
													<div class="side-list-wrap left relative">
														<ul class="side-list left relative">
															<c:forEach var="latests" items="${latests}">
																<li><a
																	href="<c:url value="/details/${latests.id}"/>"
																	rel="bookmark">
																		<div class="side-list-out">
																			<div class="side-list-img left relative">
																				<img src=${latests.cover_url } alt="" width="90px"
																					height="90px"
																					class="attachment-mvp-small-thumb size-mvp-small-thumb wp-post-image"
																					alt="car2" onerror="imgError(this);" />
																			</div>
																			<div class="side-list-in">
																				<div class="side-list-text left relative">
																					<span class="side-list-cat">Sport</span>
																					<p>${latests.title}</p>
																				</div>
																			</div>
																		</div>
																</a></li>
															</c:forEach>
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>
									<!--home-wrap-in1-->
									<div id="tab-col3" class="home-right-col relative tab-col-cont">
										<div class="side-title-wrap left relative">
											<h3 class="side-list-title">More News</h3>
										</div>
										<!--side-title-wrap-->
										<div class="side-pop-wrap left relative">
											<div class="feat-widget-cont left relative">

												<c:forEach var="mores" items="${mores}">
													<div class="feat-widget-wrap left relative">
														<a href="<c:url value="/details/${mores.id}"/>">
															<div class="feat-widget-img left relative">
																<img src=${mores.cover_url } alt="" width="300px"
																	height="180px" class="reg-img wp-post-image" alt="car2"
																	onerror="imgError(this);" /> <img
																	src=${mores.cover_url
																	} alt=""
																	width="80px" height="80px"
																	class="mob-img wp-post-image" alt="car2"
																	onerror="imgError(this);" />
															</div> <!--feat-widget-img-->
															<div class="feat-widget-text">
																<span class="side-list-cat">Sport</span>
																<h2>${mores.title}</h2>
															</div> <!--feat-widget-text-->
														</a>
													</div>
													<!--feat-widget-wrap-->

												</c:forEach>
											</div>
											<!--feat-widget-cont-->
										</div>
										<!--side-pop-wrap-->
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
	<!--fly-to-top-->
	<div class="fly-fade"></div>


</body>
</html>