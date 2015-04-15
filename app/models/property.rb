class Property < ActiveRecord::Base
  validates_presence_of :address
  validates_uniqueness_of :address
  
  has_many :reviews, :dependent => :destroy
  
  def self.find_all_by_query(query)
    query = query.downcase
    query = "%#{query}%"
    Property.where(['lower(address) like ? OR lower(city) like ? OR lower(state) like ?', query, query, query])
  end
end
