class PhotosController < ApplicationController

  before_action :authenticate_user!, only: [:create]

  def create
    @place = Place.find(params[:place_id])

    if @place.photos.create(photo_params)
      redirect_to place_path(@place)
    else
      flash[:notice] = "Error whilst uploading photo"
      redirect_to place_path(@place)
    end
    
  end

  private

    def photo_params
      params.require(:photo).permit(:caption, :picture)
    end

end
