class Review < ActiveRecord::Base
  acts_as_votable
  belongs_to :property
  
  def score
    return self.get_upvotes.size - self.get_downvotes.size
  end
end