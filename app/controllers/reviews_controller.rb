class ReviewsController < ApplicationController
  before_action :set_property
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    
#     property = Property.find(params[:property_id])
    
#     @reviews = property.reviews
    
    @reviews = @property.reviews.all
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @reviews}
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    
    property = Property.find(params[:property_id])
    
    @review = property.reviews.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @review}
    end
    
  end

  # GET /reviews/new
  def new
#     property = Property.find(params[:property_id])
    
#     @review = property.reviews.build
    
    @review = @property.reviews.build
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @review}
    end
  end

  # GET /reviews/1/edit
  def edit
    property = Property.find(params[:property_id])
    
    @review = property.reviews.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
#     property = Property.find(params[:property_id])
    
#     @review = property.reviews.create(params[:review])
    
    @review = @property.reviews.build(review_params)

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
    
    property = Property.find(params[:property_id])
    
    @review = property.reviews.find(params[:id])
    
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
    
    property = Property.find(params[:property_id])
    
    @review = property.reviews.find(params[:id])
    @review.destroy
    
    respond_to do |format|
      format.html { redirect_to(property_reviews_url) }
      format.xml { head :ok }
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
      params.require(:review).permit(:property_id, :likes, :dislikes, :user_id, :review)
    end
end
