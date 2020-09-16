class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, :birthday, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])\w{6,}\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字6文字以上で入力してください'}

  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  validates :last_name, :first_name, presence: true, format: { with: VALID_ZENKAKU_REGEX, message: 'は全角文字を使用してください' }

  VALID_K_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates :last_name_k, :first_name_k, presence: true, format: { with: VALID_K_REGEX, message: 'は全角カタカナのみで入力してください'}
end
