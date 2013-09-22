FactoryGirl.define do

  factory :user do
    sequence(:name) { |n| "Person #{n}" }
    sequence(:email) { |n| "Person#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
  end
  
  factory :news do
    sequence(:title) { |n| "News Item #{n}" }
    sequence(:body) { |n| "News item #{n}. Here is a new announcement!" }
  end
  
end