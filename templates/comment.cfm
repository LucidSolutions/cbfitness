<cfoutput>
<div class="media comment" id="comment_#comment.getCommentID()#">
	#cb.quickAvatar( author=comment.getAuthorEmail(), size=60 )#
	<div class="media-body ml-3">
		<h4 class="media-heading mt-0">#comment.getAuthor()#</h4>
		<h5>#dateFormat(comment.getDisplayCreatedDate(),"dd mmmm yyyy" )#</h5>
		<p>#comment.getDisplayContent()#</p>
	</div>
</div>
</cfoutput>