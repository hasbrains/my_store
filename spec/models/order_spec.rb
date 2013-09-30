require 'spec_helper'

describe Order do

  it "calculates the total price of the order" do
    item1 = create(:item)
    item2 = create(:item, price: 20)

    order = create(:order)
    order.items << item1
    order.items << item2

    order.calculate_total
    expect(order.total).to eq(30)

  end

  it "raises exception if order has no items in it" do
    expect( -> { create(:order) }).to raise_exception
  end

end
