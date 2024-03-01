class Product < ApplicationRecord
  has_many :orders
  has_many :users, through: :orders, dependent: :destroy
end
