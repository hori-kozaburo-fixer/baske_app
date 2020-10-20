class HomeController < ApplicationController
  def index
  end

  def chat
    @tweets = Tweet.all
    @teams = Team.all
  end
end
