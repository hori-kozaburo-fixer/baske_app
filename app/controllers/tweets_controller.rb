class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @teams = Team.all
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

  def discussion
    @team = Team.find(params[:id])
    @tweets = Tweet.where(team_id: @team.id)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:name, :image, :text, :team_id).merge(user_id: current_user.id)
  end
end
