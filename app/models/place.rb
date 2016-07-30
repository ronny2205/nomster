class Place < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :photos

	geocoded_by :address
  	after_validation :geocode

	validates :name, :presence => true, :length => { :minimum => 4 }
	validates :address, :presence => true
	validates :description, :presence => true


	integer_rating = {
    '1_star' => 1,
    '2_stars' => 2,
    '3_stars' => 3,
    '4_stars' => 4,
    '5_stars' => 5
    }

    def self.average_rating

        
    	# if Place.comments.present?
	    # 	my_comments = Place.comments
	    # 	sum = 0
	    # 	my_comments.each do |comment|
	    # 		sum += integer_rating[comment.rating]
	    # 	end
	    # 	avg = (sum / my_comments.length).to_f
	    # else
	    # 	avg = 0
	    # end
	    # avg	
	    self.address
    end	
end


