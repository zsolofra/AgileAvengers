include ActionView::Helpers::NumberHelper
class Property < ActiveRecord::Base
  validates_presence_of :address, :city, :state, :zip
  validates_uniqueness_of :address
  geocoded_by :full_address
  after_validation :geocode
  ratyrate_rateable 'overall_rating'

  def full_address
    "#{self.address} #{self.city} #{self.state} #{self.zip}"
  end
  
  has_many :reviews, :dependent => :destroy
  
  def self.find_all_by_query(query)
    query = query.downcase
    query = "%#{query}%"
    Property.where(['lower(address) like ? OR lower(city) like ? OR lower(state) like ?', query, query, query])
  end
  
  def rent=(value)
    if value.to_s.delete('^0-9.').to_i != 0
      write_attribute(:rent, value.to_s.delete('^0-9.').to_i)
    else
      write_attribute(:rent, nil)
    end
  end
  
  def rent
    number_to_currency(self[:rent])
  end
  
  def utilities
    if self[:utilities].match(/^(\d)+$/)
      return number_to_currency(self[:utilities])
    else
      return self[:utilities]
    end
  end
end
