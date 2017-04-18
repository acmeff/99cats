class CatRentalRequestsController < ApplicationController

  def index
    @cat_rental_requests = CatRentalRequest.all
    render json: @cat_rental_requests
  end

  def show
    @cat_rental_request = CatRentalRequest.find(params[:id])
  end

  def new
    @cat_rental_request = CatRentalRequest.new
  end


  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
  end

  def destroy
    CatRentalRequest.find(params[:id]).destroy
  end

  def edit
    @cat_rental_request = CatRentalRequest.find(params[:id])
  end

  def update
    @cat_rental_request = CatRentalRequest.find(params[:id])
    if @cat_rental_request.update_attributes(cat_params)
      redirect_to cat_rental_request_url(@cat_rental_request)
    else
      render :edit
    end
  end

  def approve
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.approve!
    redirect_to cat_url(@cat_rental_request.cat)
  end

  def deny
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.deny!
    redirect_to cat_url(@cat_rental_request.cat)
  end

  private

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id,:start_date, :end_date, :status)
  end

end
