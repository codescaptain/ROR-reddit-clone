class Post < ApplicationRecord
  belongs_to :account
  belongs_to :community
  has_many :comments
  has_many :votes

  validates_presence_of :title, :body, :account_id, :community_id

  def score
    if upvotes > 0 || downvotes > 0
      upvotes > 0 ? (upvotes - downvotes) : (downvotes * -1)
    else
      0
    end
  end
end
