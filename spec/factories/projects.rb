# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  sequence(:name) { |n| "project_#{n}" }

  factory :project do
    name
    weight 100
    user
  end

  factory :once_a_day_project, parent: :project do
    once_a_day true
  end
end
