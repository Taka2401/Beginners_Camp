FactoryBot.define do
  factory :reservation do
    start_date { Date.today }
  end
end