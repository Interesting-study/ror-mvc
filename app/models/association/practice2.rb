# frozen_string_literal: true
=begin
1. 각 회원은 여러 개의 주문을 가질 수 있으며, 주문을 하나의 회원에게만 연결할 수 있습니다.
2. 각 주문은 여러 개의 상품을 포함할 수 있으며, 상품은 여러 개의 주문에 포함될 수 있습니다.
3. 각 상품은 여러 개의 리뷰를 가질 수 있으며, 리뷰는 하나의 상품에만 연결될 수 있습니다.
=end

class Member < ApplicationRecord
  has_many :orders
end

class Order < ApplicationRecord
  belongs_to :member
  has_many :order_products
  has_many :products, through: :order_products
end

class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product
end

class Product < ApplicationRecord
  has_many :order_products
  has_many :orders, through: :order_products
  has_many :reviews
end

class Review < ApplicationRecord
  belongs_to :product
end
