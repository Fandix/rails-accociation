class User < ApplicationRecord
  has_many :orders
  has_many :products, through: :orders, dependent: :destroy
end
