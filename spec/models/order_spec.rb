require 'spec_helper'

describe Order do

  it "calculates the total price of the order" do
    item1 = FactoryGirl.create(:item)
    item2 = FactoryGirl.create(:item, price: 20)

    order = FactoryGirl.create(:order)
    order.items << item1
    order.items << item2

    order.calculate_total
    order.total.should == 30

  end

end
