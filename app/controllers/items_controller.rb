class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :item_find, only: [:show, :edit]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless user_signed_in? && current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :condition_id, :charge_id, :source_id, :ship_day_id, :category_id, :price).merge(user_id: current_user.id)
  end

  def item_find
    @item = Item.find(params[:id])
  end

end
