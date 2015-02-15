class ItemsController < ApplicationController

  before_filter :find_item,      only: [:show, :edit, :update, :destroy, :upvote, :crop_image]
  before_filter :check_if_admin, only: [:edit, :update, :new, :create, :destroy]

  def index
    @items = Item
    @items = @items.where("price >= ?", params[:price_from])       if params[:price_from]
    @items = @items.where("created_at >= ?", 1.day.ago)            if params[:today]
    @items = @items.where("votes_count >= ?", params[:votes_from]) if params[:votes_from]
    @items = @items.order("votes_count DESC", "price")
  end

  def expensive
    @items = Item.where("price > 1000")
    render "index"
  end

  # /items/1 GET
  def show
    unless @item
      render text: "Page not found", status: 404
    end
    @item.views.increment
  end

  # /items/new GET
  def new
    @item = Item.new
  end

  # /items/1/edit GET
  def edit
  end

  # /items POST
  def create
    @item = Item.create(item_params)
    if @item.errors.empty?
      redirect_to crop_image_item_path(@item)
    else
      render "new"
    end
  end

  # /items/1 PUT
  def update
    @item.update_attributes(item_params)
    if @item.errors.empty?
      redirect_to crop_image_item_path(@item)
    else
      render "edit"
    end
  end

  # /items/1 DELETE
  def destroy
    @item.destroy
    render json: { success: true }
    ItemsMailer.item_destroyed(@item).deliver_now
  end

  def upvote
    @item.increment!(:votes_count)
    redirect_to action: :index
  end

  def crop_image
    if request.put?
      @item.crop_image!(params[:item][:image_crop_data])
      redirect_to item_path(@item)
    end
  end

  private

    def find_item
      @item = Item.where(id: params[:id]).first
      render_404 unless @item
    end

    def item_params
      params.require(:item).permit(:price, :weight, :real, :name, :image)
    end

end
