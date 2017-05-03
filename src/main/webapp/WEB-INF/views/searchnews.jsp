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

<title>Search News</title>

<jsp:include page="load-js.jsp"></jsp:include>

<script>
function myFunction() {
	document.getElementById('txt').style.display = "block";
}
</script>

</head>

<body
	class="page page-id-177 page-template page-template-page-latest page-template-page-latest-php custom-background">

	<jsp:useBean id="pagedListHolder" scope="request"
		type="org.springframework.beans.support.PagedListHolder" />

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
											<div class="nav-right-wrap relative">
												<jsp:include page="nav-search.jsp"></jsp:include>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--head-main-wrap-->
			<div id="body-main-wrap" class="left relative">
				<div class="body-main-out relative">
					<div class="body-main-in">
						<div id="body-main-cont" class="left relative">
							<div id="leader-wrap" class="left relative">
								<div
									style="width: 100%; height: 50px; background: #ddd; text-align: left; color: #bbb; padding: 0px 0% 0;">
									<textarea id="txt" class="truyvan"
										style="width: 100%; height: 50px; display: none;" disabled>${reponse}</textarea>
								</div>
							</div>
							<!--leader-wrap-->
							<div id="home-main-wrap" class="left relative">
								<div class="home-wrap-out1">
									<div class="home-wrap-in1">
										<div id="home-left-wrap" class="left relative">
											<div id="home-left-col" class="relative">
												<a class="post-cat-link" href="#"> <span
													class="post-head-cat" onclick="myFunction()">Show</span>
												</a>
												<c:url value="./searchNews" var="pagedLink">
													<c:param name="action" value="list" />
													<c:param name="p" value="~" />
												</c:url>

												<div id="home-mid-wrap" class="left relative">
													<div id="archive-list-wrap" class="left relative">
														<ul class="blog-widget-list left relative">
															<c:forEach var="latests" items="${pagedListHolder.pageList}">
																<li class="infinite-post"><a
																	href="<c:url value="/details/${latests.id}"/>"
																	rel="bookmark" title="News Sport">
																		<div class="archive-list-out">
																			<div class="archive-list-img left relative">
																				<img width="450" height="270"
																					src=${latests.cover_url
																					}
																					class="reg-img wp-post-image" alt="woman-beach2"
																					onerror="imgError(this);" /> <img
																					width="80" height="80"
																					src=${latests.cover_url
																					}
																					class="mob-img wp-post-image" alt="woman-beach2"
																					onerror="imgError(this);" />
																			</div>
																			<div class="archive-list-in">
																				<div class="archive-list-text left relative">
																					<span class="side-list-cat">Sport</span>
																					<h2>${latests.title}</h2>
																					<p>${latests.abstract_content}</p>
																				</div>
																			</div>
																		</div> <!--archive-list-out-->
																</a></li>
															</c:forEach>
														</ul>
														<div>
                                                            <tg:paging pagedListHolder="${pagedListHolder}" pagedLink="${pagedLink}"/>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div id="arch-right-col" class="relative">
										<div id="sidebar-wrap" class="left relative">
											<!--widget-ad-->
											<div id="mvp_catlist_widget-7"
												class="side-widget mvp_catlist_widget">
												<h4 class="post-header">
													<span class="post-header">Mores news</span>
												</h4>
												<div class="blog-widget-wrap left relative">
													<ul class="blog-widget-list left relative">
														<c:forEach var="mores" items="${mores}">
															<li><a href="<c:url value="/details/${mores.id}"/>"
																rel="bookmark"> 
																	<div class="blog-widget-text left relative">
																		<span class="side-list-cat">Sport</span>
																		<h2>${mores.title}</h2>
																	</div>
															</a></li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="foot-ad-wrap" class="left relative">
								<div
									style="width: 90%; height: 30px; background: #ddd; text-align: center; display: inline-block; color: #bbb; font-family: 'Open Sans', sans-serif; font-weight: 700; font-size: 1.2rem; white-space: nowrap; padding: 30px 5% 0; overflow: hidden;"></div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="footer.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<!--site-->
	<div class="fly-to-top back-to-top">
		<i class="fa fa-angle-up fa-3"></i> <span class="to-top-text">To
			Top</span>
	</div>	
</body>
</html>
