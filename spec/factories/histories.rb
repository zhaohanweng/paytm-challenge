FactoryGirl.define do
  factory :history do
    keyword { Faker::Coffee.blend_name }
  end
end
