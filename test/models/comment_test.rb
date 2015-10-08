require 'test_helper'

class CommentTest < ActiveSupport::TestCase
	test "rating_humanized" do
	 u1 = FactoryGirl.create(:user)
	 p = FactoryGirl.create(:place, :user => u1)
	 com = FactoryGirl.create(:comment, :user => u1, :place => p)
	 expected = 'three stars'
	 actual = com.humanized_rating
	 assert_equal expected, actual

	end 
end
