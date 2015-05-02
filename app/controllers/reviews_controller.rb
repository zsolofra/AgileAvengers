class ReviewsController < ApplicationController
  before_action :set_property
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :signed_in, only: [:edit, :destroy]
  before_action :authorize, only: [:edit, :destroy]
  before_action :has_time_passed, only: [:edit, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = @property.reviews.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    
    @review = @property.reviews.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @review}
    end
    
  end

  # GET /reviews/new
  def new
    
    @review = @property.reviews.build
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @review}
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = @property.reviews.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    
    @review = @property.reviews.build(review_params)
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to([@review.property, @review], :notice => 'Review was successfully created.') }
        format.xml { render :xml => @review, :status => :created, :location => [@review.property, @review]}
      else
        format.html { render :action => "new" }
        format.json { render :xml => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    
    @review = @property.reviews.find(params[:id])
    
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to [@review.property, @review], notice: 'Review was successfully updated.' }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :xml => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    
    @review = @property.reviews.find(params[:id])
    
    @review.destroy
    
    respond_to do |format|
      format.html { redirect_to(property_reviews_url) }
      format.xml { head :ok }
    end
  end
  
  def upvote
    @review = Review.find(params[:id])
    @review.upvote_by current_user
    redirect_to :back
  end
  
  def downvote
    @review = Review.find(params[:id])
    @review.downvote_by current_user
    redirect_to :back
  end

  def authorize
    unless @review.user.email == current_user.email
      flash[:notice] = "You are not the owner of this review, you are not permitted to edit."
      redirect_to property_reviews_path(@review.property, @review)
      return false
    end
  end
  
  def has_time_passed
    unless @review.created_at > 30.minutes.ago
      flash[:notice] = "You are not the owner of this review, you are not permitted to edit."
      redirect_to property_reviews_path(@review.property, @review)
      return false
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = @property.reviews.find(params[:id])
    end
  
    def set_property
      @property = Property.find(params[:property_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:property_id, :review, :user_id)
    end
end
