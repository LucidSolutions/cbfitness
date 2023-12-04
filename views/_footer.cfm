<cfoutput>

<footer id="footer">
	<div class="container">
		<div class="row">
			<div class="wow fadeInUp col-sm-12 col-lg-4" data-wow-delay="0.6s">
				<h2>About Fitness</h2>
				<p>#cb.themeSetting( 'footerBox' )#</p>
			</div>
			<div class="wow fadeInUp col-sm-12 col-lg-4" data-wow-delay="0.9s">
				<h2>Quick Links</h2>
				<ul class="navbar-nav pl-4">
					<cfset menuData = cb.rootMenu( type="data", levels="2" )>
					<!--- Iterate and build pages --->
					<cfloop array="#menuData#" index="menuItem">
						<cfif structKeyExists( menuItem, "subPageMenu" )>
							<li class="nav-item dropdown">
								<a href="#menuItem.link#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="navbarDropdown">#menuItem.title#</a>
								#buildSubMenu( menuData=menuItem.subPageMenu, parentLink=menuItem.link, parentTitle=menuItem.title )#
							</li>
						<cfelse>
							<cfif cb.isPageView() AND event.buildLink( cb.getCurrentPage().getSlug() ) eq menuItem.link>
								<li class="nav-item active">
							<cfelse>
								<li class="nav-item">
							</cfif>
								<a class="nav-link" href="#menuItem.link#">#menuItem.title#</a>
							</li>
						</cfif>
					</cfloop>

					<!--- Blog Link, verify active --->
					<cfif ( !structKeyExists(prc.cbSettings, "cb_site_disable_blog") )>
						<cfif cb.isBlogView()><li class="nav-item active"><cfelse><li class="nav-item"></cfif>
							<a class="nav-link" href="#cb.linkBlog()#">Blog</a>
						</li>
					</cfif>
		    	</ul>
			</div>
			<div class="wow fadeInUp col-sm-12 col-lg-4" data-wow-delay="1s">
				<h2>Follow us</h2>
				<ul class="social-icon">
					<li><a class="fab fa-facebook-f wow fadeIn" data-wow-delay="1s" target="_blank" href="#cb.themeSetting( 'facebookUrl' )#"></a></li>
					<li><a class="fab fa-twitter wow fadeInUp" data-wow-delay="1.3s" target="_blank" href="#cb.themeSetting( 'twitterUrl' )#"></a></li>
					<li><a class="fab fa-dribbble wow fadeIn" data-wow-delay="1.6s" target="_blank" href="#cb.themeSetting( 'dribbbleUrl' )#"></a></li>
					<li><a class="fab fa-behance wow fadeInUp" data-wow-delay="1.9s" target="_blank" href="#cb.themeSetting( 'behanceUrl' )#"></a></li>
					<li><a class="fab fa-google-plus-g wow fadeIn" data-wow-delay="2s" target="_blank" href="#cb.themeSetting( 'googlePlusUrl' )#"></a></li>
				</ul>
			</div>

			<div class="clearfix"></div>

			<div class="col-md-12 col-lg-12">
				<p class="copyright-text">Theme Developed By <a href="https://lucidoutsourcing.com/">Lucid Outsourcing Solutions Pvt. Ltd.</p>
			</div>
		</div>
		<!--- contentboxEvent --->
		#cb.event( "cbui_footer" )#
	</div>
</footer>

<cfscript>
any function buildSubMenu( required menuData, required parentLink, required parentTitle ){
    var menu = '<ul class="pl-4">';

    for( var menuItem in arguments.menuData ){
        if( !structKeyExists( menuItem, "subPageMenu" ) ){
            menu &= '<li><a href="#menuItem.link#">#menuItem.title#</a></li>';
        } else {
            menu &= '<li class="submenu"><a href="#menuItem.link#">#menuItem.title#</a>';
            menu &= buildSubMenu( menuItem.subPageMenu, menuItem.link, menuItem.parentTitle );
            menu &= '</li>';
        }
    }
    menu &= '</ul>';

    return menu;
}
</cfscript>
</cfoutput>