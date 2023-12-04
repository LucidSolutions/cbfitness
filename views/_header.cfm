<cfoutput>

<div class="container">	
	<nav class="navbar navbar-expand-lg navbar-light sticky-navigation" id="header-main">
		<cfif cb.themeSetting( 'headerLogo' ) is "">
			<a href="#cb.linkHome()#" class="navbar-brand" title="#cb.siteTagLine()#" data-toggle="tooltip"><strong>#cb.siteName()#</strong></a>
		<cfelse>
			<a href="#cb.linkHome()#" class="navbar-brand" title="#cb.siteTagLine()#" data-toggle="tooltip"><img src="#cb.themeSetting( 'headerLogo' )#" alt="#cb.siteName()#"></a>
		</cfif>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="##collapse" aria-controls="collapse" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>

		<div class="collapse navbar-collapse" id="collapse">
	    	<ul class="navbar-nav ml-auto">
				<cfset menuData = cb.rootMenu( type="data", levels="2" )>
				<!--- Iterate and build pages --->
				<cfloop array="#menuData#" index="menuItem">
					<cfif structKeyExists( menuItem, "subPageMenu" )>
						<li class="nav-item dropdown">
							<a href="#menuItem.link#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="navbarDropdown">#menuItem.title# <small class="fas fa-chevron-down"></small></a>
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
	</nav>
</div>

<cfscript>
any function buildSubMenu( required menuData, required parentLink, required parentTitle ){
	var menu = '<ul class="dropdown-menu" aria-labelledby="navbarDropdown">';

	// Parent
	menu &= '<li><a class="dropdown-item" href="#parentLink#"><strong>#parentTitle#</strong></a></li>';

	for( var menuItem in arguments.menuData ){
		if( !structKeyExists( menuItem, "subPageMenu" ) ){
			menu &= '<li><a class="dropdown-item" href="#menuItem.link#">#menuItem.title#</a></li>';
		} else {
			menu &= '<li class="dropdown-submenu"><a href="#menuItem.link#" class="dropdown-toggle" data-toggle="dropdown">#menuItem.title#</a>';
			menu &= buildSubMenu( menuItem.subPageMenu, menuItem.link, menuItem.parentTitle );
			menu &= '</li>';
		}
	}
	menu &= '</ul>';

	return menu;
}
</cfscript>
</cfoutput>