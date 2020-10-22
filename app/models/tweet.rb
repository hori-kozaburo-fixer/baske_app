class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :team
  has_one_attached :image
  belongs_to :user
  has_many :tweet_comments, dependent: :destroy

  with_options presence: true do
    validates :name,   length: { maximum: 20 } 
    validates :image
    validates :text,   length: { maximum: 300 }    
    validates :team_id, numericality:{ other_than: 1, message: "を選択してください" }
  end

end
