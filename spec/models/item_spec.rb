require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品新規出品' do
    before do
      user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item, user_id: user.id)
      @item.image = fixture_file_upload('public/images/test_image.png')
    end

    context '商品出品ができるとき' do
      it 'image,title,text,genre_id,status_id,bear_id,price,from_id,day_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが300以上であれば出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'priceが9,999,999以下であれば出品できる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it 'ユーザーが紐づいていなければ出品できない' do
        @item.user_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'titleが空では出品できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空では出品できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'genre_idが空では出品できない' do
        @item.genre_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end
      it 'genre_idが0では出品できない' do
        @item.genre_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Genre must be other than 0')
      end
      it 'genre_idが11以上では出品できない' do
        @item.genre_id = 11
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end
      it 'status_idが空では出品できない' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'status_idが0では出品できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 0')
      end
      it 'status_idが7以上では出品できない' do
        @item.status_id = 7
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'bear_idが空では出品できない' do
        @item.bear_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Bear can't be blank")
      end
      it 'bear_idが0では出品できない' do
        @item.bear_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Bear must be other than 0')
      end
      it 'bear_idが3以上では出品できない' do
        @item.bear_id = 3
        @item.valid?
        expect(@item.errors.full_messages).to include("Bear can't be blank")
      end
      it 'from_idが空では出品できない' do
        @item.from_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("From can't be blank")
      end
      it 'from_idが0では出品できない' do
        @item.from_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('From must be other than 0')
      end
      it 'from_idが48以上では出品できない' do
        @item.from_id = 48
        @item.valid?
        expect(@item.errors.full_messages).to include("From can't be blank")
      end
      it 'day_idが空では出品できない' do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it 'day_idが0では出品できない' do
        @item.day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Day must be other than 0')
      end
      it 'day_idが4以上では出品できない' do
        @item.day_id = 4
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下以上では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10000000以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end
