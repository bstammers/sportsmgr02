# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :competition do
    comp_name "Test Comp"
    points_flag true
    sets_flag true
    mvp_flag true
  end
  
  factory :invalid_competition, parent: :competition do
    comp_name nil
  end
end
