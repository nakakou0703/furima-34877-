FactoryBot.define do
  factory :item do
    name       {Faker::Lorem.word }
    text       {Faker::Lorem.sentence}
    price      {1000}
    category_id   { 2 }
    charge_id     { 2 }
    condition_id  { 2 }
    ship_day_id   { 2 }
    source_id     { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end