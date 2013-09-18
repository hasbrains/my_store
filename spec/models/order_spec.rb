require 'spec_helper'

describe Order do

  it "calculates the total price of the order" do
    item1 = Item.new(price: 10)
    item2 = Item.new(price: 20)

    order = Order.new
    order.items << item1
    order.items << item2

    order.calculate_total
    order.total.should == 30

  end

end
