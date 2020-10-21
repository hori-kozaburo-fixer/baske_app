class Tweet < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :team
  has_one_attached :image
  belongs_to :user
  has_many :tweet_comments

end
