class TagsController < ApplicationController

  def index
  	tags = ActsAsTaggableOn::Tag.where('name ilike ?',"%#{params[:q]}%").map(&:name)
  	render json: tags
  end

end