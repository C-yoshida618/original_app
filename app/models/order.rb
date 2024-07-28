class Order < ApplicationRecord
  belongs_to :user
  belongs_to :products
  has_one :address
end
