require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
    @tweet.image = fixture_file_upload('app/assets/images/image/コート.png')
  end

  describe '投稿機能' do

    it '全て正しい入力をすることで登録できること' do
      expect(@tweet).to be_valid
    end
    
    it 'お題が空だと登録できない' do
      @tweet.name = ""
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("お題を入力してください")
    end

    it 'お題は20文字以内でないと登録できない' do
      @tweet.name = "あ"*21
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("お題は20文字以内で入力してください")
    end
     
    it '投稿画像が空だと登録できない' do
      @tweet.image = nil
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("画像を入力してください")
    end

    it '出来事が空だと登録できない' do
      @tweet.text = ""
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("出来事を入力してください")
    end

    it '出来事は300文字以内でないと登録できない' do
      @tweet.text = "あ"*301
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("出来事は300文字以内で入力してください")
    end

    it 'テームを選択しないと登録できないこと' do
      @tweet.team_id = 1
      @tweet.valid?
      expect(@tweet.errors.full_messages).to include("チームを選択してください")
    end
  end
end
