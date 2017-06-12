class ReviewsController < ApplicationController
  
  before_filter :authorize

  
  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user = current_user
    
    if @review.save
      redirect_to @review.product, notice: 'Review was successfully created.'
    else
      redirect_to @review.product, notice: 'Failed to create the review'
    end
  end
  
  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back, notice: 'Product deleted!'
  end

  private
  def review_params
    params.require(:review).permit(:rating, :description)
  end
end
