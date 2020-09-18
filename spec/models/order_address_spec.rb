require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入情報の保存' do
    before do
      sell_user = FactoryBot.create(:user)
      buy_user = FactoryBot.create(:user)
      item = FactoryBot.build(:item, user_id: sell_user.id)
      item.image = fixture_file_upload('public/images/test_image.png')
      item.save
      @order = FactoryBot.build(:order_address, item_id: item.id, user_id: buy_user.id)
    end
    
    context '購入情報が保存できるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order).to be_valid
      end
      it 'apartment_nameは空でも保存できる' do
        @order.apartment_name = nil
        expect(@order).to be_valid
      end
    end

    context '購入情報が保存できない時' do
      it 'postal_codeが空では保存できない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order.postal_code = 1234567
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code を入力してください")
      end

      it 'from_idが0では保存できない' do
        @order.from_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("From must be other than 0")
      end

      it 'cityが空では保存できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end

      it 'block_numberが空では保存できない' do
        @order.block_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Block number can't be blank")
      end

      it 'phone_numberが空では保存できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが正しい形式でないと保存できない' do
        @order.phone_number = 123-4567-89
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number は10桁もしくは11桁の半角数字で入力してください")
      end
    end
  end
end
