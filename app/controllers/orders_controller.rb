class OrdersController < ApplicationController

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(create_orderaddress_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to "/"
    else
      render 'index', status: :unprocessable_entity
    end

  end

  private
  def create_orderaddress_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
    amount: @item.price,  # 商品の値段をキーに
    card: params[:token],
    currency: 'jpy'
    )
  end
end
