<cfoutput>
<cfif len( cb.themeSetting( 'blogLayout' ) )>
	<cfif cb.themeSetting( 'blogLayout' ) eq 'Two Column'>
		<div class="col-md-12 col-lg-6 wow fadeInUp" data-wow-delay="0.9s">
	<cfelse>
		<div class="col-md-12 col-lg-12 wow fadeInUp" data-wow-delay="0.9s">
	</cfif>
		<cfif entry.getFeaturedImageURL() NEQ "">
	        <div class="blog-image wow fadeInUp" data-wow-delay="0.9s">
	            <a href="#cb.linkEntry(entry)#"><img class="img-fluid" src="#entry.getFeaturedImageURL()#" alt="#entry.getTitle()#"></a>
	        </div>
		</cfif>
		<div class="blog-thumb" id="post_#entry.getContentID()#">
			<span class="blog-date">
				<cfif cb.quickCategoryLinks(entry) GT 0>#cb.quickCategoryLinks(entry)# /</cfif> <a href="#cb.linkEntry(entry)#">#entry.getDisplayPublishedDate()#</a>
			</span>
	    	<h3 class="blog-title"><a href="#cb.linkEntry(entry)#">#entry.getTitle()#</a></h3>
			<h5 id="blog-author"><a href="#cb.linkEntry(entry)#">by #entry.getAuthorName()#</a></h5>
		</div>
	</div>
</cfif>
</cfoutput>