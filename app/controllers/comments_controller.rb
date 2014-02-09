class CommentsController < ApplicationController
	
	def create
		@commentable = find_commentable
	  @comment = @commentable.comments.build(params[:comment])
	  @comment.user = current_user
	  if @comment.save
	  	@commentable.user.notify("Comment","You have a new comment on #{view_context.link_to @commentable.title, @commentable.get_path}") unless current_user == @commentable.user
	    flash[:notice] = "Successfully saved comment."
	  else
	    flash[:notice] = "We couldn't save your comment. Please try again."
	  end
	  redirect_to @commentable
	end

	private
	def find_commentable
	  params.each do |name, value|
	    if name =~ /(.+)_id$/
	      return $1.classify.constantize.find(value)
	    end
	  end
	  nil
	end
end
