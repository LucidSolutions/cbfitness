<cfoutput>
	<!--- ContentBoxEvent --->
	#cb.event( "cbui_prePageDisplay" )#

	<section id="blog-header" class="parallax-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3 class="wow bounceIn" data-wow-delay="0.9s">Search Results</h3>
				</div>
			</div>
		</div>
	</section>

	<!--- Body Main --->
	<section id="blog" class="parallax-section search-section">
		<!--- search Results --->
		<div class="container">
			<!--- Search Results --->
			#cb.getSearchResultsContent()#

			<!--- Search paging --->
			#cb.quickSearchPaging()#
		</div>
	</section>

	<!--- ContentBoxEvent --->
	#cb.event( "cbui_postPageDisplay" )#
</cfoutput>