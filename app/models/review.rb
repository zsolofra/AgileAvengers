class Review < ActiveRecord::Base
  acts_as_votable
  belongs_to :property
  belongs_to :user
  has_many :comments, :dependent => :destroy
  
  def score
    return self.get_upvotes.size - self.get_downvotes.size
  end
end