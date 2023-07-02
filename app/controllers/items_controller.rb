class ItemsController < ApplicationController
  before_action :move_to_session, only: [:new, :edit]
  before_action :move_to_index, only: [:edit]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_create_params)
    if @item.save
      redirect_to '/'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_create_params)
      redirect_to item_path(params[:id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_create_params
    params.require(:item).permit(:image, :name, :description, :category_id, :state_id, :shipcharge_id, :prefecture_id,
                                 :shipday_id, :price).merge(user_id: current_user.id)
  end

  def move_to_session
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def move_to_index
    @item = Item.find(params[:id])
    return if current_user.id == @item.user.id

    redirect_to '/'
  end
end
