class Admin::FeatureController < AdminController

	respond_to :html, :js

	def feature_process
		@post = Post.find(params[:id])
		if params[:process] == "enable"
			@post.update_attributes(hotdeal_expiry: 7.days.from_now, hotdeal_status: Post::HOTDEAL_ACTIVE)
			@post.user.notify('Hot Deal', "Congratulations. We have made your item <a href='#{@post.get_path}'>#{@post.title}</a> is made a HotDeal.")
		else
			@post.update_attributes(hotdeal: false, hotdeal_status: Post::HOTDEAL_COLD)
		end
	end

end