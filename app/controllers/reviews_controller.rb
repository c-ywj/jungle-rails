class ReviewsController < ApplicationController
  def create
    if(current_user)
      @review = Review.new(review_params)
      @review.user_id = current_user.id
      @review.product_id = product_id_for_review
      @review.save
      redirect_to controller: 'products', id: product_id_for_review, action: 'show'
    else
      redirect_to controller: 'sessions', action: 'new'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to controller: 'products', id: product_id_for_review, action: 'show'
  end

private

  def review_params
    params.require(:review).permit(:description, :rating)
  end

  def product_id_for_review
    params.require(:product_id)
  end

end
