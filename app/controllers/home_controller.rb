class HomeController < ApplicationController
  def index
      @property = Property.all
  end

  def _search
      if params[:id]
          @property = Property.find_all_by_query(params[:id])
          else
          @property = Property.all
      end
  end

  def view
  end
end
