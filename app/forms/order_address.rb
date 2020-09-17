class OrderAddress
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :from_id, :city, :block_number, :apartment_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'を入力してください' }
    validates :from_id, numericality: { other_than: 0 }
    validates :block_number
    validates :city
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁もしくは11桁の半角数字で入力してください' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, from_id: from_id, city: city, block_number: block_number, apartment_name: apartment_name, phone_number: phone_number, order_id: order.id)
  end
end
