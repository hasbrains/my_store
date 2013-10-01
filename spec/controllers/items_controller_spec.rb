require 'spec_helper'

describe ItemsController do

  describe "show action" do

    it "renders show template if an item is found" do
      item = create(:item)
      get :show, id: item.id
      response.should render_template('show')
    end

    it "renders 404 page if an item is not found" do
      get :show, id: 0
      response.status.should == 404
    end

  end


end
