class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def remember_me
    true
  end
  
  has_many :items
  has_many :tweet_comments
  has_many :item_comments
  has_many :orders
  belongs_to_active_hash :team

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は半角英数字混合で入力してください" }

  with_options presence: true do
    validates :nickname
    validates :phone, format: { with: /\A\d{10,11}\z/, message: "を半角数字のみ(10文字から11文字)で入力してください" }
    validates :full_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "を全角で入力してください" }
    validates :full_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "を全角（カナ）で入力してください" }
    validates :birth_day
    validates :sex
    validates :team_id, numericality: { other_than: 1, message: "を選択してください" }
  end

end
