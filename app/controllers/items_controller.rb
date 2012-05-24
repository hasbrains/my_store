class ItemsController < ApplicationController

  Create
  Read
  Update
  Destroy

  def index
    @items = Item.all
    render text: @items.map { |i| "#{i.name}: #{i.price}"}.join("<br/>")
  end

  # /items/1 GET
  def show
  end

  # /items/new GET
  def new
  end

  # /items/1/edit GET
  def edit
  end

  # /items POST
  def create
    render text: "item created"
  end

  # /items/1 PUT
  def update
  end

  # /items/1 DELETE
  def destroy
  end

end
