class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :bear
  belongs_to_active_hash :from
  belongs_to_active_hash :day

  validates :image, :title, :text, :genre, :status, :bear, :price, :from, :day, presence: true

  validates :price,
            numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
            format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }

  validates :genre_id, :status_id, :bear_id, :from_id, :day_id, :user_id, numericality: { other_than: 0 }
end