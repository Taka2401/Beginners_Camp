FactoryBot.define do
  factory :post_image do
    image_id { 'image' }
    association :camp_place
  end
end