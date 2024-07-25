class Product < ApplicationRecord
  belongs_to :user
  has_one :order

  has_one_attached :image

  belongs_to :shipping_cost

  with_options presence: true do
    validates :image
    validates :product_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }

    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end
end
