FactoryBot.define do
  factory :buyer_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    source_id { 2 }
    municipality { '一宮市' }
    address { '1-1' }
    building_name { 'ライオンズ' }
    phone_number {'00000000000'}
  end
end
