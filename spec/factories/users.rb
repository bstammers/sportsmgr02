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
  end
  
  factory :invalid_user, parent: :user do
    username nil
  end
  
  factory :admin_user, parent: :user do
    admin true
  end
  
  factory :manager_user, parent: :user do
    manager true
  end
    
end
