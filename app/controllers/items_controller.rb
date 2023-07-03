class ItemsController < ApplicationController
  before_action :move_to_session, only: [:new, :edit]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

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
      render 'new', status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @item.destroy
    redirect_to '/'
  end

  def update
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
    redirect_to '/' unless current_user.id == @item.user.id
    return unless @item.order.present?

    redirect_to '/'
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
