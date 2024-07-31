class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  belongs_to :order
  #belongs_to :shipping_cost??
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"} 

end
