jQuery(document)
		.ready(
				function() {
					jQuery(
							"#post-right-col,#post-sidebar-wrap,.home-mid-col,.home-right-col,#arch-right-col")
							.theiaStickySidebar({
								"containerSelector" : "",
								"additionalMarginTop" : "65",
								"additionalMarginBottom" : "15",
								"updateSidebarHeight" : false,
								"minWidth" : "767",
								"sidebarBehavior" : "modern"
							});
				});