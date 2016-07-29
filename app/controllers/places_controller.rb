class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]

	def index
		# Param received from sort method
        sort_method = params[:sort_by] 
		
        if sort_method.present?
		  if sort_method == 'name'
		  	sort_str = 'name ASC'
		  elsif sort_method == 'rating'

# @user.comments.where(:rating => '5_stars').count

		  	sort_str = 'name ASC'
		  elsif sort_method == 'date'
		  	sort_str = 'created_at ASC'
		  end
		else
			sort_str = 'created_at ASC'
        end

		 @places = Place.paginate(:page => params[:page], :per_page => 4).order(sort_str)
	end	

	def new
		@place = Place.new
	end

	def create
		@place = current_user.places.create(place_params)
  		if @place.valid?
    		redirect_to root_path
 		else
    		render :new, :status => :unprocessable_entity
  		end
	end	

	def show
		@place = Place.find(params[:id])
		@comment = Comment.new
		@photo = Photo.new
	end	

	def edit
		 @place = Place.find(params[:id])

		 if @place.user != current_user
    		return render :text => 'Not Allowed', :status => :forbidden
  		 end
	end	

	def update
		@place = Place.find(params[:id])
		 if @place.user != current_user
    		return render :text => 'Not Allowed', :status => :forbidden
  		 end

		@place.update_attributes(place_params)
		if @place.valid?
		  redirect_to root_path
		else
		  render :edit, :status => :unprocessable_entity
		end
	end	

	def destroy
		@place = Place.find(params[:id])
		if @place.user != current_user
    		return render :text => 'Not Allowed', :status => :forbidden
  		end
  		@place.destroy
  		redirect_to root_path
	end	

	private

	def place_params
    	params.require(:place).permit(:name, :description, :address)
  	end

end
