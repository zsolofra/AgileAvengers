class Property < ActiveRecord::Base
  validates_presence_of :address, :city, :state, :zip
  validates_uniqueness_of :address
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{self.address} #{self.city} #{self.state} #{self.zip}"
  end
  
  has_many :reviews, :dependent => :destroy
  
  def self.find_all_by_query(query)
    query = query.downcase
    query = "%#{query}%"
    Property.where(['lower(address) like ? OR lower(city) like ? OR lower(state) like ?', query, query, query])
  end
end
