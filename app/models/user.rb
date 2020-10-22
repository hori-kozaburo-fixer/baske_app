class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable, :omniauthable, :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def remember_me
    true
  end
  
  has_many :items
  has_many :tweet_comments
  has_many :item_comments
  has_many :orders
  belongs_to_active_hash :team

  with_options presence: true do
    validates :nickname
    validates :phone, format: { with: /\A\d{7,11}\z/, message: "を数字のみで入力してください" }
    validates :full_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "を全角で入力してください" }
    validates :full_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "を全角（カナ）で入力してください" }
    validates :birth_day
    validates :sex
    validates :team_id, numericality: { other_than: 1, message: "を選択してください" }
  end

end
