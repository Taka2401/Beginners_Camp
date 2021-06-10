FactoryBot.define do
  factory :camp_place do
    name { 'name' }
    introduction { 'introduction' }
    address { 'address' }
    fee { '9800' }
    # after(:build) do |camp_place|
    #   camp_place.post_images_images.attach(io: File.open('spec/fixtures/preview_image.jpg'), filename: 'preview_image.jpg')
    # end
    post_images_images { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/preview_image.jpg'), 'image/jpg') }
    association :admin
  end
end
