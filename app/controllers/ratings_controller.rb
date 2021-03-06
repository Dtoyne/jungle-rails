class RatingsController < ApplicationController

  before_filter :auth_non_admin

  def create
    @rating = Rating.new(description: params[:rating][:description].strip,
                         user_id: current_user.id,
                         product_id: params[:product_id],
                         rating: params[:rating][:rating])
    if @rating.save
      redirect_to products_path(params[:product_id]),
                  notice: 'Thanks for your review!'
    else
      redirect_to products_path(params[:product_id]),
                  notice: 'Unable to save review - please provide a description'
    end
  end

  def destroy
    @rating = Rating.find params[:id]
    @rating.destroy
    redirect_to products_path(params[:product_id]), notice: 'Review Deleted'
  end
end
