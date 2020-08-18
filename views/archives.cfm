<cfoutput>
<section id="blog-header" class="parallax-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3 class="wow bounceIn" data-wow-delay="0.9s">Blog Archives - #prc.entriesCount# Record(s)</h3>
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
				#cb.event( "cbui_preArchivesDisplay" )#

				<!--- Archives --->
				<cfif rc.year NEQ 0>
					<div class="alert alert-info">
						Year: '#rc.year#'
						<cfif rc.month NEQ 0>- Month: '#rc.month#'</cfif>
						<cfif rc.day NEQ 0>- Day: '#rc.day#'</cfif>
					</div>
					<p class="buttonBar">
						<a href="#cb.linkBlog()#" class="btn btn-secondary btn-sm mb-4" title="Remove filter and view all entries">Remove Filter</a>
					</p>
				</cfif>

				<!---
					Display Entries using ContentBox collection template rendering
					The default convention for the template is "entry.cfm" you can change it via the quickEntries() 'template' argument.
					I could have done it manually, but why?
				 --->
				<div class="row">	
					#cb.quickEntries()#
				</div>

				<!--- Paging via ContentBox via quick HTML, again I could have done it manually, but why? --->
				<cfif prc.entriesCount>
					<div class="contentBar">
						#cb.quickPaging()#
					</div>
				</cfif>

				<!--- ContentBoxEvent --->
				#cb.event( "cbui_postArchivesDisplay" )#
			</div>

			<!--- SideBar: That's right, I can render any layout views by using quickView() or coldbox render methods --->
			<cfif args.sidebar>
				<div class="col-md-4 wow fadeInUp" data-wow-delay="1.3s" id="blog-sidenav">
					#cb.quickView( view='_blogsidebar', args=args )#
				</div>
			</cfif>
		</div>
	</div>
</section>		
</cfoutput>