class PlacesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def index
    @places = Place.page(params[:page]).order('id')
  end

  def new
    @place = Place.new
  end

  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end

  def show
    @place = Place.find(params[:id])
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])

    if @place.update(place_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @place = Place.find(params[:id])

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
