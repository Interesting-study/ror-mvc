# frozen_string_literal: true

class Person < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
end
