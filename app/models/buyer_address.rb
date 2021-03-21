class BuyerAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :source_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :source_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A\d{10,11}\z/}
    validates :token
  end

  def save
    # 購入者情報を保存し、変数にbuyer代入
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    Address.create(postal_code: postal_code, source_id: source_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end

end

