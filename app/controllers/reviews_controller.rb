class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def edit
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(
      restaurant_id: params[:restaurant_id],
      user_id: current_user.id,
      body: review_params["body"],
      point: review_params["point"]
    )
    if @review.save
      redirect_to restaurant_url(@review.restaurant)
    else
      render :new
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(
      restaurant_id: params[:restaurant_id],
      user_id: current_user.id,
      body: review_params["body"],
      point: review_params["point"]
    )
      redirect_to @review.restaurant
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
    redirect_to @review.restaurant
  end

  private

  def review_params
    params.require(:review).permit(:body, :point)
  end
end
