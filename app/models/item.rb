class Item < ActiveRecord::Base

  attr_accessible :price, :name, :real, :weight, :description
  validates :price, numericality: { greater_than: 0, allow_nil: true }

  validates :name, presence: true
  has_many :positions
  has_many :carts, through: :positions

end
