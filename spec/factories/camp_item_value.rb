FactoryBot.define do
  factory :camp_item_value do
    title { 'タイトル' }
    rate { 5.0 }
    association :user
    association :camp_item
  end
end
