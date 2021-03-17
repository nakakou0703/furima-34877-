class ItemsController < ApplicationController
  before_action :authenticate_user! only: [:new, :create]

  #def index
  #  @item = Item.all
  #end

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

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :condition_id, :charge_id, :source_id, :ship_day_id, :category_id, :price).merge(user_id: current_user.id)
  end
end
