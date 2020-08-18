<cfoutput>
<section id="blog-header" class="parallax-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3 class="wow bounceIn" data-wow-delay="0.9s">Blog</h3>
			</div>
		</div>
	</div>
</section>

<!--- Body Main --->
<section id="blog" class="parallax-section">
	<div class="container">	
		<div class="row">
			<div class="col-md-8">
				<!--- ContentBoxEvent --->
				#cb.event( "cbui_preIndexDisplay" )#
					
				<!--- Are we filtering by category? --->
				<cfif len( rc.category )>
					<p class="infoBar h2 mb-3">
						Category Filtering: '#rc.category#'
					</p>
					<p class="buttonBar">
						<a href="#cb.linkBlog()#" class="btn btn-secondary btn-sm mb-4" title="Remove filter and view all entries">Remove Filter</a>
					</p>
				</cfif>
		
				<!--- Are we searching --->
				<cfif len( rc.q )>
					<p class="infoBar h2 mb-3">Searching by: '#rc.q#'</p>
					<p class="buttonBar">
						<a href="#cb.linkBlog()#" class="btn btn-secondary btn-sm mb-4" title="Clear search and view all entries">Clear Search</a>
					</p>
					<br/>
				</cfif>
		
				<!--- Entries displayed here --->
				<div class="row">
					#cb.quickEntries()#
				</div>
				<!--- Pagination --->
				<cfif prc.entriesCount>
					<div class="contentBar">
						#cb.quickPaging()#
					</div>
				</cfif>
		
				<!--- ContentBoxEvent --->
				#cb.event( "cbui_postIndexDisplay" )#
			</div>
			<!--- SideBar --->
			<cfif args.sidebar>
				<div class="col-md-4 wow fadeInUp" data-wow-delay="1.3s" id="blog-sidenav">
					#cb.quickView( view='_blogsidebar', args=args )#
				</div>
			</cfif>
		
		</div>
	</div>
</section>		
</cfoutput>