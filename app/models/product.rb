class Product < ApplicationRecord
  belongs_to :user
  has_many :orders
  has_one_attached :image_url


  with_options presence: true do
    validates :image_url
    validates :product_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }


    # 300円以上かつ9,999,999円以下で、半角数字でないと入力不可
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }


    def add_tax_sales_price
      (self.sales_price * 1.10).round
    end
  end
end
