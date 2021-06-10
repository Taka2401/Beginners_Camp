FactoryBot.define do
  factory :camp_place_value do
    title { 'タイトル'}
    rate { 5.0 }
    association :user
    association :camp_place
  end
end