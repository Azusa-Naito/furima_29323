class OrderForm

  include ActiveModel::Model
  attr_accessor :token, :postal_code, :from_id, :city, :block_number, :apartment_name, :phone_number, :item_id, :user_id

  validates :postal_code, :from_id, :city, :block_number, :phone_number, presence: true


  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, from_id: from_id, city: city, block_number: block_number, apartment_name: apartment_name, phone_number: phone_number, order_id: order.id)
  end

end