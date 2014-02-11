class CommentsController < ApplicationController
	
	def create
		@commentable = find_commentable
	  @comment = @commentable.comments.build(params[:comment])
	  @comment.user = current_user
	  if @comment.save

	  	users = @commentable.comments.select('user_id').reject{|com| com.user_id == current_user.id }.map(&:user_id).uniq

	  	users << @commentable.user_id if current_user.id != @commentable.user_id && !users.include?(@commentable.user_id)

	  	user_notifications =  users.map{|u|
	  		{name: "Comment", content: "You have a new comment on #{view_context.link_to @commentable.title, @commentable.get_path}", user_id: u}
	  	}
	  	User.notify_all user_notifications

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
