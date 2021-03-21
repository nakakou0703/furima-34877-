class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_id
  before_action :sold_out 

  def index
    # binding.pry
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :source_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def user_id
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: Item.find(params[:item_id]).price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def sold_out
    if @item.buyer.present? 
      redirect_to root_path
    end
  end
end

