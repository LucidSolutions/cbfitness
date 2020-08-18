<cfoutput>
<!--- View Arguments --->
<cfparam name="args.print" 		default="false">
<cfparam name="args.sidebar" 	default="true">

<!--- If homepage, present homepage jumbotron --->
<cfif cb.isHomePage()>
	<section id="home" class="parallax-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3 class="wow bounceIn" data-wow-delay="0.9s">#prc.page.getTitle()#</h3>
				</div>
			</div>
		</div>
	</section>
<cfelse>
	<section id="blog-header" class="parallax-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3 class="wow bounceIn" data-wow-delay="0.9s">#prc.page.getTitle()#</h3>
				</div>
			</div>
		</div>
	</section>
</cfif>

<!--- ContentBoxEvent --->
#cb.event( "cbui_prePageDisplay" )#

<!--- Body Main --->
<section id="body-main">
	<div class="container">
		<!--- Determine span length due to sidebar or homepage --->
		<cfif cb.isHomePage() OR !args.sidebar>
			<cfset variables.span = 12>
		<cfelse>
			<cfset variables.span = 8>
		</cfif>
		<div class="col-md-#variables.span# wow fadeInUp" data-wow-delay="1s">
			
			<!--- Render Content --->
			#prc.page.renderContent()#

			<!--- Comments Bar --->
			<cfif cb.isCommentsEnabled( prc.page )>
			<section id="comments">
				#html.anchor( name="comments" )#
				<div class="post-comments">
					<div class="infoBar">
						<p>
							<button class="button2" onclick="toggleCommentForm()"> <i class="icon-comments"></i> Add Comment (#prc.page.getNumberOfApprovedComments()#)</button>						
						</p>
					</div>
					<br/>
				</div>

				<!--- Separator --->
				<div class="separator"></div>

				<!--- Comment Form: I can build it or I can quick it? --->
				<div id="commentFormShell">
					<div class="row">
						<div class="col-sm-12">
							#cb.quickCommentForm( prc.page )#
						</div>
					</div>
				</div>

				<!--- clear --->
				<hr>

				<!--- Display Comments --->
				<div id="comments">
					#cb.quickComments()#
				</div>
			</section>
			</cfif>
    	</div>

    	<!--- Sidebar --->
    	<cfif args.sidebar and !cb.isHomePage()>
			<div class="col-md-4 wow fadeInUp" data-wow-delay="1.3s" id="blog-sidenav">
				#cb.quickView( view='_pagesidebar' )#
			</div>
    	</cfif>
	</div>
</section>

<!--- ContentBoxEvent --->
#cb.event("cbui_postPageDisplay")#

</cfoutput>