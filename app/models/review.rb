class Review < ActiveRecord::Base
  belongs_to :property
  has_many :comments
end