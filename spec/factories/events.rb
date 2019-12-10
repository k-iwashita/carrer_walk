FactoryBot.define do
  factory :event do
    title { "Test event" }
    location { "Osaka" }
    started_at { Time.now }
  end
end
