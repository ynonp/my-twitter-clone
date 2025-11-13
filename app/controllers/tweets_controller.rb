class TweetsController < ApplicationController
  before_action :require_login, only: [ :create, :destroy ]

  def index
    @tweets = Tweet.includes(:user, :retweets).all
    @tweet = Tweet.new if logged_in?
    @users = User.where.not(id: current_user&.id).limit(5)
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      flash[:notice] = "Tweet created successfully!"
      redirect_to root_path
    else
      flash[:alert] = "Error creating tweet"
      redirect_to root_path
    end
  end

  def destroy
    @tweet = current_user.tweets.find_by(id: params[:id])
    if @tweet
      @tweet.destroy
      flash[:notice] = "Tweet deleted successfully!"
    else
      flash[:alert] = "Tweet not found"
    end
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
