require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  test "create comment" do
    u1 = FactoryGirl.create(:user)
    sign_in u1
    p = FactoryGirl.create(:place, :user => u1)

    assert_difference 'p.comments.count' do
    	post :create, :place_id => p.id, :comment => {
    			:message => 'I loved their squash soup',
    			:rating => '4_stars'
    	}

    end	
    assert_redirected_to place_path(p)

  end
end
