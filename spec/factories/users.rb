# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "Fred"
    last_name "Smith"
    username "fsmith"
    email "fred.smith@test.com"
    phone "0455 555555"
    avatar ""
    admin false
    manager false
    password "password"
    password_confirmation "password"
  end
  
   factory :invalid_user, parent: :user do
    username nil
  end

end
