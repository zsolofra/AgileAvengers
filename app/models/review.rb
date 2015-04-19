class Review < ActiveRecord::Base
  acts_as_votable
  belongs_to :property
end