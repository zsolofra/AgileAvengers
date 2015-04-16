class CommentsController < ApplicationController
  
  def index
    @comment = @review.comments.all
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @comment}
    end
  end
  
  def show
    @comment = @review.comments.find(params[:id])
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @comment}
    end
  end
  
  def new
    @comment = @review.comments.build
    
    respond_to do |format|
      format.html
      format.xml {render :xml => @comment}
    end
  end
  
  def create
      @comment = @review.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to([@comment.review, @comment], :notice => 'Comment was successfully created.') }
        format.xml { render :xml => @comment, :status => :created, :location => [@comment.review, @comment]}
      else
        format.html { render :action => "new" }
        format.json { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @comment = @review.comments.find(params[:id])
    
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to [@comment.review, @comment], notice: 'Comment was successfully updated.' }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @comment = @review.comments.find(params[:id])
    
    @comment.destroy
    
    respond_to do |format|
      format.html { redirect_to(review_comments_url) }
      format.xml { head :ok }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = @review.comments.find(params[:id])
    end
  
    def set_review
      @review = Review.find(params[:review_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:review_id, :likes, :dislikes, :user_id, :comment)
    end
end
