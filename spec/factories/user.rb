FactoryGirl.define do
  factory :user do
    name 'bob'
    password 'password'
    password_confirmation 'password'
  end
end