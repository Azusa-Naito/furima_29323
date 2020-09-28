class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_item, only: [:show, :edit, :update]
  before_action :search_product, only: [:index, :show, :search]

  def index
    @items = Item.includes(:user).order('created_at DESC')
    @order = Order.includes(:item)
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
    if current_user.id != @item.user_id || Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def search
    @items = Item.search(params[:keyword]).includes(:user).order('created_at DESC')
    @order = Order.includes(:item)
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :genre_id, :status_id, :bear_id, :price, :from_id, :day_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def search_product
    @p = Item.ransack(params[:q])  # 検索オブジェクトを生成
    @results = @p.result
  end
end
