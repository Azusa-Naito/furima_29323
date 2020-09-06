require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができるとき' do
      it "nickname,email,password,password_confirmation,last_name,first_name,last_name_k,first_name_k,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "パスワードが英数混合6文字以上であれば登録できる" do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa111"
        expect(@user).to be_valid
      end
      it "last_name,first_nameが漢字・ひらがな・カタカナであれば登録できる" do
        @user.last_name = "あア亜"
        @user.first_name = "あア亜"
        expect(@user).to be_valid
      end
      it "last_name_k,first_name_kがカタカナであれば登録できる" do
        @user.last_name_k = Gimei.last.katakana
        @user.first_name_k = Gimei.first.katakana
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができないとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "既に登録されているemailでは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = "1a1a1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが数字だけでは登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字6文字以上で入力してください")
      end
      it "passwordがアルファベットだけでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字6文字以上で入力してください")
      end
      it "passwoed_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "password_confirmatiomがpasswordと同じでなければ登録できない" do
        @user.password_confirmation = "1a1a1a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "last_nameがアルファベットでは登録できない" do
        @user.first_name = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角文字を使用してください")
      end
      it "first_nameが空では登録できない"do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "first_nameがアルファベットでは登録できない"do
        @user.first_name = Faker::Name.first_name
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角文字を使用してください")
      end
      it "last_name_kが空では登録できない" do
        @user.last_name_k = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name k can't be blank")
      end
      it "last_name_kがカタカナ以外では登録できない" do
        @user.last_name_k = Gimei.last.kanji
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name k は全角カタカナのみで入力してください")
      end
      it "first_name_kが空では登録できない" do
        @user.first_name_k = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name k can't be blank")
      end
      it "first_name_kがカタカナ以外では登録できない" do
        @user.first_name_k = Gimei.first.kanji
        @user.valid?
        expect(@user.errors.full_messages).to include("First name k は全角カタカナのみで入力してください")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end