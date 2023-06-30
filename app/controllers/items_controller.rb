class ItemsController < ApplicationController

  before_action :move_to_session, only: [:new]

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
      render :new, status: :unprocessable_entity
    end
  end

  private
  def item_create_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :shipcharge_id, :prefecture_id, :shipday_id, :price).merge(user_id: current_user.id)
  end

  def move_to_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
