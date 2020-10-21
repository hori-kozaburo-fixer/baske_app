class TweetCommentsController < ApplicationController
  def create
    tweet_comment = TweetComment.create(tweet_comment_params)
    redirect_to discussion_tweet_path(tweet_comment.tweet_id) 
  end

  private
  
  def tweet_comment_params
    params.require(:tweet_comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
  end

end
