class UsersController < ApplicationController

	def show
		#@user = User.find(params[:id])
		@user = User.where(:id => params[:id]).first
		if @user.blank?
      		render :text => "404 Not Found", :status => :not_found
    	end
	end	
end
