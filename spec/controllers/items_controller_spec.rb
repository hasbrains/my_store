require 'spec_helper'

describe ItemsController do

  def self.it_renders_404_page_when_item_is_not_found(*actions)
    actions.each do |a|
      it "#{a} renders 404 page when item is not found" do
        verb = if a == :update
          "PATCH"
        elsif a == :destroy
          "DELETE"
        else
          "GET"
        end
        process a, verb, { id: 0 }
        response.status.should == 404
      end
    end
  end

  it_renders_404_page_when_item_is_not_found :show, :edit, :update, :destroy

  describe "show action" do

    it "renders show template if an item is found" do
      item = create(:item)
      get :show, id: item.id
      response.should render_template('show')
    end

  end

  describe "create action" do

    it "redirects to image cropping page if validations pass" do
      post :create, item: { name: 'Item 1', price: '10' }, admin: 1
      response.should redirect_to(crop_image_item_path(assigns(:item)))
    end

    it "renders new page again if validations fail" do
      post :create, item: { name: 'Item 1', price: 0 }, admin: 1
      response.should render_template('new')
    end

    it "redners 403 page if user is not an admin" do
      post :create, item: { name: 'Item 1', price: '10' }
      response.status.should == 403
    end

  end


  describe "destroy action" do

    it "redirects to index action when an item is destroyed successfully" do
      item = create(:item)
      delete :destroy, id: item.id, admin: 1
      response.should redirect_to(items_path)
    end

  end

end
