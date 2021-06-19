FactoryBot.define do
  factory :post do
    title { 'タイトル' }
    review { '感想' }
    image_id { 'image' }
    association :user
  end
end
