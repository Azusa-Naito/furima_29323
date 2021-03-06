class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item
  before_action :sold_out
  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:token, :item_id, :postal_code, :from_id, :city, :block_number, :apartment_name, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def sold_out
    if Order.exists?(item_id: @item.id)
      redirect_to root_path
    end
  end
end
