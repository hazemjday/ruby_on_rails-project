# spec/factories/homes.rb
FactoryBot.define do
  factory :home do
    image { "image1" }
    description { "A beautiful home" }
    location { "Paris" }
    size { "100 sqm" }
    price { "1000000" }
  end
end
