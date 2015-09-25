require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'

    factory :user_with_phones do
      after(:create) do |user|
        5.times { create(:phone, user: user) }
      end
    end
  end

  factory :manufacturer do
    name "Motorola"
    country "USA"
  end

  factory :phone do
    manufacturer_id 1
    year 2007
    battery "good"
  end

end
