class Review < ActiveRecord::Base
  acts_as_votable
  belongs_to :property
  has_many :comments, :dependent => :destroy
  validates :user_id, :uniqueness => { :scope => :property_id,
    :message => "may only write one review per property." }
  
  ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'
  
  def score
    return self.get_upvotes.size - self.get_downvotes.size
  end
end