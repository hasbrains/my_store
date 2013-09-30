class Order < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :items

  before_save do
    raise "no items in order!" if items.empty?
  end

  def calculate_total
    write_attribute :total, items.map(&:price).inject(:+)
  end


end
