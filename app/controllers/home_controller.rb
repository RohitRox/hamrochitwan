class HomeController < ApplicationController

	skip_before_filter :authenticate_user!
	layout 'social', :only => [:social]

	def index
		@latest_posts = Post.select('title, id, photo, slug, price, created_at').order("created_at desc").limit(10)
		@pages = Page.order("created_at desc").limit(10)
		@featured = Page.select('title, id, picture, slug').where(feature: true).order("created_at desc").limit(10)
	end

	def search
		@results = Page.search(params[:keywords]) + Post.search(params[:keywords])
	end

  def about
  end

  def social
  end

end