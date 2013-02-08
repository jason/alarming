FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@gmail.com" }
    sequence(:phone_number) { |n| "415555122#{n}" }
  end
end