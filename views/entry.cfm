<cfoutput>
<section id="blog-header" class="parallax-section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h3 class="wow bounceIn" data-wow-delay="0.9s">Blog Detail</h3>
				<!--- <h2 class="wow fadeInUp" data-wow-delay="1.6s">#prc.entry.getTitle()#</h2> --->
			</div>
		</div>
	</div>
</section>

<!--- Body Main --->
<section  id="blog" class="parallax-section">
	<div class="container">	
		<div class="row">
			<div class="<cfif args.sidebar>col-md-8<cfelse>col-md-12</cfif>">
				<!--- ContentBoxEvent --->
				#cb.event("cbui_preEntryDisplay")#

				<div class="blog-content wow fadeInUp" data-wow-delay="1s">
                	<h3>#prc.entry.getTitle()#</h3>
					<span class="meta-date">#prc.entry.getDisplayPublishedDate()#</span>
					<cfif prc.entry.getNumberOfApprovedComments() GT 0>
						<span class="meta-comments">#prc.entry.getNumberOfApprovedComments()# Comments</span>
					</cfif>
					<span class="meta-author">#prc.entry.getAuthorName()#</span>
					<div class="blog-clear"></div>

					<cfif prc.entry.getFeaturedImageURL() NEQ "">
				        <div class="blog-image wow fadeInUp" data-wow-delay="0.9s">
				            <img class="img-fluid" src="#prc.entry.getFeaturedImageURL()#" alt="#prc.entry.getTitle()#">
				        </div>
					</cfif>
					#prc.entry.renderContent()#
				</div>	

				<cfif prc.entry.getNumberOfApprovedComments() GT 0>
					<div class="blog-comment wow fadeInUp mt-4" data-wow-delay="1s" id="comments">
						<h3>#prc.entry.getNumberOfApprovedComments()# Comments</h3>
						#cb.quickComments()#
					</div>
				</cfif>

				<div class="blog-comment-form wow fadeInUp mt-4" data-wow-delay="1.3s" id="commentFormShell">
					<h3>Leave a comment</h3>
					#cb.quickCommentForm( prc.entry )#
				</div>

				<!--- ContentBoxEvent --->
				#cb.event("cbui_postEntryDisplay")#
			</div>
		
			<cfif args.sidebar>
				<div class="col-md-4 wow fadeInUp" data-wow-delay="1.3s" id="blog-sidenav">
					#cb.quickView(view='_blogsidebar', args=args)#
				</div>
			</cfif>
		</div>
	</div>
</section>
</cfoutput>