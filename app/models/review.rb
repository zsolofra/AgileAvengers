class Review < ActiveRecord::Base
  attr_accessible :review, :likes, :dislikes
end
