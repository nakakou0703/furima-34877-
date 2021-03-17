class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :source
  belongs_to :ship_day

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/}
    validates_inclusion_of :price, in: 300..9999999
    
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :condition_id
      validates :charge_id
      validates :source_id
      validates :ship_day_id 
    end
  end
end
