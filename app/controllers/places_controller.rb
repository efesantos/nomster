class PlacesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @places = Place.page(params[:page]).order('id')
  end

  def new
    @place = Place.new
  end

  def create
    @place = current_user.places.create(place_params)

    if @place.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      redirect_to root_path
      return flash[:alert]  = 'Not Allowed'
    end

  end

  def update
    @place = Place.find(params[:id])

    if @place.user != current_user
      redirect_to root_path
      return flash[:alert]  = 'Not Allowed'
    end

    @place.update(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
    @place = Place.find(params[:id])

    if @place.user != current_user
      redirect_to root_path
      return flash[:alert]  = 'Not Allowed'
    end

    if @place.destroy
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :description)
  end


end
