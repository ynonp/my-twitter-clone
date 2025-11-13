class RetweetsController < ApplicationController
  before_action :require_login

  def create
    tweet = Tweet.find(params[:id])
    retweet = current_user.retweets.build(tweet: tweet)
    if retweet.save
      flash[:notice] = "Retweeted successfully!"
    else
      flash[:alert] = "You have already retweeted this"
    end
    redirect_to root_path
  end

  def destroy
    retweet = current_user.retweets.find_by(tweet_id: params[:id])
    if retweet
      retweet.destroy
      flash[:notice] = "Retweet removed"
    end
    redirect_to root_path
  end
end
