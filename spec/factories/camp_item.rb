FactoryBot.define do
  factory :camp_item do
    name { 'name' }
    introduction { 'introduction' }
    image_id { 'image' }
    association :admin
  end
end