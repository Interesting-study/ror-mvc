# frozen_string_literal: true

=begin
1. 고객 한 명이 여러 개의 도시락을 주문할 수 있다.
2. 각 도시락은 여러 명의 고객에게 판매될 수 있으며, 각 고객이 도시락을 여러 개 주문할 수 있다.
3. 각 도시락은 하나 이상의 음식을 포함한다.
4. 각 음식은 하나 이상의 도시락에 포함될 수 있다.
5. 각 음식은 하나 이상의 재료를 사용한다.
6. 각 재료는 하나 이상의 음식에서 사용된다.+
=end

class Customer
  has_many :orders
end

class BoxLunch
  has_many :foods
  has_many :order_box_lunches
end

class Food
  has_many :food_ingredients
  has_many :ingredients, through: :food_ingredients
  belongs_to :box_lunch
end

class Ingredient
  has_many :food_ingredients
  has_many :foods, through: :food_ingredients
end

class FoodIngredient
  belongs_to :food
  belongs_to :ingredient
end

class OrderBoxLunch
  belongs_to :order
  belongs_to :box_lunch
end

class Order
  belongs_to :customer
  has_many :order_box_lunches
  has_many :box_lunches, through: :order_box_lunches
end