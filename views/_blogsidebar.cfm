<cfoutput>
<!--- ContentBoxEvent --->
#cb.event( "cbui_BeforeSideBar" )#

<cfif cb.themeSetting( "showEntriesSearchBlogSide", true )>
<div class="blog-categories">
	#cb.widget( "blogSearchForm" )#
</div>
</cfif>

<cfif cb.themeSetting( "showCategoriesBlogSide", true )>
<div class="blog-categories">
	<h3>Categories</h3>
	<!---
	Display Categories using ContentBox collection template rendering
	the default convention for the template is "category.cfm" you can change it via the quickCategories() 'template' argument.
	--->
	<ul class="pl-0">
		#cb.quickCategories()#		
	</ul>
</div>
</cfif>

<cfif cb.themeSetting( "showRecentEntriesBlogSide", true )>
<div class="recent-post">
	<h3>Recent Posts</h3>
	#cb.widget( 'blogRecentEntries' )#
</div>
</cfif>

<cfif cb.themeSetting( "showSiteUpdatesBlogSide", true )>
<!--- RSS Buttons --->
<div class="blog-categories">
	<h3>Site Updates</h3>
	<ul class="pl-0">
		<li><a href='#cb.linkRSS()#' title="Subscribe to our RSS Feed!"><i class="fas fa-rss"></i> RSS Feed</a></li>
	</ul>
</div>
</cfif>

<cfif cb.themeSetting( "showArchivesBlogSide", true )>
<div class="blog-categories">
	<h3>Archives</h3>
	#cb.widget( "blogArchives" )#
</div>
</cfif>
<!---#cb.widget("Meta",{titleLevel="4"})#--->

<!--- ContentBoxEvent --->
#cb.event( "cbui_afterSideBar" )#
</cfoutput>