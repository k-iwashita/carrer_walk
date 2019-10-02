FactoryBot.define do
  factory :user do
    email { "test@example.com" }
    name { "test" }
    password { "example" }
    password_confirmation { "example" }
  end
end
