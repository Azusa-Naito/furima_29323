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
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('画像を入力してください')
      end
      it 'titleが空では出品できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('タイトルを入力してください')
      end
      it 'textが空では出品できない' do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('テキストを入力してください')
      end
      it 'genre_idが0では出品できない' do
        @item.genre_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it 'status_idが0では出品できない' do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it 'bear_idが0では出品できない' do
        @item.bear_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it 'from_idが0では出品できない' do
        @item.from_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'day_idが0では出品できない' do
        @item.day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('配送目安日数を選択してください')
      end
      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('価格を入力してください')
      end
      it 'priceが299以下以上では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'priceが10000000以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
    end
  end
end
