class Review < ActiveRecord::Base
  acts_as_votable
  belongs_to :property
  belongs_to :user
  has_many :comments, :dependent => :destroy
  validates :review, :presence => true
  
  def score
    return self.get_upvotes.size - self.get_downvotes.size
  end
  
  def has_time_passed?
    created_at < 30.minutes.ago
  end
end