class Property < ActiveRecord::Base
  validates_presence_of :address
  validates_uniqueness_of :address

  geocoded_by :address 
  after_validation :geocode
end
