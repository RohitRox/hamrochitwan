class UsersController < ApplicationController

	before_filter :find_user
	load_and_authorize_resource

	def show
	end

	def edit

	end

	def update
		respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'Your profile was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
	end

	private

	def  find_user
		@user = User.find params[:id]
	end

end
