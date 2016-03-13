module PlacesHelper


  private

    def correct_user
      if @place.user != current_user
        redirect_to root_path
        return flash[:alert]  = 'Not Allowed'
      end
    end

end
