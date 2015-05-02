class CommentsController < ApplicationController
  before_action :set_property
  before_action :set_review
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :signed_in, only: [:edit, :destroy]
  before_action :authorize, only: [:edit, :destroy]
  before_action :has_time_passed, only: [:edit, :destroy]
  
  
  def index
    @comment = @review.comments.all
   # @comment = Comment.all
    
  end
  
  def show
    @comment = @review.comments.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @comment}
    end
  end
  
  def new
    @comment = @review.comments.new
  end
  
  def create
        
    @comment = @review.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to([@property, @review, @comment], :notice => 'Comment was successfully created.') }
        format.xml { render :xml => @comment, :status => :created, :location => [@comment.review, @comment]}
      else
        format.html { render :action => "new" }
        format.json { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit 
    #@comment = @review.comments.find(params[:id])
  end
  
  def update
   @comment = @review.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { 
        redirect_to([@property, @review, @comment], :notice => 'Comment was successfully updated.') }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def upvote
    @comment = Comment.find(params[:id])
    @comment.upvote_by current_user
    redirect_to :back
  end
  
  def downvote
    @comment = Comment.find(params[:id])
    @comment.downvote_by current_user
    redirect_to :back
  end
  
  def authorize
    unless @comment.user.email == current_user.email
      flash[:notice] = "You are not the owner of this review, you are not permitted to edit."
      redirect_to property_review_comments_path(@comment.review.property, @comment.review, @comment)
      return false
    end
  end
  
  def has_time_passed
    unless @comment.created_at > 30.minutes.ago
      flash[:notice] = "You are not the owner of this review, you are not permitted to edit."
      redirect_to property_review_comments_path(@comment.review.property, @comment.review, @comment)
      return false
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:property_id])
    end
    
    def set_review
      @review = @property.reviews.find(params[:review_id])
    end
  
    def set_comment
      @comment = @review.comments.find(params[:id])
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:review_id, :likes, :dislikes, :comment, :user_id)
    end
end
