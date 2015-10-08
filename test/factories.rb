FactoryGirl.define do
	
  factory :user do
    sequence :email do |n|
      "lulu#{n}@gmail.com"
    end
    
    password "lalalala"
    password_confirmation "lalalala"
  end



  factory :comment do
  	message "only ok"
  	rating "3_stars"
    association :user
    association :place
  end

   factory :place do
    name "The Red Mill"
    address "344 fili St, North Adams, MA"
    description "Very active place with great salads"
    association :user
  end

end