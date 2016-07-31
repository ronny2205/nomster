class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@place = Place.find(params[:place_id])
		@place.comments.create(comment_params.merge(:user => current_user))
		update_average_rating
		redirect_to place_path(@place)

	end
	
	def update_average_rating
		integer_rating = {
		    '1_star' => 1.0,
		    '2_stars' => 2.0,
		    '3_stars' => 3.0,
		    '4_stars' => 4.0,
		    '5_stars' => 5.0
		}

		place_comments = @place.comments
	    sum = 0
	    place_comments.each do |comment|
	    	sum += integer_rating[comment.rating]
	    end
	    avg = (sum / place_comments.length).to_f

	    @place.update_attributes(average_rate: avg)
    end	

	private

	  def comment_params
	    params.require(:comment).permit(:message, :rating)
	  end	
end
