class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.valid?
      @tweet.save
      redirect_to action: :index
    else 
      @tweets = Tweet.all
      render :index

    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:name, :image, :text, :team_id).merge(user_id: current_user.id)
  end
end
