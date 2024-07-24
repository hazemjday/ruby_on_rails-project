FactoryBot.define do
  factory :user do
    email {  "hazemjday7@gmail.com"}
    password { "hazemhazem" }
    admin { false }

    trait :admin do
      admin { true }
    end
  end
end
