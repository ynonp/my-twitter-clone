class Tweet < ApplicationRecord
  belongs_to :user
  has_many :retweets, dependent: :destroy
  
  validates :content, presence: true, length: { maximum: 280 }
  
  default_scope -> { order(created_at: :desc) }
end
