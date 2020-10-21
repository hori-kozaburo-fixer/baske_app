class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :items
  has_many :tweet_comments
  has_many :item_comments
  has_many :orders
  belongs_to_active_hash :team

  with_options presence: true do
    validates :nickname
    validates :full_name, format: { with:  /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters.' }
    validates :full_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters.' }
    validates :birth_day
    validates :team_id, numericality: { other_than: 1 }
  end
  
end
