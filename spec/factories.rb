FactoryGirl.define do

  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "Person#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
    
    factory :admin do 
      admin true
    end
  end
  
  factory :article do
    sequence(:title) { |n| "News Article #{n}" }
    sequence(:body) { |n| "News article #{n}. Here is a new announcement!" }
    user
  end
  
end