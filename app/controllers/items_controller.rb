class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_create_params)
    if @item.save
      redirect_to "/"
    else
      render :new
    end
  end

  private
  def item_create_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :shipcharge_id, :prefecture_id, :shipday_id, :price).merge(user_id: current_user.id)
  end
end
