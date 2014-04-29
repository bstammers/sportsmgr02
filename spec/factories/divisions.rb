# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :division do
    division_name "Test Div 01"
  end
  factory :invalid_division, parent: :division do
    division_name nil
  end
end
