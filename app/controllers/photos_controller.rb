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


  def destroy
    @place = Place.find(params[:place_id])

    correct_user

    if @place.photos.destroy(params[:id])
      redirect_to place_path(@place)
    else
      flash[:notice] = "Error whilst deleting photo"
      redirect_to place_path(@place)
    end
  end

  private

    def photo_params
      params.require(:photo).permit(:caption, :picture)
    end

    def correct_user
      if @place.user != current_user
        redirect_to root_path
        return flash[:alert]  = 'Not Allowed'
      end
    end

end
