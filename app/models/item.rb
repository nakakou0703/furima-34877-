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
    validates :category_id, numericality: { other_than: 1 } 
    validates :condition_id, numericality: { other_than: 1 } 
    validates :charge_id, numericality: { other_than: 1 } 
    validates :source_id, numericality: { other_than: 1 } 
    validates :ship_day_id, numericality: { other_than: 1 } 
    validates :price, format: { with: /\A[0-9]+\z/}
    validates_inclusion_of :price, in: 300..9999999
  end
end
