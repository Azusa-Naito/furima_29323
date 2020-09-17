class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find_by(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    @item = Item.find_by(params[:item_id])
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
    @item = Item.find_by(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
