module PropertiesHelper
  
  def display_utilities_for(property)
    if property.utilities.match(/^(\d)+$/)
      number_to_currency(property.utilities)
    else
       property.utilities
    end
  end
end
