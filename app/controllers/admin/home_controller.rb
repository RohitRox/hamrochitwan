class Admin::HomeController < AdminController

	def index
		redirect_to root_path unless current_user.admin?
		@features = Post.where(hotdeal_status: Post::HOTDEAL_PENDING, status: Post::ACTIVE, hotdeal: true).page(params[:page])
	end

end