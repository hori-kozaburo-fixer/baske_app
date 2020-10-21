class TweetsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]

  def show
    @team = Team.find(params[:id])
    @tweets = Tweet.where(team_id: @team.id)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.valid?
      @tweet.save
      redirect_to tweet_path(@tweet.team_id)
    else 
      @tweets = Tweet.all
      render :show
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    @tweet.update(tweet_params)
    if @tweet.valid?
      @tweet.save
      redirect_to tweet_path(@tweet.team_id)
    else
      render :edite
    end
  end


  def destroy 
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
  end
  
  def discussion
    @tweet = Tweet.find(params[:id])
    @tweet_comment = TweetComment.new
    @tweet_comments = TweetComment.where(tweet_id: @tweet.id)
  end

  private

  def tweet_params
    params.require(:tweet).permit(:name, :image, :text, :team_id).merge(user_id: current_user.id)
  end
end
