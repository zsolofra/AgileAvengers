module PropertiesHelper
  
  def display_utilities_for(property)
    if property.utilities.match(/^(\d)+$/)
      number_to_currency(property.utilities)
    else
       property.utilities
    end
  end
  
  def display_rent_for(property) 
    if property.rent != 0
      number_to_currency(property.rent.to_s.delete('^0-9.').to_i)
    else
      property.rent = nil
    end
  end
end
