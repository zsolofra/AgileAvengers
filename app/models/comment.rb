class Comment < ActiveRecord::Base
  acts_as_votable
  belongs_to  :review
  belongs_to :user
  
  def score
    return self.get_upvotes.size - self.get_downvotes.size
  end
  
  def has_time_passed?
    created_at < 30.minutes.ago
  end
end
