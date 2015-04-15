class ReviewsController < ApplicationController
  def index
    
  end
  
  def show
    
  end
  
  def new
    @review = Review.new
  end
  
  def create
    @review = @property.reviews.(review_params)
    
    if @review.save
      redirect_to reviews_path, :notice => "Your review has been added."
    else
      render "new"
    end
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
end
