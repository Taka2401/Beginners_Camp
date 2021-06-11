FactoryBot.define do
  factory :camp_place do
    name { 'name' }
    introduction { 'introduction' }
    address { 'address' }
    fee { '9800' }
    after(:build) do |camp_place|
      camp_place.post_images << build(:post_image, camp_place: camp_place, image: File.open('spec/fixtures/preview_image.jpg'))
    end
    association :admin
  end
end
