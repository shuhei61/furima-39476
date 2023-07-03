class OrdersController < ApplicationController

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(create_orderaddress_params)
    if @order_address.valid?
      Payjp::Charge.create(
        amount: order_params[:price],  # 商品の値段
        card: order_params[:token],
        currency: 'jpy'                 # 通貨の種類（日本円）)
      @order_address.save
      redirect_to "/"
    else
      render :index, status: :unprocessable_entity
    end

  end

  private
  def create_orderaddress_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipalities, :house_number, :building_name, :phone_number, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

end
